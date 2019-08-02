//
//  AlphabetViewController.swift
//  Kanafication
//
//  Created by Dmytrii Golovanov on 4/2/19.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//

import UIKit

class AlphabetViewController: UIViewController {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    private let itemsPerRow: CGFloat = 5
    private let sectionInsets = UIEdgeInsets(top: 0.0, left: 15.0, bottom: 30.0, right: 15.0)
    
    
    let hiraganaLetters = [
                           // Monograph
        
                           "あ", "い", "う", "え", "お",
                           "か", "き", "く", "け", "こ",
                           "さ", "し", "す", "せ", "そ",
                           "た", "ち", "つ", "て", "と",
                           "な", "に", "ぬ", "ね", "の",
                           "は", "は", "ふ", "へ", "ほ",
                           "ま", "み", "む", "め", "も",
                           "や", "", "ゆ", "", "よ",
                           "ら", "り", "る", "れ", "ろ",
                           "わ", "", "", "", "を",
                           "ん","", "", "", "",
                           
                           // Diacritic
        
                           "が", "ぎ", "ぐ", "げ", "ご",
                           "ざ", "じ", "ず", "ず", "ぞ",
                           "だ", "ぢ", "づ", "で", "ど",
                           "ば", "び", "ぶ", "べ", "ぼ",
                           "ぱ", "ぴ", "ぷ", "ぺ", "ぽ",
                           "", "", "", "", "",
                           
                           "きゃ","", "きゅ","", "きょ",
                           "しゃ","", "しゅ","", "しょ",
                           "ちゃ","", "ちゅ","", "ちょ",
                           "にゃ","", "にゅ","", "にょ",
                           "ひゃ","", "ひゅ","", "ひょ",
                           "みゃ","", "みゅ","", "みょ",
                           "りゃ","", "りゅ","", "りょ",
                           "ぎゃ","", "ぎゅ","", "ぎょ",
                           "じゃ","", "じゅ","", "じょ",
                           "びゃ","", "びゅ","", "びょ",
                           "ぴゃ","", "ぴゅ","", "ぴょ"
                           
                           
                           
       
                           ]
    
    let katakanaLetters = [
                           // Monograph
        
                           "ア", "イ", "ウ", "エ", "オ",
                           "カ", "キ", "ク", "ケ", "コ",
                           "サ", "シ", "ス", "セ", "ソ",
                           "ソ", "チ", "ツ", "テ", "ト",
                           "ナ", "ニ", "ヌ", "ネ", "ノ",
                           "ハ", "ヒ", "フ", "ヘ", "ホ",
                           "マ", "ミ", "ム", "メ", "モ",
                           "ヤ", "", "ユ", "", "ヨ",
                           "ラ", "リ", "ル", "レ", "ロ",
                           "ワ", "","","","ヲ",
                           "ン", "", "", "", "",
                           
                           // Diacritic
        
                           "ガ", "ギ", "グ", "ゲ", "ゴ",
                           "ザ", "ジ", "ズ", "ゼ", "ゾ",
                           "ダ", "ヂ", "ヅ", "デ", "ド",
                           "バ", "ビ", "ブ", "ベ", "ボ",
                           "パ", "ピ", "プ", "ペ", "ポ",
                           
                           "", "", "", "", "",
                           
                           "キャ","", "キュ","", "キョ",
                           "シャ","", "シュ","", "ショ",
                           "チャ","", "チュ","", "チョ",
                           "ニャ","", "ニュ","", "ニョ",
                           "ヒャ","", "ヒュ","", "ヒョ",
                           "ミャ","", "ミュ","", "ミョ",
                           "リャ","", "リュ","", "リョ",
                           "ギャ","", "ギュ","", "ギョ",
                           "ジャ","", "ジュ","", "ジョ",
                           "ビャ","", "ビュ","", "ビョ",
                           "ピャ","", "ピュ","", "ピョ"
                           
                            
        
                          ]
    
    let texts = [
                 // Monograph
        
                 "a", "i", "u", "e", "o",
                 "ka", "ki", "ku", "ke", "ko",
                 "sa", "shi", "su", "se", "so",
                 "ta", "chi", "tsu", "te", "to",
                 "na", "ni", "nu", "ne", "no",
                 "ha", "hi", "fu", "he", "ho",
                 "ma", "mi", "mu", "me", "mo",
                 "ya", "", "yu", "", "yo",
                 "ra", "ri", "ru", "re", "ro",
                 "wa", "", "", "", "wo",
                 "n", "", "", "", "",
                 
                 // Diacritic
        
                 "ga", "gi", "gu", "ge", "go",
                 "za", "ji", "zu", "ze","zo",
                 "da", "di", "zhu", "de","do",
                 "ba", "bi", "bu", "be","bo",
                 "pa", "pi", "pu", "pe","po",
                 "", "", "", "", "",
                 
                 "kya","", "kyu","", "kyo",
                 "sha","", "shu","", "sho",
                 "cha","", "chu","", "cho",
                 "nya","", "nyu","", "nyo",
                 "hya","", "hyu","", "hyo",
                 "mya","", "myu","", "myo",
                 "rya","", "ryu","", "ryo",
                 "gya","", "gyu","", "gyo",
                 "ja","", "ju","", "jo",
                 "bya","", "byu","", "byo",
                 "pya","", "pyu","", "pyo"
      
                ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
                
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
//       segmentControl.makeMultiline(withFontName: "MinionPro-BoldCapt", fontSize: 33, textColor: .black)
        
       
        // Do any additional setup after loading the view.
    }
   
   
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
     
        collectionView.reloadData()
        
    }

}



// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension AlphabetViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.hiraganaLetters.count
        
       
    }
    

    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//       return 2
//    }
   


    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! AlphabetCollectionViewCell
        switch segmentControl.selectedSegmentIndex {
        case 0:
            cell.letterLabel?.text = self.hiraganaLetters[indexPath.item]
            cell.textLabel?.text = self.texts[indexPath.item]
            
        case 1:
            cell.letterLabel?.text = self.katakanaLetters[indexPath.item]
            cell.textLabel?.text = self.texts[indexPath.item]
            
        default:
            break
            
        }

        
        segmentControl.setTitle("Hiragana", forSegmentAt: 0)
        segmentControl.setTitle("Katakana", forSegmentAt: 1)
        
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
       
        
        segmentControl.tintColor = UIColor.clear
        segmentControl.backgroundColor = UIColor.clear
        
        
//        let normalColor = UIColor(red: 177, green: 177, blue: 177, alpha: 1)
//        let selectedColor = UIColor(red: 41, green: 41, blue: 41, alpha: 1)
        
        
        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "MinionPro-BoldCapt", size: 33)!,
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ], for: .normal)

        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "MinionPro-BoldCapt", size: 33)!,
            NSAttributedString.Key.foregroundColor: UIColor.darkText
            ], for: .selected)
        
        
    
        

        return cell
        
        
        
        }
    
    
    
    
    

    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
}
    


extension AlphabetViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: 73)
}

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    

}

