//
//  Custom_Textfields.swift
//  JSON
//
//  Created by Umbrella Systems on 13/06/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class Custom_Textfields:UITextField{
    
    
    @IBInspectable var cornerradius:CGFloat = 0{
        
        didSet{
            
            self.layer.cornerRadius = cornerradius
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
    
}
