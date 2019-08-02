//
//  SAFollowButton.swift
//  ToggleButton
//
//  Created by Sean Allen on 6/21/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import UIKit

class KanaButton1: UIButton {
    
    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = ColorGreen.greenKanaColor.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(ColorGreen.greenKanaColor, for: .normal)
        addTarget(self, action: #selector(KanaButton1.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        let color = bool ? ColorGreen.greenKanaColor : .clear
        let title = bool ? "hiragana" : "hiragana"
        let titleColor = bool ? .white : ColorGreen.greenKanaColor
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }
}
    
    
    
    

