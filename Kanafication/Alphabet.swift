//
//  hiranagaAndKatakanaDIctionaties.swift
//  Kanafication
//
//  Created by Ihor Mokrytskyi on 3/11/19.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//

import Foundation



class Alphabet {
    
    private var easyPart: [String: String] = [:]
    private var mediumPart: [String: String] = [:]
    private var hardPart: [String: String] = [:]
    
    init(easy easyPart: [String: String], medium  mediumPart: [String: String], hard hardPart: [String: String] ) {
        self.easyPart = easyPart
        self.mediumPart = mediumPart
        self.hardPart = hardPart
    }
    
    var easy: [String: String] {
        return self.easyPart
    }
    
    var medium: [String: String] {
        return easy.merging(mediumPart, uniquingKeysWith: { (current, _) in current })
    }
    
    var hard: [String: String] {
        return medium.merging(hardPart, uniquingKeysWith: { (current, _) in current })
    }
    
    func alphabet(for level: AlphabetLevel) -> [String: String] {
        switch level {
        case .easy:
            return easy
        case .medium:
            return medium
        case .hard:
            return hard
        }
    }
    
    enum AlphabetLevel {
        case easy
        case medium
        case hard
    }
}

struct Alphabets {
    static let hiragana = Alphabet(easy: ["a":"あ", "i":"い", "u":"う", "e":"え", "o":"お",
                                          "A":"あ", "I":"い", "U":"う", "E":"え", "O":"お",
                                          "ka":"か", "ki":"き", "ku":"く", "ke":"け", "ko":"こ",
                                          "Ka":"か", "Ki":"き", "Ku":"く", "Ke":"け", "Ko":"こ",
                                          "sa":"さ", "shi":"し", "su":"す", "se":"せ", "so":"そ",
                                          "Sa":"さ", "Shi":"し", "Su":"す", "Se":"せ", "So":"そ",
                                          "ta":"た", "chi":"ち", "tsu":"つ", "te":"て", "to":"と",
                                          "Ta":"た", "Chi":"ち", "Tsu":"つ", "Te":"て", "To":"と",
                                          "na":"な", "ni":"に", "nu":"ぬ", "ne":"ね", "no":"の",
                                          "Na":"な", "Ni":"に", "Nu":"ぬ", "Ne":"ね", "No":"の",
                                          
                                          "а":"あ", "и":"い", "у":"う", "е":"え", "о":"お",
                                          "А":"あ", "И":"い", "У":"う", "Е":"え", "О":"お",
                                          "ка":"か", "ки":"き", "ку":"く", "ке":"け", "ко":"こ",
                                          "Ка":"か", "Ки":"き", "Ку":"く", "Ке":"け", "Ко":"こ",
                                          "са":"さ", "си":"し", "су":"す", "се":"せ", "со":"そ",
                                          "Са":"さ", "Си":"し", "Су":"す", "Се":"せ", "Со":"そ",
                                          "та":"た", "ти":"ち", "цу":"つ", "те":"て", "то":"と",
                                          "Та":"た", "Ти":"ち", "Цу":"つ", "Те":"て", "То":"と",
                                          "на":"な", "ни":"に", "ну":"ぬ", "не":"ね", "но":"の",
                                          "На":"な", "Ни":"に", "Ну":"ぬ", "Не":"ね", "Но":"の"],
                                   
                                   medium: ["ha":"は", "hi":"は", "fu":"ふ", "he":"へ", "ho":"ほ",
                                            "Ha":"は", "Hi":"は", "Fu":"ふ", "He":"へ", "Ho":"ほ",
                                            "ma":"ま", "mi":"み", "mu":"む", "me":"め", "mo":"も",
                                            "Ma":"ま", "Mi":"み", "Mu":"む", "Me":"め", "Mo":"も",
                                            "ya":"や", "yu":"ゆ", "yo":"よ",
                                            "Ya":"や", "Yu":"ゆ", "Yo":"よ",
                                            "ra":"ら", "ri":"り", "ru":"る", "re":"れ", "ro":"ろ",
                                            "Ra":"ら", "Ri":"り", "Ru":"る", "Re":"れ", "Ro":"ろ",
                                            "wa":"わ", "wo":"を", "n":"ん",
                                            "Wa":"わ", "Wo":"を", "N":"ん",
                                            
                                            "ха":"は", "хи":"は", "фу":"ふ", "хе":"へ", "хо":"ほ",
                                            "Ха":"は", "Хи":"は", "Фу":"ふ", "Хе":"へ", "Хо":"ほ",
                                            "ма":"ま", "ми":"み", "му":"む", "ме":"め", "мо":"も",
                                            "Ма":"ま", "Ми":"み", "Му":"む", "Ме":"め", "Мо":"も",
                                            "я":"や", "ю":"ゆ", "ё":"よ",
                                            "Я":"や", "Ю":"ゆ", "Ё":"よ",
                                            "ра":"ら", "ри":"り", "ру":"る", "ре":"れ", "ро":"ろ",
                                            "Ра":"ら", "Ри":"り", "Ру":"る", "Ре":"れ", "Ро":"ろ",
                                            "ва":"わ", "во":"を", "н":"ん",
                                            "Ва":"わ", "Во":"を", "Н":"ん"],
                                   
                                   hard: ["ga":"が", "gi":"ぎ", "gu":"ぐ", "ge":"げ","go":"ご",
                                          "Ga":"が", "Gi":"ぎ", "Gu":"ぐ", "Ge":"げ","Go":"ご",
                                          "za":"ざ", "ji":"じ", "zu":"ず", "ze":"ず","zo":"ぞ",
                                          "Za":"ざ", "Ji":"じ", "Zu":"ず", "Ze":"ず","Zo":"ぞ",
                                          "da":"だ", "di":"ぢ", "zhu":"づ", "de":"で","do":"ど",
                                          "Da":"だ", "Di":"ぢ", "Zhu":"づ", "De":"で","Do":"ど",
                                          "ba":"ば", "bi":"び", "bu":"ぶ", "be":"べ","bo":"ぼ",
                                          "Ba":"ば", "Bi":"び", "Bu":"ぶ", "Be":"べ","Bo":"ぼ",
                                          "pa":"ぱ", "pi":"ぴ", "pu":"ぷ", "pe":"ぺ","po":"ぽ",
                                          "Pa":"ぱ", "Pi":"ぴ", "Pu":"ぷ", "Pe":"ぺ","Po":"ぽ",
                                          
                                          "га":"が", "ги":"ぎ", "гу":"ぐ", "ге":"げ","го":"ご",
                                          "Га":"が", "Ги":"ぎ", "Гу":"ぐ", "Ге":"げ","Го":"ご",
                                          "за":"ざ", "дзи":"じ", "дзу":"ず", "зе":"ず","зо":"ぞ",
                                          "За":"ざ", "Дзи":"じ", "Дзу":"ず", "Зе":"ず","Зо":"ぞ",
                                          "да":"だ", "ди":"ぢ", "ду":"づ", "де":"で","до":"ど",
                                          "Да":"だ", "Ди":"ぢ", "Ду":"づ", "Де":"で","До":"ど",
                                          "ба":"ば", "би":"び", "бу":"ぶ", "бе":"べ","бо":"ぼ",
                                          "Ба":"ば", "Би":"び", "Бу":"ぶ", "Бе":"べ","Бо":"ぼ",
                                          "па":"ぱ", "пи":"ぴ", "пу":"ぷ", "пе":"ぺ","по":"ぽ",
                                          "Па":"ぱ", "Пи":"ぴ", "Пу":"ぷ", "Пе":"ぺ","По":"ぽ"])
    
