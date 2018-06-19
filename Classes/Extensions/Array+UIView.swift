//
//  Array+UIView.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 19/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
import UIKit


extension Array where Element: UIView {
    
    /// Remove all views from their superviews
    func removeAllFromSuperview() {
        forEach { $0.removeFromSuperview() }
    }
    
    func removeAllConstraints() {
        forEach { $0.removeConstraints($0.constraints) }
    }
    
    /// Set alpha on all views
    func alpha(_ value: CGFloat) {
        forEach { $0.alpha = value }
    }
    
}
