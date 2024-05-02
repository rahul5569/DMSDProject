
import mysql.connector
from datetime import datetime,timedelta
import pandas as pd
import numpy as np

# Connect to MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="CityLibrary5"
)
cursor = db.cursor(buffered=True)

def reader_menu(reader_id):
    while True:
        print("\nReader Functions Menu:")
        print("1. Search a document")
        print("2. Document checkout")
        print("3. Document return")
        print("4. Document reserve")
        print("5. Compute fine")
        print("6. Print reserved documents")
        print("7. Print documents by publisher")
        print("8. Quit")

        choice = input("Enter your choice: ")
        if choice == "1":
            search_document()
        elif choice == "2":
            document_checkout(reader_id)
        elif choice == "3":
            document_return(reader_id)
        elif choice == "4":
            document_reserve(reader_id)
        elif choice == "5":
            compute_fine(reader_id)
        elif choice == "6":
            print_reserved_documents(reader_id)
        elif choice == "7":
            print_documents_by_publisher()
        elif choice == "8":
            break
        else:
            print("Invalid choice. Please try again.")

def search_document():
    keyword = input("Enter ID, title, or publisher name to search: ")
    query = "SELECT * FROM DOCUMENT WHERE DOCID = %s OR TITLE LIKE %s OR PUBLISHERID IN (SELECT PUBLISHERID FROM PUBLISHER WHERE PUBNAME LIKE %s)"
    cursor.execute(query, (keyword, f'%{keyword}%', f'%{keyword}%'))
    results = cursor.fetchall()
    if results:
        for doc in results:
            print(doc)
    else:
        print("No documents found.")

def document_checkout(reader_id):
    doc_id = input("Enter the document ID to checkout: ")
    copy_no = input("Enter the copy number: ")
    bid = input("Enter the branch ID: ")
    s = search_document_copy(doc_id,copy_no,bid)
    if s == 'borrowed' or s == 'reserved':
        return
    else:
        btime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        query = "INSERT INTO BORROWING (BDTIME) VALUES (%s)"
        cursor.execute(query, (btime,))
        cursor.execute("SELECT LAST_INSERT_ID()")
        last_inserted_id = cursor.fetchone()[0]
        query = "INSERT INTO BORROWS (BOR_NO, DOCID, COPYNO, BID, RID) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(query, (last_inserted_id, doc_id, copy_no, bid, reader_id))
        db.commit()
        print("Document checked out successfully.")

def document_return(reader_id):
    doc_id = input("Enter the document ID to return: ")
    copy_no = input("Enter the copy number: ")
    bid = input("Enter the branch ID: ")
    query = "UPDATE BORROWING SET RDTIME = %s WHERE BOR_NO IN (SELECT BOR_NO FROM BORROWS WHERE DOCID = %s AND COPYNO = %s AND BID = %s AND RID = %s) AND RDTIME IS NULL"
    cursor.execute(query, (datetime.now().strftime("%Y-%m-%d %H:%M:%S"), doc_id, copy_no, bid, reader_id))
    db.commit()
    print("Document returned successfully.")

def document_reserve(reader_id):
    doc_id = input("Enter the document ID to reserve: ")
    copy_no = input("Enter the copy number: ")
    bid = input("Enter the branch ID: ")
    s = search_document_copy(doc_id,copy_no,bid)
    if s == 'borrowed' or s == 'reserved':
        return
    else:
        dtime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        query = "INSERT INTO RESERVATION (DTIME) VALUES (%s)"
        cursor.execute(query, (dtime,))
        cursor.execute("SELECT LAST_INSERT_ID()")
        last_inserted_id = cursor.fetchone()[0]
        query = "INSERT INTO RESERVES (RID, RESERVATION_NO, DOCID, COPYNO, BID) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(query, (reader_id, last_inserted_id, doc_id, copy_no, bid))
        db.commit()
        print("Document reserved successfully.")

