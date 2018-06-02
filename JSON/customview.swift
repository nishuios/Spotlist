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
    
    @IBInspectable var shadowcolor : UIColor = UIColor.gray
    @IBInspectable var cornerradius:CGFloat = 3
    @IBInspectable var shadowoffsetwidth: CGFloat = 6
    @IBInspectable var shadowoffsetheight: CGFloat = 6
    @IBInspectable var opacity:CGFloat = 0.5
    
    
    
    override func layoutSubviews() {
        
        layer.shadowColor = shadowcolor.cgColor
        layer.cornerRadius = cornerradius
        layer.shadowOffset.width = shadowoffsetwidth
        layer.shadowOffset.height = shadowoffsetheight
        layer.shadowOpacity = Float(opacity)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        
        
        
    }
}
