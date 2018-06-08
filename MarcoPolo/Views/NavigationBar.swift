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
    
    /// Layout subviews
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
    
    /// Top constraint of the content view
    var topConstraint: NSLayoutConstraint?
    
    /// Navigation bar min height
    var minHeightConstraint: NSLayoutConstraint?
    
    public var minHeight: CGFloat {
        didSet {
            minHeightConstraint?.constant = minHeight
        }
    }
    
    var navigationViewController: NavigationViewController?
    
    /// Background view, always on the bottom
    public var backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
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
            
            view.layout.centerVertically()
            view.layout.pinHorizontalEdgesToSuperView(left: 30, right: 30)
            view.layout.makeBottomLessThanOrEqualToSuperview(margin: -6)
        }
    }
    
    /// Content view
    public var contentView = UIView()
    
    // MARK: Initialization
    
    public init(minHeight: CGFloat = 44) {
        self.minHeight = minHeight
        
        // TODO: Check on an older device/iOS!!!!
        if #available(iOS 11, *) {
            topMargin = 6
        } else {
            topMargin = 28
        }
        
        super.init(frame: .zero)
        
        // Background
        backgroundColor = .clear
        backgroundView.tintColor = .white
        addSubview(backgroundView)
        backgroundView.layout.fillSuperview()
        
        // Content view
        addSubview(contentView)
        topConstraint = contentView.layout.pinTopToSuperview()
        contentView.layout.pinHorizontalEdgesToSuperView()
        minHeightConstraint = contentView.layout.min(height: minHeight)
        contentView.layout.makeBottomLessThanOrEqualToSuperview()
        
        // Title view
        let titleView = TitleView()
        titleView.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        contentView.addSubview(titleView)
        customTitleView = titleView
        
        layout.printSafeInsets()
    }
    
    @available(*, unavailable, message: "Initializer unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
