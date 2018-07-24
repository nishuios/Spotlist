//
//  customview.swift
//  JSON
//
//  Created by Umbrella Systems on 02/06/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class customview:UIView{
    
    @IBInspectable var cornerradius:CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerradius
        }
    }
    
    @IBInspectable  var backgroundcolor : UIColor = UIColor.brown {
        didSet{
            
            self.layer.backgroundColor = backgroundcolor.cgColor
        }
    }

    
    @IBInspectable var borderwidth:CGFloat = 0{
        didSet{
            
            self.layer.borderWidth = borderwidth
        }
    }

    
    @IBInspectable var bordercolor:UIColor = UIColor.clear{
        didSet{
           self.layer.borderColor = bordercolor.cgColor
            
        }
    }

    @IBInspectable var shadowcolor:UIColor = UIColor.clear{
        didSet{
            
            self.layer.shadowColor = shadowcolor.cgColor
        }
    }
    
    @IBInspectable var shadowopactity:Float = 0{
        didSet{
            self.layer.shadowOpacity = shadowopactity
        }
    }
    
    @IBInspectable var shadowopactitywidth:CGFloat = 0{
        didSet{
            
            self.layer.shadowOffset.width = shadowopactitywidth
        }
    }

    
    @IBInspectable var shadowopactityheight:CGFloat = 0{
        didSet{
            
            self.layer.shadowOffset.height = shadowopactityheight
        }
    }
    
    
   }
