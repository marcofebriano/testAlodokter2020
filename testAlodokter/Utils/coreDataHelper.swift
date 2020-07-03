//
//  coreDataHelper.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 03/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import Foundation
import CoreData
import UIKit

open class coreDataHelper {
    public static var shared = coreDataHelper()
    let manageContext = AppDelegate().persistentContainer.viewContext
    
    /// saveUser
    public func saveUser(_ username: String, _ password: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: manageContext) else { return }
        let objectUser = NSManagedObject(entity: entity, insertInto: manageContext)
        objectUser.setValue(username, forKey: "username")
        objectUser.setValue(password, forKey: "password")
        objectUser.setValue("Marco Febriano Ramadhani", forKey: "name")
        objectUser.setValue("087808427607", forKey: "phoneNumber")
        objectUser.setValue("male", forKey: "gender")
        
        let image = UIImage(named: "person")
        let data = image?.jpegData(compressionQuality: 0.5)
        objectUser.setValue(data, forKey: "image")
        
        do {
            try manageContext.save()
        } catch let error as NSError {
            print("error save data - \(error.userInfo)")
        }
    }
    
    /// fetch user
    public func fetchUser() -> [NSManagedObject] {
        var data: [NSManagedObject] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        do {
             data = try manageContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("error save data - \(error.userInfo)")
        }
        return data
    }
    
    /// delete user
    public func deleteData(userName: String) {
        let data = fetchUser()
        manageContext.delete(data[0])
        
        do {
            try manageContext.save()
        } catch let error as NSError {
            print("error save data - \(error.userInfo)")
        }
    }
}
