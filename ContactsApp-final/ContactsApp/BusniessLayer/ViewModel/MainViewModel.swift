//
//  VIewModel.swift
//  ContactsApp
//
//  Created by hriday garg on 20/04/23.
//


import Foundation
import CoreData

class ViewModel: ObservableObject{
    
    let coreData = CoreDataManager()
    
    @Published var filteredData: [ContactsModel]?
    
    @Published var sectionTitleArray = [String]()
    @Published var contactDict = [String: [ContactsModel]]()
    

    var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","#"]
    
    init(){
        getContacts()
    }
    
    
    /// Function to get data from core data and then sorting data
    func getContacts(){

        filteredData = coreData.getAll()
        sortContacts(in: filteredData ?? [])
    }
    
    
    /// This function is used to sort contacts on the basis of different sections and also sort on the basis of numbers if thier is no name present
    /// - Parameter contact: sorting is done on contact which is of type array of ContactsModel
    func sortContacts(in contact: [ContactsModel]){
        
        var sections = [String]()
        
        for cont in contact{
            if cont.getfullname() != "" {
                let ch = String(cont.getfullname().prefix(1))
                if (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") {
                    sections.append(ch)
                }
            }
        }
    
        sectionTitleArray = Array(Set(sections))
        sectionTitleArray.sort()
        sectionTitleArray.append("#")
        
        contactDict = [String: [ContactsModel]]()
        for stitle in sectionTitleArray {
            contactDict[stitle] = [ContactsModel]()
        }
        
        for cont in contact {
            
            if cont.getfullname() != ""{
                let ch = String(cont.getfullname().prefix(1))
                if  ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") ){
                    contactDict[ch]?.append(cont)
                }else{
                    contactDict["#"]?.append(cont)
                }
            }
            else if !cont.number.isEmpty{
                contactDict["#"]?.append(cont)
            }
            else{
                contactDict["#"]?.append(cont)
            }
        }
        
        let index = sectionTitleArray.count-1
        if contactDict[sectionTitleArray[index]]?.count == 0 {
                contactDict.removeValue(forKey: sectionTitleArray[index])
                sectionTitleArray.remove(at: index)
        }
        

        for (key, _) in contactDict {
            contactDict[key] = contactDict[key]?.sorted(by: {
                if key != "#"{
                        return $0.getfullname().uppercased() < $1.getfullname().uppercased()
                }
                else{
                    //                    }
                    if $0.getfullname() != "" && $1.getfullname() != "" {
                        return $0.number[0].mobileNumber < $1.number[0].mobileNumber
                    }
                    else{
                        return $0.getfullname().uppercased() < $1.getfullname().uppercased()
                    }
                }
            })
        }
    }
}
