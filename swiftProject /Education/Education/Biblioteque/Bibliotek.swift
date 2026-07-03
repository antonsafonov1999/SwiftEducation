////
////  Bibliotek.swift
////  Education
////
////  Created by Anton Safonov on 03/07/2026.
////
//

class Reader{
    var id: Int = 0
    var name: String = ""
    var takesBoooks: [Book] = []
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
}
class Book {
    var id: Int = 0
    var name: String = ""
    var author: String = ""
    var countStr: Int = 0
    var status: statusBook = .valide
    
    enum statusBook {
        case valide
        case taken
        case losed
        case toReparation
    }
    init(id: Int, name: String, author: String, countStr: Int, status: statusBook) {
        self.id = id
        self.name = name
        self.author = author
        self.countStr = countStr
        self.status = status
    }
}
struct DataBase{
    var readers: [Reader] = []
    var books: [Book] = []
    
    mutating func saveReader(reader: Reader){
        self.readers.append(reader)
    }
    mutating func saveBook(book: Book){
        self.books.append(book)
    }
    func getAllReader()->[Reader]{
        if !self.readers.isEmpty{return self.readers} else {print("На данный момент нету ни одного читателя"); return []}
    }
    func getAllBooks() ->[Book]{
        if !self.books.isEmpty{return self.books} else {print("На данный момент нету ни одной книги"); return []}
    }
    
}

class managersBook{
    var database: DataBase = DataBase()
    
    func addBook(data: Book){//* добавить книгу
        database.books.append(data)
        database.saveBook(book: data)
    }
    func deleteBookforId(){//* удалить книгу по ID
        print("удаляем книгу по id - \tвыбери книгу по номеру в списке")
        printDisponibleBook()
        var numero : Int? =  Int(readLine() ?? "")
        if  numero != nil{
            database.books.remove(at: numero!)
        }
    }
   
    func giveBookToPerson(){//* выдать книгу читателю
        printDisponibleBook()
        printAllReaders(DB: database)
        print("выбери номер книги и читателя\nКнига -")
        var BookNum : Int? =  Int(readLine() ?? "")
        print("Читатель -")
        var ReaderNum : Int? =  Int(readLine() ?? "")
        if  BookNum != nil && ReaderNum != nil{
            database.books[BookNum!].status = .taken
            database.readers[ReaderNum!].takesBoooks.append(database.books[BookNum!])
        }
    }
    func returnBook(){//* вернуть книгу
        printDisponibleBook()
        printAllReaders(DB: database)
        print("выбери номер книги и читателя\nКнига -")
        var BookNum : Int? =  Int(readLine() ?? "")
        print("Читатель -")
        var ReaderNum : Int? =  Int(readLine() ?? "")
        if  BookNum != nil && ReaderNum != nil{
            database.books[BookNum!].status = .valide
            database.readers[ReaderNum!].takesBoooks.remove(at: (database.books[BookNum!]).id)
        }
    }
    func PrintInfo(){
        print("Что ты хочешь вывести?\n1. Все книги\n2. Все читатели\n3. Все книги и читатели\n4. Все доступные книги\n")
        let choose = Int(readLine() ?? "1")
        switch choose {
            case 1:
            printAllBooks(DB: self.database)
        case 2:
            printAllReaders(DB: self.database)
        case 3:
            printAllBooks(DB: self.database)
            printAllReaders(DB: self.database)
        case 4:
            printDisponibleBook()
        default: break
        }
    }
    private func printAllBooks(DB: DataBase){//* вывести статистику (сколько всего книг каждого статуса)
        var mass = DB.getAllBooks()
        for (I, N) in mass.enumerated(){
            print("Книга N:\(N.id) \(N.name) Автор: \(N.author) Количество страниц: \(N.countStr) Статус: \(N.status) \n")
        }
    }
   private func printAllReaders(DB: DataBase){//* вывести статистику (сколько всего читателей каждого статуса)
        var mass = DB.getAllReader()
            for (I, N) in mass.enumerated(){
                print("Читатель N:\(N.id) \(N.name) Имеет список книг в количестве:\(N.takesBoooks.count) \n\(N.takesBoooks)\n")
            }

    }
   private func printDisponibleBook(){//* вывести только доступные книги
        var mass = database.getAllBooks()
        for (I, N) in mass.enumerated(){
            if N.status == .valide{print("Имеется книга: ID\(N.id) \(N.name) автора \(N.author)")}
        }
    }
    func RegistrationReader(person : Reader){
        database.readers.append(person)
        database.saveReader(reader: person)
    } //* зарегистрировать читателя;
    func DoneBooksToReader(){
        
    } //* выдать книгу конкретному читателю;
    
    func printDisponibleBookToReader(){
        var massBook = database.getAllBooks()
        var massReader = database.getAllReader()
        for n in massReader {
            print("читатель \(n.name) имеет книги:\n")
            if n.takesBoooks.count != 0{
                for (x,i) in n.takesBoooks.enumerated(){
                    print("\(massBook[x].name)")
                }
            }else{print("нет книг")}
        }
    } //* показать, какие книги сейчас у читателя.
}
