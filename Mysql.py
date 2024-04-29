import mysql.connector

def login(cursor):

    print('Enter card number')
    cardno = input()
    s = 'SELECT RID FROM READER WHERE RID =' + cardno
    cursor.execute(s)
    results = cursor.fetchall()
    print('RID resullts', results)
    
    if  len(results) > 0:
        print('login successfull')
        return
    else:
        print('Login unsuccesfull')
        exit(1)
        
def readerFun():
    print('1.Search a document by ID, title, or publisher name.\n2.Document checkout.\n3.Document return.\n4.Document reserve.\n 5.Compute fine for a document copy borrowed by a reader based on the current date.\n 6.Print the list of documents reserved by a reader and their status.\n 7.Print the document id and document titles of documents published by a publisher.\n8.Quit.') 
    menuInput = input()
    match menuInput:
        case '1':
            print('Enter Did, title or  publisher name')
            menuInput = input()
            print('type ' , type(menuInput))
            s = 'SELECT * FROM DOCUMENT WHERE DOCID ='  + "\'" + menuInput + "\'"
            #s = "SELECT * FROM DOCUMENT WHERE TITLE =" + "\'" + menuInput + "\'"
            cursor.execute(s)
            results = cursor.fetchall()
            if  len(results) > 0:
                print('results',results)
            else:
                s = "SELECT * FROM DOCUMENT WHERE TITLE =" + "\'" + menuInput + "\'"
                cursor.execute(s)
                results = cursor.fetchall()
                if  len(results) > 0:
                    print('results',results)
                else:
                    s = "SELECT * FROM DOCUMENT WHERE PUBLISHERID = (SELECT PUBLISHERID FROM PUBLISHER WHERE PUBNAME = " + "\'" + menuInput + "\'" + " limit 1)"
                    cursor.execute(s)
                    results = cursor.fetchall()
                    if  len(results) > 0:
                        print('results',results)
                    else:
                        print('No records found')
                        exit(1)

def adminFunc():
    return

if __name__ == "__main__":
    
    # Create a connection to the MySQL database
    connection = mysql.connector.connect(
        host='127.0.0.1',
        user='root',
        password='root',
        database='CITYLIBRARY2'
    )

    # Create a cursor object
    cursor = connection.cursor()

    # Execute a SQL query
    cursor.execute('SELECT * FROM DOCUMENT')
    
    # Get the results of the query
    results = cursor.fetchall()
    print('results', results)

    
    print('Database initalized')
    
    #login function
    
    login(cursor)
    
    #main menu
    print('Main menu')
    
    print('1.Reader functions\n 2.Administrative Functions \n 3.Quit')
    
    menuInput = input()
    
    match menuInput:
        case '1':
            readerFun()
        case '2':
            adminFunc()
        case '3':
            exit(1)
    
    
    
    