//
//  Banck.swift
//  Education
//
//  Created by Anton on 26/10/2025.
//

//Ты пишешь мини-программу банкомата, где пользователь может:
//    1.    Создать счёт (ввести имя и начальный баланс)
//    2.    Пополнить счёт
//    3.    Снять деньги
//    4.    Проверить баланс
//    5.    Выйти из программы

enum ErrorNomPrenom: Error
{
    case nomIsEmpty
    case nomIsTooLong
    case nomIsTooShort
    case PrenomIsEmpty
    case PrenomIsTooLong
    case PrenomIsTooShort
}
enum ErrorAccount : Error
{
    case negativeBalance}


struct Person
{
    static var nom: String = "None"
    static var surnNom: String = "None"
    
     init(_ Nom: String, _ surNom: String) {
      
        do {
                    let nom = try Person.validationNom(Nom)
                    let surNom = try Person.validationSurnom(surNom)
                    Person.nom = nom
                    Person.surnNom = surNom
                }
                catch ErrorNomPrenom.nomIsEmpty { print("Nom is empty") }
                catch ErrorNomPrenom.nomIsTooLong { print("Nom is too long") }
                catch ErrorNomPrenom.nomIsTooShort { print("Nom is too short") }
                catch ErrorNomPrenom.PrenomIsEmpty { print("Prenom is empty") }
                catch ErrorNomPrenom.PrenomIsTooLong { print("Prenom is too long") }
                catch ErrorNomPrenom.PrenomIsTooShort { print("Prenom is too short") }
                catch { print("Unknown error") }
    }
    static func validationNom(_ nom: String) throws ->  String
    {
        if nom.isEmpty {throw ErrorNomPrenom.nomIsEmpty}
        if nom.count > 10 { throw ErrorNomPrenom.nomIsTooLong}
        if nom.count < 3 { throw ErrorNomPrenom.nomIsTooShort}
        return nom
    }
    static func validationSurnom(_ surNom: String) throws ->  String
    {
        if surNom.isEmpty {throw ErrorNomPrenom.PrenomIsEmpty}
        if surNom.count > 10 { throw ErrorNomPrenom.PrenomIsTooLong}
        if surNom.count < 3 { throw ErrorNomPrenom.PrenomIsTooShort}
        return surNom
    }
    static func getInfoPerson() -> String{return "Name - \(Person.nom), SurName - \(Person.surnNom)"}
    
}



class BankAccount
{
    static var balanceAccount: Int = 0
    init(){}
    init (_ balance: Int) throws
    {
        do {
            var ValidBalance = try BankAccount.validationBalance(balance)
            BankAccount.balanceAccount = ValidBalance
        }
        catch ErrorAccount.negativeBalance { print("Balance is negative") }
    }
    static func validationBalance (_ balance: Int) throws -> Int
    {
        if balance < 0 {throw ErrorAccount.negativeBalance}
        if balance >= 0 {return balance}
        return balance
    }
    func createAccount(_ name: String, _ Surname: String, balance: Int)
    {
        Person.init(name, Surname)
        BankAccount.balanceAccount = balance
        
    }
    func GetInformationAccount()
    {
        print("""
            //-- информация о аккаунте
            Имя - \(Person.nom)
            Фамилия - \(Person.surnNom)
            Баланс - \(BankAccount.balanceAccount)      
            """)
    }
    func AddBalance (_ sum: Int){BankAccount.balanceAccount += sum; print("Баланс пополнен на \(sum)")}
    func takeBalance (_ sum: Int) {
        if sum > BankAccount.balanceAccount
            {print("Недостаточно средств \n текущий счет: \(BankAccount.balanceAccount)")}
        else
        {BankAccount.balanceAccount -= sum}
    }
    
    static func Menu ()
    {
        var Acc = BankAccount()
        while true
        {
            print("""
                выбери пункт из меню
                //    1.    Создать счёт (ввести имя и начальный баланс)
                //    2.    Пополнить счёт
                //    3.    Снять деньги
                //    4.    Проверить баланс
                //    5.    Выйти из программы
                """)
            var numeric = Int(readLine() ?? "") ?? 5
            
            switch numeric
            {
            case 1:
                print("Введите имя")
                var name = readLine() ?? "Неизвестно"
                print("Введите фамилию")
                var surName = readLine() ?? "Неизвестно"
                print("Введите минимальный баланс")
                var balance = Int(readLine() ?? "") ?? 0
                
                Acc.createAccount(name, surName, balance: balance)
                continue
            case 2:
                print("Sum = ")
                var sum = Int(readLine() ?? "") ?? 0
                Acc.AddBalance(sum)
            case 3:
                print("Сумма для вывода - ")
                var sum1 = Int(readLine() ?? "") ?? 0
                Acc.takeBalance(sum1)
                case 4:
                Acc.GetInformationAccount()
            case 5:
                break
            default :
                break
                
                
            }
        }
    }
}
