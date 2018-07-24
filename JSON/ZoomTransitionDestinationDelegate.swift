//
//  ZoomTransitionDestinationDelegate.swift
//  JSON
//
//  Created by Umbrella Systems on 03/07/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import Foundation
import UIKit
@objc public protocol ZoomTransitionDestinationDelegate: NSObjectProtocol {
    
    func transitionDestinationImageViewFrame(forward: Bool) -> CGRect
    @objc optional func transitionDestinationWillBegin()
    @objc optional func transitionDestinationDidEnd(transitioningImageView imageView: UIImageView)
    @objc optional func transitionDestinationDidCancel()
}