def compute_fine(reader_id):
    doc_id = input("Enter the document ID: ")
    copy_no = input("Enter the copy number: ")
    bid = input("Enter the branch ID: ")
    query = "SELECT BDTIME FROM BORROWING WHERE BOR_NO IN (SELECT BOR_NO FROM BORROWS WHERE DOCID = %s AND COPYNO = %s AND BID = %s AND RID = %s) AND RDTIME IS NULL"
    cursor.execute(query, (doc_id, copy_no, bid, reader_id))
    result = cursor.fetchone()
    if result:
        borrow_time = result[0]
        print('borrow_time ', borrow_time)
        diff_days = (datetime.now() - borrow_time).days
        print('diff_days ', diff_days)
        if diff_days > 20:
            fine = (diff_days -20)  * 0.2 
            print(f"Fine for this document: ${fine}")
        else:
            print("No fine.")
    else:
        print("No borrowing record found for this document.")

def print_reserved_documents(reader_id):
    query = "SELECT * FROM DOCUMENT"
    cursor.execute(query)
    results = cursor.fetchall()
    if results:
        for doc in results:
            if search_document_copy_by_reader(doc[0], reader_id):
                print(f"Document Name {doc[1]} and it's status is {search_document_copy_by_reader(doc[0], reader_id)}")
    else:
        print("No reserved documents found.")

def print_documents_by_publisher():
    publisher_name = input("Enter the publisher name: ")
    query = "SELECT DOCID, TITLE FROM DOCUMENT WHERE PUBLISHERID IN (SELECT PUBLISHERID FROM PUBLISHER WHERE PUBNAME = %s)"
    cursor.execute(query, (publisher_name,))
    results = cursor.fetchall()
    if results:
        for doc in results:
            print(doc)
    else:
        print("No documents found for this publisher.")

def admin_menu(admin_id, password):
    while True:
        print("\nAdministrative Functions Menu:")
        print("1. Add a document copy")
        print("2. Search document copy status")
        print("3. Add new reader")
        print("4. Print branch information")
        print("5. Print top borrowers in a branch")
        print("6. Print top borrowers in the library")
        print("7. Print most borrowed books in a branch")
        print("8. Print most borrowed books in the library")
        print("9. Print popular books by year")
        print("10. Print average fine by branch and time period")
        print("11. Quit")

        choice = input("Enter your choice: ")
        if choice == "1":
            add_document_copy()
        elif choice == "2":
            doc_id = input("Enter the document ID: ")
            copy_no = input("Enter the copy number: ")
            bid = input("Enter the branch ID: ")
            s = search_document_copy(doc_id,copy_no,bid)
        elif choice == "3":
            add_new_reader()
        elif choice == "4":
            print_branch_info()
        elif choice == "5":
            print_top_borrowers_branch()
        elif choice == "6":
            print_top_borrowers_library()
        elif choice == "7":
            print_most_borrowed_books_branch()
        elif choice == "8":
            print_most_borrowed_books_library()
        elif choice == "9":
            print_popular_books_by_year()
        elif choice == "10":
            print_avg_fine_by_branch_period()
        elif choice == "11":
            break
        else:
            print("Invalid choice. Please try again.")

def add_document_copy():
    doc_id = int(input("Enter the DOC ID: "))
    copy_no = input("Enter the copy number: ")
    bid = input("Enter the branch ID: ")
    pos = input("Enter the postion: ")
    query = "INSERT INTO COPY (DOCID, COPYNO, BID,POSITION) VALUES (%s, %s, %s,%s)"
    cursor.execute(query, (doc_id, copy_no, bid,pos))
    db.commit()
    print("Document copy added successfully.")

