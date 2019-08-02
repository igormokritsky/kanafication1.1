//
//  TextViewController.swift
//  Kanafication
//
//  Created by Ihor Mokrytskyi on 3/2/19.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//

import UIKit




class TextViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet var backgroungTextView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    
    @IBOutlet weak var hiraganaAlphabetButton: UIButton!
    @IBOutlet weak var katakanaAlphabetButton: UIButton!
    
    @IBOutlet weak var easyLevelButton: UIButton!
    @IBOutlet weak var mediumLevelButton: UIButton!
    @IBOutlet weak var hardLevelButton: UIButton!
    
    @IBOutlet weak var transformButton: UIButton!
    
    
    
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
    
    
   
    

    private var alphabetLevel: Alphabet.AlphabetLevel = .easy {
        didSet {
            easyLevelButton.isSelected = alphabetLevel == .easy
            mediumLevelButton.isSelected = alphabetLevel == .medium
            hardLevelButton.isSelected = alphabetLevel == .hard
        }
    }
    private var alphabetStyle: AlphabetStyle = .all {
        didSet {
            hiraganaAlphabetButton.isSelected = (alphabetStyle == .hiragana || alphabetStyle == .all)
            katakanaAlphabetButton.isSelected = (alphabetStyle == .katakana || alphabetStyle == .all)
        }
    }
    
    var alphabet: [String: String] {
        switch alphabetStyle {
        case .none:
            return [:]
        case .hiragana:
            return Alphabets.hiragana.alphabet(for: alphabetLevel)
        case .katakana:
            return Alphabets.katakana.alphabet(for: alphabetLevel)
        case .all:
            return Alphabets.hiragana.alphabet(for: alphabetLevel).merging(Alphabets.katakana.alphabet(for: alphabetLevel), uniquingKeysWith: { (first, second) in
                Bool.random() ? first : second
            })
        }
    }
    
    
    
 
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UITextField.appearance().tintColor = UIColor.white
        UITextView.appearance().tintColor = UIColor.white
        
        alphabetLevel = .easy
        alphabetStyle = .all
        
        
        let kanaGreenColor = UIColor(displayP3Red: 35, green: 150, blue: 111, alpha: 1)
        
        
       
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton2")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton2")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        
        
        textView.delegate = self
      
        
        
        
        
        self.textView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        
        
        
        
        backgroungTextView.layer.borderWidth = 0.5
        backgroungTextView.layer.borderColor = kanaGreenColor.cgColor
        backgroungTextView.layer.cornerRadius = 25
        
        // MARK: shadow for background of textview if i want it
        
        backgroungTextView.layer.shadowColor = UIColor.black.cgColor
        backgroungTextView.layer.shadowRadius = 10
        backgroungTextView.layer.shadowOpacity = 0.17
        
        
        transformButton.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        transformButton.heightAnchor.constraint(equalToConstant: 55.0).isActive = true
        
        transformButton.layer.cornerRadius = 25
        transformButton.layer.shadowColor = UIColor.black.cgColor
        transformButton.layer.shadowRadius = 7
        transformButton.layer.shadowOpacity = 0.17
        
        transformButton.contentHorizontalAlignment = .center
        transformButton.contentVerticalAlignment = .center
        
        
        
        hiraganaAlphabetButton.layer.shadowColor = UIColor.black.cgColor
        hiraganaAlphabetButton.layer.shadowRadius = 7
        hiraganaAlphabetButton.layer.shadowOpacity = 0.10
        
        
        katakanaAlphabetButton.layer.shadowColor = UIColor.black.cgColor
        katakanaAlphabetButton.layer.shadowRadius = 7
        katakanaAlphabetButton.layer.shadowOpacity = 0.10
        
        
        easyLevelButton.layer.shadowColor = UIColor.black.cgColor
        easyLevelButton.layer.shadowRadius = 7
        easyLevelButton.layer.shadowOpacity = 0.10
        
        mediumLevelButton.layer.shadowColor = UIColor.black.cgColor
        mediumLevelButton.layer.shadowRadius = 7
        mediumLevelButton.layer.shadowOpacity = 0.10
        
        hardLevelButton.layer.shadowColor = UIColor.black.cgColor
        hardLevelButton.layer.shadowRadius = 7
        hardLevelButton.layer.shadowOpacity = 0.10
        
     
    
        
        
        // MARK: - Надо переделать курсор
      
        textView.text = "Insert your text here 📝"

        let style = NSMutableParagraphStyle()
        style.lineSpacing = 7
        let attributes = [NSAttributedString.Key.paragraphStyle : style]
        textView.attributedText = NSAttributedString(string: textView.text, attributes:attributes)
        
        textView.textColor = UIColor.white
        textView.font = UIFont(name: "GothamPro", size: 19)
        
       
        
        
    }
    
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
            
    }
    
    enum AlphabetStyle {
        case none
        case hiragana
        case katakana
        case all
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "showDetailSegue" {
            if let detailVC = segue.destination as? AfterTransformationViewController {
                // Назначаешь объект класса ViewController делегатом объекта класса DetailViewController
                detailVC.delegate = self
                detailVC.helpTextDelegate = self
            }
        }
    }
    
    
 
    
    @IBAction func buttonPressed(_ sender: UIButton ) {
       
        switch sender {

        // Easy
        case easyLevelButton:
            alphabetLevel = .easy
        // Medium
        case mediumLevelButton:
            alphabetLevel = .medium
        // Hard
        case hardLevelButton:
            alphabetLevel = .hard

        // Alphabet
        case hiraganaAlphabetButton, katakanaAlphabetButton:
            sender.isSelected = !sender.isSelected
            switch (hiraganaAlphabetButton.isSelected, katakanaAlphabetButton.isSelected) {
            case (false, false):
                alphabetStyle = .none
            case (true, false):
                alphabetStyle = .hiragana
            case (false, true):
                alphabetStyle = .katakana
            case (true, true):
                alphabetStyle = .all
            }

        default: break
        }
    }
    
    
    
    
    func transform(_ str: String) -> String {
        var result: String = ""
        var resultCount = 0
        while resultCount < str.count {
            var success = false
            
            if resultCount < (str.count - 1) {
                let startIndex = str.index(str.startIndex, offsetBy: resultCount)
                let endIndex = str.index(startIndex, offsetBy: 1)
                let s = String(str[startIndex]) + String(str[endIndex])
                
                if let s2 = alphabet[s] {
                    result += s2
                    resultCount += 1
                    success = true
                }
            }
            
            if !success {
                let index = str.index(str.startIndex, offsetBy: resultCount)
                let s = String(str[index])
                result += alphabet[s] ?? s
            }
            
            resultCount += 1
        }
        return result
    }

   
  
    

    
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Insert your text here 📝" {
            textView.text = ""
            textView.textColor = UIColor.white
            textView.font = UIFont(name: "GothamPro", size: 20.0)
            
        }
    }
    
    
    // Чтоб сделать return key как done, если захочу
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text == "\n" {
//            textView.resignFirstResponder()
//            textView.tintColor = UIColor.white
//        }
//        return true
//    }
    
   
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Insert your text here 📝"
            textView.textColor = UIColor.white
            textView.font = UIFont(name: "GothamPro", size: 20.0)
            
        }
    }
    
    

    
    
}


// MARK: - DetailViewControllerDelegate

extension TextViewController: AfterTransformationViewControllerDelegate {
    func textForDetail() -> String {
        return transform(textView.text)
            }
}

extension TextViewController: SecondAfterTransformationViewControllerDelegate {
    func helpingText() -> String {
        return textView.text
    }
}
