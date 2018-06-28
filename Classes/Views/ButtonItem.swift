//
//  ButtonItem.swift
//  AwesomeEnum
//
//  Created by Ondrej Rafaj on 22/06/2018.
//

@_exported import Foundation
@_exported import UIKit


open class ButtonItem: UIButton {
    
    /// Initializer
    public init(_ image: UIImage?, title: String? = nil) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
        sizeToFit()
    }
    
    /// Initializer
    public init(_ title: String, image: UIImage? = nil) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
        sizeToFit()
    }
    
    /// Not implemented
    @available(*, unavailable, message: "Initializer unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
