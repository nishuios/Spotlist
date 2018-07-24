//
//  NavigationController.swift
//  JSON
//
//  Created by Umbrella Systems on 03/07/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import Foundation
import UIKit

final class NavigationController: UINavigationController {
    
    private let zoomNavigationControllerDelegate = ZoomNavigationControllerDelegate()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        delegate = zoomNavigationControllerDelegate
    }
}
