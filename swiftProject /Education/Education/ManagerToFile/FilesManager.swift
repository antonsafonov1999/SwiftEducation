//
//  FilesManager.swift
//  Education
//
//  Created by Anton Safonov on 03/07/2026.
//

struct FileSetting{
    
    var id: String
    var name: String
    var large: Double
    var progress: Double = 0.0
    var status: statusFile
    
    static var DataFiles : [FileSetting] = []
    
    enum statusFile {
        case errorDownload
        case deleteDownload
        case didDownload// загружена
        case Download
        case willDownload
    }
    
    init(id: String, name: String, large: Double, progress: Double, status: statusFile){
        self.id = id
        self.name = name
        self.large = large
        self.progress = progress
        self.status = status
        FileSetting.DataFiles.append(self)
    }
    
}
struct Manager{
   static func addDownload(file: inout FileSetting) {
       FileSetting.DataFiles.append(file)
    }
    
    static func startDownload(file: inout FileSetting) {
        if !file.id.isEmpty {
            
            file.status = .willDownload
            print("StartDownload")
        }
       
        
    }
    
    static func updateDownload() {
        for (index, file) in FileSetting.DataFiles.enumerated() {
            FileSetting.DataFiles[index].progress += 10.0
            if FileSetting.DataFiles[index].progress >= 100.0 {
                FileSetting.DataFiles[index].status = .didDownload
            }
            if FileSetting.DataFiles[index].status == .errorDownload {print("Ошибка с файлом \(file.id) - \(file.name): progress - \(file.progress)")}
        }
    }
    
    static func printAllDownloads() {
        for (ind, num) in FileSetting.DataFiles.enumerated() {
            if FileSetting.DataFiles[ind].status == .didDownload {
                print("Загружено: \(num.name), размер  - \(num.large)")
            }
        }
    }
    
    static func printAllActiveDownloads(file: FileSetting) {
        for (ind, num) in FileSetting.DataFiles.enumerated() {
            if FileSetting.DataFiles[ind].status == .Download &&
                FileSetting.DataFiles[ind].status == .willDownload{
                print("Загружается : \(num.name), размер - \(num.large); прогресс - \(num.progress)")
            }
            if FileSetting.DataFiles[ind].status == .errorDownload {print("Ошибка с файлом \(num.id) - \(num.name): progress - \(num.progress)")}
        }
    }
    
    static func DeleteDownload(file: inout FileSetting) {
        print("Попытка удалить обьект = \(file.name)")
        FileSetting.DataFiles.removeAll(where: { $0.id == file.id})
    }
    
    static func exit() {
        <#code#>
    }
    
    
}
