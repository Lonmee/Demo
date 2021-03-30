//
//  CDUtils.swift
//  Demo
//
//  Created by Lonmee on 10/28/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import Foundation

// MARK: coredata
//NotificationCenter.default.addObserver(self,
//                                       selector: #selector(Coordinator.saveHandler(sender:)),
//                                       name: .NSManagedObjectContextDidSave,
//                                       object: context)
//
//
//let user = User(context: context)
//user.id = 1
//user.nick = "Lunar"
//
//context.performAndWait {
//    do {
//        try context.save()
//    } catch let error as NSError {
//        print("Error: \(error), \(error.userInfo)")
//    }
//}
//
//let fetchRequest: NSFetchRequest<User> = NSFetchRequest(entityName: "User")
//fetchRequest.resultType = .managedObjectResultType
//var count = 0
//var users: Any = []
//
//context.performAndWait() {
//    do {
//        count = try context.count(for: fetchRequest)
//        users = try context.fetch(fetchRequest)
//    } catch {
//        print("Error counting objects: \(error)")
//    }
//}
//
//print("The fetch request would return \(count) objects: \(users)")
//}
//
//func saveCD() {
//    let context = 
//    context.performAndWait {
//        do {
//            try context.save()
//        } catch let error as NSError {
//            print("Error: \(error), \(error.userInfo)")
//        }
//    }
//}
