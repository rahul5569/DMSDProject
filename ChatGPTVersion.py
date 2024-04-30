import mysql.connector
from datetime import datetime

# Connect to MySQL database
db = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="root",
    database="CityLibrary3"
)
cursor = db.cursor()

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
    bor_no = input("Enter the borrowing number: ")
    btime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    query = "INSERT INTO BORROWING (BOR_NO, BDTIME, RID) VALUES (%s, %s, %s)"
    cursor.execute(query, (bor_no, btime, reader_id))
    query = "INSERT INTO BORROWS (BOR_NO, DOCID, COPYNO, BID, RID) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(query, (bor_no, doc_id, copy_no, bid, reader_id))
    db.commit()
    print("Document checked out successfully.")

def document_return(reader_id):
    doc_id = input("Enter the document ID to return: ")
    copy_no = input("Enter the copy number: ")
    bid = input("Enter the branch ID: ")
    query = "UPDATE BORROWING SET RDTIME = %s WHERE BOR_NO = (SELECT BOR_NO FROM BORROWS WHERE DOCID = %s AND COPYNO = %s AND BID = %s AND RID = %s)"
    cursor.execute(query, (datetime.now().strftime("%Y-%m-%d %H:%M:%S"), doc_id, copy_no, bid, reader_id))
    db.commit()
    print("Document returned successfully.")

def document_reserve(reader_id):
    res_no = input("Enter the reservation number: ")
    doc_id = input("Enter the document ID to reserve: ")
    copy_no = input("Enter the copy number: ")
    bid = input("Enter the branch ID: ")
    query = "INSERT INTO RESERVES (RID, RESERVATION_NO, DOCID, COPYNO, BID) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(query, (reader_id, res_no, doc_id, copy_no, bid))
    db.commit()
    print("Document reserved successfully.")

def compute_fine(reader_id):
    doc_id = input("Enter the document ID: ")
    copy_no = input("Enter the copy number: ")
    bid = input("Enter the branch ID: ")
    query = "SELECT BDTIME FROM BORROWING WHERE BOR_NO = (SELECT BOR_NO FROM BORROWS WHERE DOCID = %s AND COPYNO = %s AND BID = %s AND RID = %s)"
    cursor.execute(query, (doc_id, copy_no, bid, reader_id))
    result = cursor.fetchone()
    if result:
        borrow_time = result[0]
        diff_days = (datetime.now() - borrow_time).days
        if diff_days > 7:
            fine = (diff_days - 7) * 2  # Assuming fine is $2 per day after 7 days
            print(f"Fine for this document: ${fine}")
        else:
            print("No fine.")
    else:
        print("No borrowing record found for this document.")

def print_reserved_documents(reader_id):
    query = "SELECT * FROM DOCUMENT WHERE DOCID IN (SELECT DOCID FROM RESERVES WHERE RID = %s)"
    cursor.execute(query, (reader_id,))
    results = cursor.fetchall()
    if results:
        for doc in results:
            print(doc)
    else:
        print("No reserved documents found.")

def print_documents_by_publisher():
    publisher_name = input("Enter the publisher name: ")
    query = "SELECT DOCID, TITLE FROM DOCUMENT WHERE PUBLISHERID = (SELECT PUBLISHERID FROM PUBLISHER WHERE PUBNAME = %s)"
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
            search_document_copy()
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
    doc_id = input("Enter the document ID: ")
    copy_no = input("Enter the copy number: ")
    bid = input("Enter the branch ID: ")
    pos = input("Enter the postion: ")
    query = "INSERT INTO COPY (DOCID, COPYNO, BID,POSITION) VALUES (%s, %s, %s,%s)"
    cursor.execute(query, (doc_id, copy_no, bid,pos))
    db.commit()
    print("Document copy added successfully.")

