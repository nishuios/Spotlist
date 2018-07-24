//
//  UIImageView+extension.swift
//  JSON
//
//  Created by Umbrella Systems on 03/07/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    convenience init(baseImageView: UIImageView, frame: CGRect) {
        self.init(frame: CGRect.zero)
        
        image = baseImageView.image
        contentMode = baseImageView.contentMode
        clipsToBounds = true
        self.frame = frame
    }
}
