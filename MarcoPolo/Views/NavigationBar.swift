//
//  NavigationBar.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


open class NavigationBar: UIView {
    
    public enum Style {
        
        case title
        
        case titleSubtitle
        
    }
    
    public var style: Style
    
    var navigationBarHeight: NSLayoutConstraint!
    
    public var height: CGFloat {
        didSet {
            navigationBarHeight.constant = height
        }
    }
    
    var navigationViewController: NavigationViewController?
    
    public var backgroundView = UIView()
    
    public func set(style: Style, animated: Bool) {
        self.style = style
    }
    
    // MARK: Layout
    
    @available(*, unavailable, message: "Method unavailable")
    open override func didMoveToSuperview() {
        navigationBarHeight = layout.height(height)
    }
    
    // MARK: Initialization
    
    public init(_ style: Style = .title, height: CGFloat = 64.0) {
        self.style = style
        
        self.height = height
        
        super.init(frame: .zero)
        
        backgroundColor = .lightGray
    }
    
    @available(*, unavailable, message: "Initializer unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
