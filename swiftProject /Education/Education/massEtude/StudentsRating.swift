//
//  Students.swift
//  Education
//
//  Created by Anton Safonov on 29/07/2025.
//

var Name: [String] = []
var Rating: [Int] = []

enum StudentRating: String{
    case excellent = "Отлично"
    case good = "Хорошо"
    case average = "Нормально"
    case bad = "Плохо"
}
enum StudentError: Error{
    case NameEmpty
    case RatingTooBig
    case RatingTooSmall
    case NameNil
}
func LevelRating(_ rating: Int) -> StudentRating{
    switch rating {
    case 0..<40:
        return .bad
    case 40..<60:
        return .average
    case 60..<80:
        return .good
    default:
        return .excellent
    }
}
func StudentMain(){
    SetStudentData( )
    PrintStudentData( )
}
func ValidationName(_ name: String?) throws -> String{
    if name!.isEmpty{ throw StudentError.NameEmpty}
    guard let name = name else { throw StudentError.NameNil}
    if name.count < 3 { throw StudentError.RatingTooSmall}
    if name.count > 15 { throw StudentError.RatingTooBig}
    return name
}
func ValidationRating(_ rating: Int) throws -> Int{
    if rating < 0 { throw StudentError.RatingTooSmall}
    if rating > 100 { throw StudentError.RatingTooBig}
    return rating
}
func SetStudentData(){
    
    print("Введите (имя) и (оценку) студента. \n Нажми Enter чтобы остановить список.")
    
    while true{
        var rating: Int = 0
        print("Введите имя - ")
        do{
           let name = try ValidationName(readLine())
            Name.append(name)
            print( "Введите оценку - ")
            rating = try ValidationRating(Int(readLine() ?? "0") ?? 0 )
            Rating.append(rating)
        }catch StudentError.NameNil{
            print("Имя не может быть пустым.\nСписок будет остановлен."); break
        }
        catch StudentError.NameEmpty{
            print("Список остановлен \n") ;break
        }catch StudentError.RatingTooSmall{
            print( "Оценка не может быть меньше 0.\nОцена будет установлена на 0")
            rating = 0; Rating.append(rating)
            
        }catch StudentError.RatingTooBig{
            print("Оценка не может быть больше 100.\nОцена будет установлена на 100")
            rating = 100; Rating.append(rating)
        } catch{print("Ошибка ввода"); break }
    }
    print("Обработка завершена\n")
}

func PrintStudentData(){
    print("\nСписок студентов\n")
    if (!Name.isEmpty && !Rating.isEmpty) && (Name.count == Rating.count){
        for(name , rating ) in zip(Name, Rating){
            
            print("""
                Имя студента: \(name)
                    Оценка: \(rating)
                \(name) получил: \(LevelRating(rating).rawValue)
                """)
        }
    }else {print("Данные не синхронизированы ")}; return
    
}
