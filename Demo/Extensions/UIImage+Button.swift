//
//  UIImage+Button.swift
//  Demo
//
//  Created by Ondrej Rafaj on 19/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
import AwesomeEnum


extension Amazing {
    
    func asButton(size: CGSize = CGSize(width: 27, height: 27), color: UIColor? = nil) -> UIButton {
        let b = UIButton()
        b.setImage(asImage(size: size, color: (color ?? b.tintColor)), for: .normal)
        b.imageView?.tintColor = b.tintColor
        return b
    }
    
}
