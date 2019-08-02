//
//  AfterTransformationViewController.swift
//  Kanafication
//
//  Created by Ihor Mokrytskyi on 3/10/19.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//

import UIKit
import Foundation


protocol AfterTransformationViewControllerDelegate {
    func textForDetail() -> String
}

protocol SecondAfterTransformationViewControllerDelegate {
    func helpingText() -> String
    
}

class AfterTransformationViewController: UIViewController {
    
    var delegate: AfterTransformationViewControllerDelegate?
    
    var helpTextDelegate: SecondAfterTransformationViewControllerDelegate?
   
    
    @IBOutlet weak var transformedTextView: UITextView!
    @IBOutlet weak var helpingTextView: UITextView!

    @IBOutlet var mainScrollView: UIScrollView!
    
    @IBOutlet var starButton: UIButton!
    
    
    
    @IBOutlet weak var hintButton: UIButton!
    
    
    
    @IBAction func starButtonPressed(_ sender: Any) {
      
        if starButton.isSelected {
            starButton.isSelected = false
            DatabaseHelper.shareInstance.delete_text(text: helpingTextView.text)
        }
        else {
            let dic: [String: String] = ["helpingtext": helpingTextView.text, "transferredtext": transformedTextView.text]
            DatabaseHelper.shareInstance.save_text(dictionary: dic)
            starButton.isSelected = true
        }
        
        print(DatabaseHelper.shareInstance.saved_text())
        
        
    }
    
    
    
    @IBOutlet var textStackView: UIStackView!
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customColor = UIColor.init(red: 82/255, green: 190/255, blue: 173/255, alpha: 1)
        
        UITextField.appearance().tintColor = customColor
        UITextView.appearance().tintColor = customColor

        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        transformedTextView.translatesAutoresizingMaskIntoConstraints = false
        helpingTextView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        mainScrollView.addSubview(textStackView)
        self.view.addSubview(mainScrollView)
        

        mainScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15.0).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15.0).isActive = true


        textStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 8.0).isActive = true
        textStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 8.0).isActive = true
        textStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: -8.0).isActive = true
        textStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -8.0).isActive = true


        textStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -16.0).isActive = true
        
        

        
        
        if let text = delegate?.textForDetail() {
            transformedTextView.text = text
            print(transformedTextView.text)
        }
        
        if let helpingText = helpTextDelegate?.helpingText(){
            helpingTextView.text = helpingText
        }
        
        

        
        
        var frame = self.transformedTextView.frame
        frame.size.height = self.transformedTextView.contentSize.height
        self.transformedTextView.frame = frame
        
        var frameHelp = self.helpingTextView.frame
        frameHelp.size.height = self.helpingTextView.contentSize.height
        self.helpingTextView.frame = frameHelp
        
        
        starButton.setImage(UIImage(named: "starred2"), for: .normal)
        starButton.setImage(UIImage(named: "starred1"), for: .selected)
        
       
    }
    
    
    
    @IBAction func hintButtonPressed(_ sender: Any) {
        
        if hintButton.isSelected {
            hintButton.setTitle("Show the hint", for: [])
            hintButton.isSelected = false
            helpingTextView.isHidden = true
        } else {
            hintButton.setTitle("Hide the hint", for: [])
            hintButton.isSelected = true
            helpingTextView.isHidden = false
            
        }
        
    }
    
 
}