def search_document_copy(doc_id,copy_no,bid):
    #doc_id = input("Enter the document ID: ")
    #copy_no = input("Enter the copy number: ")
    #bid = input("Enter the branch ID: ")
    
    query = "SELECT * FROM BORROWING WHERE BOR_NO IN (SELECT BOR_NO FROM BORROWS WHERE DOCID = %s AND COPYNO = %s AND BID = %s) AND RDTIME IS NULL"
    cursor.execute(query, (doc_id, copy_no, bid))
    resultBorrow = cursor.fetchall()
   
    
    #query = "SELECT * FROM RESERVATION WHERE RES_NO IN (SELECT RESERVATION_NO FROM RESERVES WHERE DOCID = %s AND COPYNO = %s AND BID = %s) AND ((HOUR(DTIME) > 18 AND (DATE_ADD(DTIME,INTERVAL 1 DAY) <= CURDATE() AND HOUR(NOW()) < 18)) OR (HOUR(DTIME) < 18 AND HOUR(NOW()) < 18))"
    query = "SELECT * FROM RESERVATION WHERE RES_NO IN (SELECT RESERVATION_NO FROM RESERVES WHERE DOCID = %s AND COPYNO = %s AND BID = %s) AND ((HOUR(DTIME) > 18 AND (DATE(DATE_ADD(DTIME, INTERVAL 1 DAY)) >= CURDATE() AND HOUR(NOW()) < 18)) OR (HOUR(DTIME) < 18 AND HOUR(NOW()) < 18 AND DATE(DTIME) = CURDATE()))"
    cursor.execute(query, (doc_id, copy_no, bid))
    resultReservation = cursor.fetchall()
    
    query = "SELECT * FROM COPY WHERE DOCID IN (SELECT DOCID FROM COPY WHERE DOCID = %s AND COPYNO = %s AND BID = %s)"
    cursor.execute(query, (doc_id, copy_no, bid))
    result = cursor.fetchall()
    
    if len(resultBorrow) > 0:
        print('Document is borrowed')
        return 'borrowed'
    elif len(resultReservation) > 0:
         print('Document is reserved')
         print(resultReservation)
         return 'reserved'
    elif len(result) > 0:
        print('Document is available')
        return
    else:
        print("Document copy not found.")
        return

def search_document_copy_by_reader(doc_id,reader_id):
    #doc_id = input("Enter the document ID: ")
    #copy_no = input("Enter the copy number: ")
    #bid = input("Enter the branch ID: ")
    
    query = "SELECT * FROM BORROWING WHERE BOR_NO IN (SELECT BOR_NO FROM BORROWS WHERE DOCID = %s AND RID = %s) AND RDTIME IS NULL"
    cursor.execute(query, (doc_id,reader_id))
    resultBorrow = cursor.fetchall()
   
    
    query = "SELECT * FROM RESERVATION WHERE RES_NO IN (SELECT RESERVATION_NO FROM RESERVES WHERE DOCID = %s AND RID =%s) AND ((HOUR(DTIME) > 18 AND (DATE_ADD(DTIME,INTERVAL 1 DAY) <= CURDATE() AND HOUR(NOW()) < 18)) OR (HOUR(DTIME) < 18 AND HOUR(NOW()) < 18))"
    cursor.execute(query, (doc_id,reader_id))
    resultReservation = cursor.fetchall()

    if len(resultBorrow) > 0:
        return 'borrowed'
    elif len(resultReservation) > 0:
         return 'reserved'
    else:
        return

def add_new_reader():
    rname = input("Enter the reader name: ")
    rtype = input("Enter the reader type: ")
    address = input("Enter the address: ")
    phone = input("Enter the phone number: ")
    query = "INSERT INTO READER (RTYPE,RNAME, RADDRESS, PHONE_NO) VALUES (%s, %s, %s,%s)"
    cursor.execute(query, (rtype, rname,address, phone))
    db.commit()
    print("New reader added successfully.")

def print_branch_info():
    bid = input("Enter the branch ID: ")
    query = "SELECT LNAME, LOCATION FROM BRANCH WHERE BID = %s"
    cursor.execute(query, (bid,))
    result = cursor.fetchone()
    if result:
        print(result)
    else:
        print("Branch not found.")

def print_top_borrowers_branch():
    n = int(input("Enter top N records to be displayed: "))
    bid = input("Enter the branch ID: ")
    query = "SELECT RID, COUNT(*) AS BorrowCount FROM BORROWS WHERE BID = %s GROUP BY RID ORDER BY BorrowCount DESC LIMIT %s"
    cursor.execute(query, (bid,n))
    results = cursor.fetchall()
    if results:
        for borrower in results:
            print(borrower)
    else:
        print("No borrowers found for this branch.")

