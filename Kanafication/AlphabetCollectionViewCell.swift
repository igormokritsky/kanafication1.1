//
//  AlphabetCollectionViewCell.swift
//  Kanafication
//
//  Created by Dmytrii Golovanov on 4/2/19.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//

import UIKit

class AlphabetCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var letterLabel: UILabel?
    @IBOutlet weak var textLabel: UILabel?
 

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
    }
}
