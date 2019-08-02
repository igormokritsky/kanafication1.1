//
//  KanaPageViewController.swift
//  Kanafication
//
//  Created by Ihor Mokrytskyi on 3/1/19.
//  Copyright © 2019 Ihor Mokrytskyi. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
   
    
    lazy var subViewControllers:[UIViewController] = {
        return [
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HiraganaViewController") as! HiraganaViewController,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "KatakanaViewController") as! KatakanaViewController,
//        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NumbersViewController") as! NumbersViewController
        
        ]
        
        
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
    
    
        self.view.backgroundColor = UIColor.white
        
   setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        
        if currentIndex <= 0 {
            return nil
        }
        
        return subViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        
        if currentIndex >= (subViewControllers.count - 1) {
            return nil
        }
        
        return subViewControllers[currentIndex + 1]
        
        }
    
   
   
    
    
    }
   
    
    
    


