//
//  DatabaseHelper.swift
//  
//
//  Created by Romi_Khan on 18/04/2019.
//  Copyright © 2019 SoftBrain. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save_text(dictionary: [String: Any]) {
        let obj: KanaCoreData = NSEntityDescription.insertNewObject(forEntityName: "KanaCoreData", into: context!) as! KanaCoreData
        print(dictionary)
        obj.helpingText = dictionary["helpingtext"] as? String
        obj.transformedText = dictionary["transferredtext"] as? String
        do {
            try context?.save()
        } catch {
            print("didn't save")
        }
    }
    
    func delete_text(text: String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "KanaCoreData")
        request.predicate = NSPredicate(format: "helpingText = %@", text)
        
        do {
            let result = try context?.fetch(request)
            for data in result as! [NSManagedObject]
            {
                context!.delete(data)
                try context?.save()
            }
        }
        catch {
            print("didn't save")
        }
    }

    func saved_text() -> [KanaCoreData] {
        var arr = [KanaCoreData]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "KanaCoreData")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [KanaCoreData]
        } catch  {
            print("no record found")
        }
        print(arr)
        return arr
    }
    
}