def search_document_copy():
    doc_id = input("Enter the document ID: ")
    copy_no = input("Enter the copy number: ")
    bid = input("Enter the branch ID: ")
    query = "SELECT * FROM COPY WHERE DOCID = %s AND COPYNO = %s AND BID = %s"
    cursor.execute(query, (doc_id, copy_no, bid))
    result = cursor.fetchone()
    if result:
        print(result)
    else:
        print("Document copy not found.")

def add_new_reader():
    rid = input("Enter the reader ID: ")
    rname = input("Enter the reader name: ")
    rtype = input("Enter the reader type: ")
    address = input("Enter the address: ")
    phone = input("Enter the phone number: ")
    query = "INSERT INTO READER (RID, RTYPE,RNAME, RADDRESS, PHONE_NO) VALUES (%s, %s, %s, %s,%s)"
    cursor.execute(query, (rid,rtype, rname,address, phone))
    db.commit()
    print("New reader added successfully.")

def print_branch_info():
    bid = input("Enter the branch ID: ")
    query = "SELECT * FROM BRANCH WHERE BID = %s"
    cursor.execute(query, (bid,))
    result = cursor.fetchone()
    if result:
        print(result)
    else:
        print("Branch not found.")

def print_top_borrowers_branch():
    bid = input("Enter the branch ID: ")
    query = "SELECT RID, COUNT(*) AS BorrowCount FROM BORROWS WHERE BID = %s GROUP BY RID ORDER BY BorrowCount DESC LIMIT 10"
    cursor.execute(query, (bid,))
    results = cursor.fetchall()
    if results:
        for borrower in results:
            print(borrower)
    else:
        print("No borrowers found for this branch.")

def print_top_borrowers_library():
    query = "SELECT RID, COUNT(*) AS BorrowCount FROM BORROWS GROUP BY RID ORDER BY BorrowCount DESC LIMIT 10"
    cursor.execute(query)
    results = cursor.fetchall()
    if results:
        for borrower in results:
            print(borrower)
    else:
        print("No top borrowers found in the library.")

def print_most_borrowed_books_branch():
    bid = input("Enter the branch ID: ")
    query = "SELECT DOCID, COUNT(*) AS BorrowCount FROM BORROWS WHERE BID = %s GROUP BY DOCID ORDER BY BorrowCount DESC LIMIT 10"
    cursor.execute(query, (bid,))
    results = cursor.fetchall()
    if results:
        for doc in results:
            print(doc)
    else:
        print("No documents found for this branch.")

def print_most_borrowed_books_library():
    query = "SELECT DOCID, COUNT(*) AS BorrowCount FROM BORROWS GROUP BY DOCID ORDER BY BorrowCount DESC LIMIT 10"
    cursor.execute(query)
    results = cursor.fetchall()
    if results:
        for doc in results:
            print(doc)
    else:
        print("No documents found in the library.")

def print_popular_books_by_year():
    year = input("Enter the year: ")
    query = "SELECT DOCID, COUNT(*) AS BorrowCount FROM BORROWS WHERE YEAR(BDTIME) = %s GROUP BY DOCID ORDER BY BorrowCount DESC LIMIT 10"
    cursor.execute(query, (year,))
    results = cursor.fetchall()
    if results:
        for doc in results:
            print(doc)
    else:
        print("No popular books found for this year.")

def print_avg_fine_by_branch_period():
    bid = input("Enter the branch ID: ")
    start_date = input("Enter the start date (YYYY-MM-DD): ")
    end_date = input("Enter the end date (YYYY-MM-DD): ")
    query = "SELECT AVG(DATEDIFF(RDTIME, BDTIME) * 2) AS AvgFine FROM BORROWING WHERE BID = %s AND BDTIME BETWEEN %s AND %s"
    cursor.execute(query, (bid, start_date, end_date))
    result = cursor.fetchone()
    if result[0]:
        print(f"Average fine for this period: ${result[0]}")
    else:
        print("No fines recorded for this period.")

def main():
    print("Welcome to the Public Library System!")
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