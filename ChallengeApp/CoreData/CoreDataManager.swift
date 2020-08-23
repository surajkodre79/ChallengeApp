//
//  CoreDataManager.swift
//  ChallengeApp
//
//  Created by Suraj Kodre on 23/08/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext?
    
    public static let sharedInstance = CoreDataManager()
    
    private init() {
        context = appDelegate.persistentContainer.viewContext
    }
    
    func saveUserInfo(userInformation: [UserData], closure: (Bool)-> Void) {
        let entity = NSEntityDescription.entity(forEntityName: "UserInfo", in: context!)
        for user in userInformation {
            let userInfo = NSManagedObject(entity: entity!, insertInto: context)
            userInfo.setValue(user.id, forKey: "id")
            userInfo.setValue(user.type, forKey: "type")
            userInfo.setValue(user.date, forKey: "date")
            userInfo.setValue(user.data, forKey: "data")
        }
        do {
            try context?.save()
            print(dataSaved)
            closure(true)
        } catch {
            print(failToSave)
            closure(false)
        }
    }
    
    func fetchUserDataFromDB(closure: ([UserData]?,Bool)-> Void) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        request.returnsObjectsAsFaults = false
        var userData: [UserData] = []
        do {
            guard let result = try context?.fetch(request) else { throw JSONError.NoData }
            for data in result as! [NSManagedObject] {
                let id = data.value(forKey: "id") as? String ?? ""
                let type = data.value(forKey: "type") as? String ?? ""
                let dataa = data.value(forKey: "date") as? String ?? ""
                let date = data.value(forKey: "date") as? String ?? ""
                let userInfo = UserData(id: id, type: type, date: date, data: dataa)
                
                userData.append(userInfo)
            }
            print(fetchingData)
            closure(userData,true)
        } catch let error as JSONError {
            print(error)
            closure(nil,false)
        } catch let error as NSError {
            print(error)
            closure(nil,false)
        }
    }
}