def print_top_borrowers_library():
    n = int(input("Enter top N records to be displayed: "))
    query = "SELECT RID, COUNT(*) AS BorrowCount FROM BORROWS GROUP BY RID ORDER BY BorrowCount DESC LIMIT %s"
    cursor.execute(query,(n,))
    results = cursor.fetchall()
    if results:
        for borrower in results:
            print(borrower)
    else:
        print("No top borrowers found in the library.")

def print_most_borrowed_books_branch():
    n = int(input("Enter top N records to be displayed: "))
    bid = input("Enter the branch ID: ")
    query = "SELECT (SELECT title FROM DOCUMENT WHERE DOCID = B.DOCID), COUNT(*) AS BorrowCount FROM BORROWS B WHERE BID = %s GROUP BY DOCID ORDER BY BorrowCount DESC LIMIT %s"
    cursor.execute(query, (bid,n))
    results = cursor.fetchall()
    if results:
        for doc in results:
            print(doc)
    else:
        print("No documents found for this branch.")

def print_most_borrowed_books_library():
    n = int(input("Enter top N records to be displayed: "))
    query = "SELECT (SELECT title FROM DOCUMENT WHERE DOCID = B.DOCID), COUNT(*) AS BorrowCount FROM BORROWS B GROUP BY DOCID ORDER BY BorrowCount DESC LIMIT %s"
    cursor.execute(query,(n,))
    results = cursor.fetchall()
    if results:
        for doc in results:
            print(doc)
    else:
        print("No documents found in the library.")

def print_popular_books_by_year():
    year = input("Enter the year: ")
    query = "SELECT (SELECT title FROM DOCUMENT WHERE DOCID = B.DOCID), COUNT(*) AS BorrowCount FROM BORROWS B WHERE BOR_NO IN (SELECT BOR_NO FROM BORROWING WHERE YEAR(BDTIME) = %s)  GROUP BY DOCID ORDER BY BorrowCount DESC LIMIT 10"
    cursor.execute(query, (year,))
    results = cursor.fetchall()
    if results:
        for doc in results:
            print(doc)
    else:
        print("No popular books found for this year.")

def print_avg_fine_by_branch_period():
    #need change
    #bid = input("Enter the branch ID: ")
    df = pd.DataFrame(columns=['BID','Rate'])
    start_date = input("Enter the start date (YYYY-MM-DD): ")
    end_date = input("Enter the end date (YYYY-MM-DD): ")
    query = "SELECT BID,AVG(DATEDIFF(RDTIME, BDTIME)-20) AS AvgFine FROM BORROWING B INNER JOIN BORROWS S ON  B.BOR_NO=S.BOR_NO  WHERE  DATEDIFF(RDTIME, BDTIME) > 20 AND BDTIME >= %s AND BDTIME <%s GROUP BY S.BID;"
    cursor.execute(query, (start_date, end_date))
    result = cursor.fetchall()
    if result:
        for res in result:
            print(f"Average fine for branch {res[0]} is {res[1]}")
    else:
        print("No fines recorded for this period.")

def main():
    print("Welcome to the CITY Library System!")
    role = input("Are you a Reader or an Administrator? (R/A): ").upper()
    if role == "R":
        reader_id = input("Enter your reader ID: ")
        query = "SELECT * FROM READER WHERE RID = %s"
        cursor.execute(query, (reader_id,))
        result = cursor.fetchone()
        if result:
            print("Login successful!")
            reader_menu(reader_id)
        else:
            print("Invalid reader ID")
    elif role == "A":
        admin_id = input("Enter your admin ID: ")
        admin_password = input("Enter your password: ")
        if admin_id == 'Rahul' and admin_password == '123': 
            print("Login successful!")
            admin_menu(admin_id, admin_password)
        else:
            print("Invalid admin ID or password. Please try again.")
    else:
        print("Invalid choice. Please select 'R' for Reader or 'A' for Administrator.")

if __name__ == "__main__":
    main()