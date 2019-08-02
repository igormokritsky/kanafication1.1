//
//  SavedTableViewController.swift
//  Kanafication
//
//  Created by Ihor Mokrytskyi on 4/29/19.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//

import UIKit
import CoreData

class SavedTableViewController: UITableViewController {
    
    
    var arr = [KanaCoreData]()
    var reverseArr = [KanaCoreData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        arr = DatabaseHelper.shareInstance.saved_text()
        //        print(arr)
        tableView.tableFooterView = UIView.init(frame: .zero)
        //        tableView.estimatedRowHeight = 44.0
        //        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        arr = DatabaseHelper.shareInstance.saved_text()
        reverseArr = []
        for obj in arr {
            reverseArr.insert(obj, at: 0)
        }
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reverseArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_identifier", for: indexPath)
        
        let label1: UILabel = cell.viewWithTag(1) as! UILabel
        let label2: UILabel = cell.viewWithTag(2) as! UILabel
        
        label1.text = reverseArr[indexPath.row].transformedText
        label2.text = reverseArr[indexPath.row].helpingText
        
        
        
        
        //        let style = NSMutableParagraphStyle()
        //        style.lineSpacing = 7
        //        let attributes = [NSAttributedString.Key.paragraphStyle : style]
        //        label1.attributedText = NSAttributedString(string: label1.text!, attributes:attributes)
        //
        //        label1.font = UIFont(name: "GothamPro", size: 19)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(reverseArr[indexPath.row])
        UserDefaults.standard.set(reverseArr[indexPath.row].helpingText, forKey: "helpingtext")
        UserDefaults.standard.set(reverseArr[indexPath.row].transformedText, forKey: "transformedtext")
        let vc = storyboard?.instantiateViewController(withIdentifier: "SavedTextVC")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            DatabaseHelper.shareInstance.delete_text(text: reverseArr[indexPath.row].helpingText!)
            arr = DatabaseHelper.shareInstance.saved_text()
            reverseArr = []
            for obj in arr {
                reverseArr.insert(obj, at: 0)
            }
            tableView.reloadData()
        }
    }
    
    
    
    
    
    //    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 75.0
    //    }
    //
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return UITableView.automaticDimension
    //    }
    
    
    //    // Override to support conditional editing of the table view.
    //    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //        // Return false if you do not want the specified item to be editable.
    //        return true
    //    }
    //
    //
    //    // Override to support editing the table view.
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            // Delete the row from the data source
    //            tableView.deleteRows(at: [indexPath], with: .fade)
    //        } else if editingStyle == .insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //        }
    //    }
    
    
}
