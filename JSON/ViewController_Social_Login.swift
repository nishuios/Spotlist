//
//  ViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 03/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.

import UIKit


class ViewController_Social_Login: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let blue = UIColor(red: 48/255.0, green: 62/255.0, blue: 103/255.0, alpha: 1/0)
//        let orange = UIColor(red: 244/255.0, green: 88/255.0, blue: 53/255.0, alpha: 1/0)
//        let pink = UIColor(red: 198/255.0, green: 70/255.0, blue: 107/255.0, alpha: 1/0)
         let gradient = CAGradientLayer()
        
        let blue = UIColor(red: 48/255.0, green: 62/255.0, blue: 50/255.0, alpha: 1/0)
        let orange = UIColor(red: 244/255.0, green: 88/255.0, blue: 53/255.0, alpha: 1/0)
        let pink = UIColor(red: 120/255.0, green: 70/255.0, blue: 107/255.0, alpha: 1/0)
        
        gradient.colors = [blue.cgColor, orange.cgColor, pink.cgColor]
        gradient.locations = [0.0 , 0.75 , 1.0]
        gradient.startPoint = CGPoint(x: 0.75, y: 1.75)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = view.frame
        self.view.layer.insertSublayer(gradient, at: 0)
        
       
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
    }
}

