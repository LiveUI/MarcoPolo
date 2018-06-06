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
    
    public var navigationItem: NavigationItem!
    
    var navigationBarHeight: NSLayoutConstraint!
    
    public var height: CGFloat {
        didSet {
            navigationBarHeight.constant = height
        }
    }
    
    var navigationViewController: NavigationViewController?
    
    public var backgroundView = UIView()
    
    // MARK: Layout
    
    @available(*, unavailable, message: "Method unavailable")
    open override func didMoveToSuperview() {
        navigationBarHeight = layout.height(height)
    }
    
    // MARK: Initialization
    
    public init(height: CGFloat = 64.0) {
        self.height = height
        
        super.init(frame: .zero)
        
        navigationItem = NavigationItem(self)
        backgroundColor = .lightGray
    }
    
    @available(*, unavailable, message: "Initializer unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
