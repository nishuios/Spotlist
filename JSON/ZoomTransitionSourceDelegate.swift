//
//  ZoomTransitionSourceDelegate.swift
//  JSON
//
//  Created by Umbrella Systems on 03/07/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol ZoomTransitionSourceDelegate: NSObjectProtocol {
    
    func transitionSourceImageView() -> UIImageView
    func transitionSourceImageViewFrame(forward: Bool) -> CGRect
    @objc optional func transitionSourceWillBegin()
    @objc optional func transitionSourceDidEnd()
    @objc optional func transitionSourceDidCancel()
}
