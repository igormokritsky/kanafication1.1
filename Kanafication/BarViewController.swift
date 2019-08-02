//
//  BarViewController.swift
//  Kanafication
//
//  Created by Ihor Mokrytskyi on 3/1/19.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//

import UIKit

class BarViewController: UITabBarController {

    var tabBarIteam = UITabBarItem()
    
    
    
    override func viewDidLoad() {
        
        
        
        tabBar.barTintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        super.viewDidLoad()
        
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        let selectedImageKana = UIImage(named: "kana1")?.withRenderingMode(.alwaysOriginal)
        let deSelectedImageKana = UIImage(named: "kana2")?.withRenderingMode(.alwaysOriginal)
        tabBarIteam = (self.tabBar.items?[0])!
        tabBarIteam.image = deSelectedImageKana
        tabBarIteam.selectedImage = selectedImageKana
        
        let selectedImageText =  UIImage(named: "text1")?.withRenderingMode(.alwaysOriginal)
        let deselectedImageText = UIImage(named: "text2")?.withRenderingMode(.alwaysOriginal)
        tabBarIteam = (self.tabBar.items?[1])!
        tabBarIteam.image = deselectedImageText
        tabBarIteam.selectedImage =  selectedImageText
        
        let selectedImageStar =  UIImage(named: "starred1")?.withRenderingMode(.alwaysOriginal)
        let deselectedImageStar = UIImage(named: "starred2")?.withRenderingMode(.alwaysOriginal)
        tabBarIteam = (self.tabBar.items?[2])!
        tabBarIteam.image = deselectedImageStar
        tabBarIteam.selectedImage = selectedImageStar
        
        self.selectedIndex = 0
        
        
        
        
        
        
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        let index = self.tabBar.items?.firstIndex(of: item)
        let subView = tabBar.subviews[index!+1].subviews.first as! UIImageView
        self.performSpringAnimation(sender: subView)
    }

    // MARK: func to perform spring animation on imageview
    func performSpringAnimation(sender: UIImageView) {

        UIView.animate(withDuration: 0.2,
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
