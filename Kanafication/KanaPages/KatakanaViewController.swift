//
//  KatakanaViewController.swift
//  Kanafication
//
//  Created by Ihor Mokrytskyi on 3/1/19.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//

import UIKit

class KatakanaViewController: UIViewController {


    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
        
        btn2.isUserInteractionEnabled = false
        btn1.setTitleColor(UIColor.lightGray, for: .normal)
        label1.textColor = UIColor.lightGray
        navigationController?.navigationBar.isHidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
 
    @IBAction func btn1(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func btn2(_ sender: Any) {
    }
    
}
