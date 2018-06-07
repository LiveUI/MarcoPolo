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
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        layout.printSafeInsets()
        
        if #available(iOS 11, *) {
            topConstraint?.constant = (safeAreaInsets.top + topMargin)
        } else {
            topConstraint?.constant = topMargin
        }
    }
    
    /// Top margin below status bar safe area
    public var topMargin: CGFloat {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    var topConstraint: NSLayoutConstraint?
    
    var navigationBarHeight: NSLayoutConstraint!
    
    public var minHeight: CGFloat {
        didSet {
            navigationBarHeight.constant = minHeight
        }
    }
    
    var navigationViewController: NavigationViewController?
    
    /// Background view, always on the bottom; Ideal for
    public var backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
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
            
            topConstraint = view.layout.pinTopToSuperview()
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
        
        // TODO: Check on an older device/iOS!!!!
        if #available(iOS 11, *) {
            topMargin = 6
        } else {
            topMargin = 28
        }
        
        super.init(frame: .zero)
        
        backgroundColor = .clear
        backgroundView.tintColor = .white
        
        addSubview(backgroundView)
        backgroundView.layout.fillSuperview()
        
        let titleView = TitleView()
        titleView.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        addSubview(titleView)
        customTitleView = titleView
        
        layout.printSafeInsets()
    }
    
    @available(*, unavailable, message: "Initializer unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
