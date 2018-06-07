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
    
    var navigationBarHeight: NSLayoutConstraint!
    
    public var minHeight: CGFloat {
        didSet {
            navigationBarHeight.constant = minHeight
        }
    }
    
    var navigationViewController: NavigationViewController?
    
    /// Background view, always on the bottom; Ideal for
    public var backgroundView = UIView()
    public var titleView: TitleView? {
        get {
            return customTitleView as? TitleView
        }
    }
    public var _customTitleView: UIView?
    public var customTitleView: UIView? {
        get { return _customTitleView }
        set {
            if _customTitleView === newValue { return }
            _customTitleView?.removeFromSuperview()
            guard let view = newValue else {
                _customTitleView?.removeFromSuperview()
                _customTitleView = nil
                return
            }
            _customTitleView = view
            
            view.layout.pinTopToSuperview(margin: 44)
            view.layout.pinHorizontalEdgesToSuperView(left: 30, right: 30)
            view.layout.makeBottomLessThanOrEqualToSuperview(margin: -6)
        }
    }
    
    // MARK: Layout
    
    @available(*, unavailable, message: "Method unavailable")
    open override func didMoveToSuperview() {
        super.didMoveToSuperview()
        navigationBarHeight = layout.min(height: minHeight)
    }
    
    // MARK: Initialization
    
    public init(minHeight: CGFloat = 164.0) {
        self.minHeight = minHeight
        
        super.init(frame: .zero)
        
        backgroundColor = UIColor(white: 1, alpha: 0.9)
        
        addSubview(backgroundView)
        backgroundView.layout.fillSuperview()
        
        let titleView = TitleView()
        titleView.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        addSubview(titleView)
        customTitleView = titleView
    }
    
    @available(*, unavailable, message: "Initializer unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