    static let katakana = Alphabet(easy: ["a":"ア", "i":"イ", "u":"ウ", "e":"エ", "o":"オ",
                                          "A":"ア", "I":"イ", "U":"ウ", "E":"エ", "O":"オ",
                                          "ka":"カ", "ki":"キ", "ku":"ク", "ke":"ケ", "ko":"コ",
                                          "Ka":"カ", "Ki":"キ", "Ku":"ク", "Ke":"ケ", "Ko":"コ",
                                          "sa":"サ", "shi":"シ", "su":"ス", "se":"セ", "so":"ソ",
                                          "Sa":"サ", "Shi":"シ", "Su":"ス", "Se":"セ", "So":"ソ",
                                          "ta":"ソ", "chi":"チ", "tsu":"ツ", "te":"テ", "to":"ト",
                                          "Ta":"ソ", "Chi":"チ", "Tsu":"ツ", "Te":"テ", "To":"ト",
                                          "na":"ナ", "ni":"ニ", "nu":"ヌ", "ne":"ネ", "no":"ノ",
                                          "Na":"ナ", "Ni":"ニ", "Nu":"ヌ", "Ne":"ネ", "No":"ノ",
                                          
                                          "а":"ア", "и":"イ", "у":"ウ", "е":"エ", "о":"オ",
                                          "А":"ア", "И":"イ", "У":"ウ", "Е":"エ", "О":"オ",
                                          "ка":"カ", "ки":"キ", "ку":"ク", "ке":"ケ", "ко":"コ",
                                          "Ка":"カ", "Ки":"キ", "Ку":"ク", "Ке":"ケ", "Ко":"コ",
                                          "са":"サ", "си":"シ", "су":"ス", "се":"セ", "со":"ソ",
                                          "Са":"サ", "Си":"シ", "Су":"ス", "Се":"セ", "Со":"ソ",
                                          "та":"ソ", "ти":"チ", "цу":"ツ", "те":"テ", "то":"ト",
                                          "Та":"ソ", "Ти":"チ", "Цу":"ツ", "Те":"テ", "То":"ト",
                                          "на":"ナ", "ни":"ニ", "ну":"ヌ", "н":"ネ", "но":"ノ",
                                          "На":"ナ", "Ни":"ニ", "Ну":"ヌ", "Не":"ネ", "Но":"ノ"],
                                   
                                   medium: ["ha":"ハ", "hi":"ヒ", "fu":"フ", "he":"ヘ", "ho":"ホ",
                                            "Ha":"ハ", "Hi":"ヒ", "Fu":"フ", "He":"ヘ", "Ho":"ホ",
                                            "ma":"マ", "mi":"ミ", "mu":"ム", "me":"メ", "mo":"モ",
                                            "Ma":"マ", "Mi":"ミ", "Mu":"ム", "Me":"メ", "Mo":"モ",
                                            "ya":"ヤ", "yu":"ユ", "yo":"ヨ",
                                            "Ya":"ヤ", "Yu":"ユ", "Yo":"ヨ",
                                            "ra":"ラ", "ri":"リ", "ru":"ル", "re":"レ", "ro":"ロ",
                                            "Ra":"ラ", "Ri":"リ", "Ru":"ル", "Re":"レ", "Ro":"ロ",
                                            "wa":"ワ", "wo":"ヲ", "n":"ン",
                                            "Wa":"ワ", "Wo":"ヲ", "N":"ン",
                                            
                                            "ха":"ハ", "хи":"ヒ", "фу":"フ", "хе":"ヘ", "хо":"ホ",
                                            "Ха":"ハ", "Хи":"ヒ", "Фу":"フ", "Хе":"ヘ", "Хо":"ホ",
                                            "ма":"マ", "ми":"ミ", "му":"ム", "ме":"メ", "мо":"モ",
                                            "Ма":"マ", "Ми":"ミ", "Му":"ム", "Ме":"メ", "Мо":"モ",
                                            "я":"ヤ", "ю":"ユ", "ё":"ヨ",
                                            "Я":"ヤ", "Ю":"ユ", "Ё":"ヨ",
                                            "ра":"ラ", "ри":"リ", "ру":"ル", "ре":"レ", "ро":"ロ",
                                            "Ра":"ラ", "Ри":"リ", "Ру":"ル", "Ре":"レ", "Ро":"ロ",
                                            "ва":"ワ", "во":"ヲ", "н":"ン",
                                            "Ва":"ワ", "Во":"ヲ", "Н":"ン"],
                                   
                                   hard: ["ga":"ガ", "gi":"ギ", "gu":"グ", "ge":"ゲ","go":"ゴ",
                                          "Ga":"ガ", "Gi":"ギ", "Gu":"グ", "Ge":"ゲ","Go":"ゴ",
                                          "za":"ザ", "ji":"ジ", "zu":"ズ", "ze":"ゼ","zo":"ゾ",
                                          "Za":"ザ", "Ji":"ジ", "Zu":"ズ", "Ze":"ゼ","Zo":"ゾ",
                                          "da":"ダ", "di":"ヂ", "zhu":"ヅ", "de":"デ","do":"ド",
                                          "Da":"ダ", "Di":"ヂ", "Zhu":"ヅ", "De":"デ","Do":"ド",
                                          "ba":"バ", "bi":"ビ", "bu":"ブ", "be":"ベ","bo":"ボ",
                                          "Ba":"バ", "Bi":"ビ", "Bu":"ブ", "Be":"ベ","Bo":"ボ",
                                          "pa":"パ", "pi":"ピ", "pu":"プ", "pe":"ペ","po":"ポ",
                                          "Pa":"パ", "Pi":"ピ", "Pu":"プ", "Pe":"ペ","Po":"ポ",
                                          
                                          "га":"ガ", "ги":"ギ", "гу":"グ", "ге":"ゲ","го":"ゴ",
                                          "Га":"ガ", "Ги":"ギ", "Гу":"グ", "Ге":"ゲ","Го":"ゴ",
                                          "за":"ザ", "дзи":"ジ", "дзу":"ズ", "зе":"ゼ","зо":"ゾ",
                                          "За":"ザ", "Дзи":"ジ", "Дзу":"ズ", "Зе":"ゼ","Зо":"ゾ",
                                          "да":"ダ", "ди":"ヂ", "ду":"ヅ", "де":"デ","до":"ド",
                                          "Да":"ダ", "Ди":"ヂ", "Ду":"ヅ", "Де":"デ","До":"ド",
                                          "ба":"バ", "би":"ビ", "бу":"ブ", "бе":"ベ","бо":"ボ",
                                          "Ба":"バ", "Би":"ビ", "Бу":"ブ", "Бе":"ベ","Бо":"ボ",
                                          "па":"パ", "пи":"ピ", "пу":"プ", "пе":"ペ","по":"ポ",
                                          "Па":"パ", "Пи":"ピ", "Пу":"プ", "Пе":"ペ","По":"ポ"
        ])
    
}


