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
    
    /// Minimum height of the navigation bar
    public var minHeight: CGFloat {
        didSet {
            minHeightConstraint?.constant = minHeight
        }
    }
    
    /// Navigation view controller reference
    var navigationViewController: NavigationViewController?
    
    /// Background view, always on the bottom
    public var backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    /// Title view (you can override with customTitleView)
    public var titleView: TitleView? {
        get {
            return customTitleView as? TitleView
        }
    }
    
    /// Private storage for `customTitleView`
    private var _customTitleView: UIView?
    
    /// By setting `customTitleView` you override `titleView`
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
            
            view.layout.centerY()
            view.layout.sides(left: 30, right: 30)
            view.layout.bottomLessThanOrEqual(margin: -6)
        }
    }
    
    /// Content view
    public var contentView = UIView()
    
    // MARK: Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if #available(iOS 11, *) {
            topConstraint?.constant = (safeAreaInsets.top + topMargin)
        } else {
            topConstraint?.constant = topMargin
        }
    }
    
    // MARK: Initialization & setup
    
    /// Setup background view
    private func setupBackground() {
        backgroundColor = .clear
        
        backgroundView.tintColor = .white
        addSubview(backgroundView)
        backgroundView.layout.fill()
    }
    
    /// Setup content view
    private func setupContentView() {
        addSubview(contentView)
        topConstraint = contentView.layout.top()
        contentView.layout.sides()
        minHeightConstraint = contentView.layout.min(height: minHeight)
        contentView.layout.bottomLessThanOrEqual()
    }
    
    /// Setup title view
    private func setupTitleView() {
        let titleView = TitleView()
        titleView.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        contentView.addSubview(titleView)
        customTitleView = titleView
    }
    
    /// Designated initializer
    public init(minHeight: CGFloat = 44) {
        self.minHeight = minHeight
        
        // TODO: Check on an older device/iOS!!!!
        if #available(iOS 11, *) {
            topMargin = 6
        } else {
            topMargin = 28
        }
        
        super.init(frame: .zero)
        
        setupBackground()
        setupContentView()
        setupTitleView()
    }
    
    /// Not implemented
    @available(*, unavailable, message: "Initializer unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
