//
//  SavedTextVC.swift
//  Kanafication
//
//  Created by Romi_Khan on 03/05/2019.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//

import UIKit

class SavedTextVC: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var textStackView: UIStackView!
    
    
    @IBOutlet weak var hintButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let text1: String = UserDefaults.standard.string(forKey: "transformedtext")!
        let text2: String = UserDefaults.standard.string(forKey: "helpingtext")!
        
        label.text = text1

        let style = NSMutableParagraphStyle()
        style.lineSpacing = 17
        let attributes = [NSAttributedString.Key.paragraphStyle : style]
        label.attributedText = NSAttributedString(string: label.text!, attributes:attributes)
        label.font = UIFont(name: "GothamPro", size: 23)

        
        
        label1.text = text2
        
        let style1 = NSMutableParagraphStyle()
        style1.lineSpacing = 5
        let attributes1 = [NSAttributedString.Key.paragraphStyle : style1]
        label1.attributedText = NSAttributedString(string: label1.text!, attributes:attributes1)
        label1.font = UIFont(name: "GothamPro", size: 13)
        

        
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label1.translatesAutoresizingMaskIntoConstraints = false
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        mainScrollView.addSubview(textStackView)
        self.view.addSubview(mainScrollView)
        
        
        mainScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15.0).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15.0).isActive = true
        
        
        textStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 20.0).isActive = true
        textStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 8.0).isActive = true
        textStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: -8.0).isActive = true
        textStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -8.0).isActive = true
        
        
        textStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -16.0).isActive = true
        
        
//        var frame = self.label.frame
//        frame.size.height = self.label.contentSize.height
//        self.label.frame = frame
//        
//        var frameHelp = self.label1.frame
//        frameHelp.size.height = self.label1.contentSize.height
//        self.label1.frame = frameHelp
        
//        view.safeAreaLayoutGuide.topAnchor = 
//        UIFont(name: "MinionPro-BoldCapt", size: 20)
        
     }
    
    
    
    @IBAction func hintButtonPrassed(_ sender: Any) {
        
        if hintButton.isSelected {
            hintButton.setTitle("Show the hint", for: [])
            hintButton.isSelected = false
            label1.isHidden = true
        } else {
            hintButton.setTitle("Hide the hint", for: [])
            hintButton.isSelected = true
            label1.isHidden = false
        }
        
    }
    
    @IBAction func buttonAnimation(_ sender: UIButton) {
        
        UIButton.animate(withDuration: 0.2,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.2, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
        
        
    }
    
    }


