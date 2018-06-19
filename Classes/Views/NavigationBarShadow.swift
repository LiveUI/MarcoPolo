//
//  NavigationBarShadow.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 13/06/2018.
//

@_exported import Foundation
@_exported import UIKit


/// Shadow for navigation bar
public final class NavigationBarShadow: UIView {
    
    /// Main gradient layer
    let gradient = CAGradientLayer()
    
    /// Main color of the shadow gradient (top side, bottom is always `.clear`)
    public var topGradientColor = UIColor.lightGray.withAlphaComponent(0.13) {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    /// Layout
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        gradient.colors = [topGradientColor.cgColor, UIColor.clear.cgColor]
        gradient.frame = bounds
    }
    
    /// Initializer
    public init() {
        super.init(frame: .zero)
        
        isUserInteractionEnabled = false
        
        layer.insertSublayer(gradient, at: 0)
    }
    
    /// Not implemented
    @available(*, unavailable, message: "Initializer unavailable")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
