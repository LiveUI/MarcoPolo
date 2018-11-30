//
//  NavigationBar.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


/// Navigation bar view
open class NavigationBar: UIView {
    
    /// Leading (left bar button) items content view
    let leadingItemsContentView = BarItemsContentView(.left)
    
    /// Trailing (right bar button) items content view
    let trailingItemsContentView = BarItemsContentView(.right)
    
    /// Leading (left bar button) items spacing
    public var leftItemsSpacing: CGFloat {
        get { return leadingItemsContentView.spacing }
        set { leadingItemsContentView.spacing = newValue }
    }
    
    /// Trailing (right bar button) items spacing
    public var trailingFirstItemSpacing: CGFloat {
        get { return trailingItemsContentView.firstItemSpacing }
        set { trailingItemsContentView.firstItemSpacing = newValue }
    }
    
    /// Leading (left bar button) items spacing
    public var leftFirstItemSpacing: CGFloat {
        get { return leadingItemsContentView.firstItemSpacing }
        set { leadingItemsContentView.firstItemSpacing = newValue }
    }
    
    /// Trailing (right bar button) items spacing
    public var trailingItemsSpacing: CGFloat {
        get { return trailingItemsContentView.spacing }
        set { trailingItemsContentView.spacing = newValue }
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
    
    /// Minimum height of the navigation bar
    public var minHeight: CGFloat {
        didSet {
            minHeightConstraint?.constant = minHeight
        }
    }
    
    /// Navigation view controller reference
    var navigationViewController: NavigationViewController!
    
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
            view.leftAnchor.constraint(equalTo: leadingItemsContentView.rightAnchor).isActive = true
            view.rightAnchor.constraint(equalTo: trailingItemsContentView.leftAnchor).isActive = true
            view.layout.bottomLessThanOrEqual(margin: -6)
            view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
    }
    
    /// Content view
    public var contentView = UIView()
    
    /// Shadow
    public let shadowView = NavigationBarShadow()
    
    /// Toggle shadow
    public var hasShadow: Bool {
        set { clipsToBounds = !newValue }
        get { return !clipsToBounds }
    }
    
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
    private func setupContentViews() {
        // Main content
        addSubview(contentView)
        topConstraint = contentView.layout.top()
        contentView.layout.sides()
        minHeightConstraint = contentView.layout.min(height: minHeight)
        contentView.layout.bottomLessThanOrEqual()
        
        // Left items
        contentView.addSubview(leadingItemsContentView)
        leadingItemsContentView.layout.leading()
        leadingItemsContentView.layout.centerY()
        
        // Right items
        contentView.addSubview(trailingItemsContentView)
        trailingItemsContentView.layout.trailing()
        trailingItemsContentView.layout.centerY()
        
        if leadingItemsContentView.intrinsicContentSize.width > trailingItemsContentView.intrinsicContentSize.width {
            leadingItemsContentView.widthAnchor.constraint(greaterThanOrEqualTo: trailingItemsContentView.widthAnchor, multiplier: 1.0).isActive = true

        }else{
            trailingItemsContentView.widthAnchor.constraint(greaterThanOrEqualTo: leadingItemsContentView.widthAnchor, multiplier: 1.0).isActive = true

        }
        
    }
    
    /// Setup title view
    private func setupTitleView() {
        let titleView = TitleView()
        contentView.addSubview(titleView)
        customTitleView = titleView
    }
    
    /// Setup shadow
    private func setupShadowView() {
        addSubview(shadowView)
        shadowView.layout.top(toBottom: self)
        shadowView.layout.sides()
        shadowView.layout.height(6)
    }
    
    /// Designated initializer
    public init(minHeight: CGFloat = 44) {
        self.minHeight = minHeight
        
        // TODO: Check on older devices/iOS!!!!
        if #available(iOS 11, *) {
            topMargin = 6
        } else {
            topMargin = 28
        }
        
        super.init(frame: .zero)
        
        setupBackground()
        setupContentViews()
        setupTitleView()
        setupShadowView()
    }
    
    /// Not implemented
    @available(*, unavailable, message: "Initializer unavailable")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
