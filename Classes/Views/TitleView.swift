//
//  TitleView.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


/// Title view
public class TitleView: UIView {
    
    /// Content data model
    public final class Content {
        
        var titleView: TitleView?
        var viewController: UIViewController?
        
        public var prompt: String? {
            didSet {
                titleView?.promptLabel.text = prompt
            }
        }
        
        public var title: String? {
            didSet {
                titleView?.titleLabel.text = title
            }
        }
        
        public var subtitle: String? {
            didSet {
                titleView?.subtitleLabel.text = subtitle
            }
        }
        
        public init(prompt: String? = nil, title: String? = nil, subtitle: String? = nil) {
            self.prompt = prompt
            self.title = title
            self.subtitle = subtitle
        }
        
    }
    
    /// Prompt label (positioned on the top)
    public let promptLabel = ReportingLabel()
    
    /// Title label (positioned in the middle)
    public let titleLabel = ReportingLabel()
    
    /// Subtitle label (positioned at the bottom)
    public let subtitleLabel = ReportingLabel()
    
    /// Space between prompt and title (default is 6px)
    public var promptTitleMargin: CGFloat = 6 {
        didSet {
            makeSafeLayout()
        }
    }
    
    /// Space between title and subtitle (default is 6px)
    public var titleSubtitleMargin: CGFloat = 6 {
        didSet {
            makeSafeLayout()
        }
    }
    
    /// Space between prompt and subtitle (default is 6px)
    public var promptSubtitleMargin: CGFloat = 6 {
        didSet {
            makeSafeLayout()
        }
    }
    
    /// Prompt top constraint
    private var promptLabelTopConstraint: NSLayoutConstraint!
    
    /// Title top constraint
    private var titleLabelTopConstraint: NSLayoutConstraint!
    
    /// Subtitle top constraint
    private var subtitleLabelTopConstraint: NSLayoutConstraint!
    
    /// Disable layouting temporarily
    private var disableLayout: Bool = false
    
    /// Content for the title view
    public var content: Content? {
        didSet {
            disableLayout = true
            content?.titleView = self
            promptLabel.text = content?.prompt
            titleLabel.text = content?.title
            subtitleLabel.text = content?.subtitle
            disableLayout = false
            
            makeLayout()
        }
    }
    
    // MARK: Layout
    
    /// Make layout only if on superview
    private func makeSafeLayout() {
        if superview != nil {
            makeLayout()
        }
    }
    
    /// Layout based on content
    private func makeLayout() {
        // Prompt
        promptLabelTopConstraint.constant = 0
        
        // Title
        if !titleLabel.text.isEmpty {
            if !promptLabel.text.isEmpty {
                titleLabelTopConstraint.constant = promptTitleMargin
            } else {
                titleLabelTopConstraint.constant = 0
            }
        }

        // Subtitle
        if !subtitleLabel.text.isEmpty {
            if !titleLabel.text.isEmpty {
                subtitleLabelTopConstraint.constant = titleSubtitleMargin
            } else if !promptLabel.text.isEmpty {
                titleLabelTopConstraint.constant = 0
                subtitleLabelTopConstraint.constant = promptSubtitleMargin
            } else {
                subtitleLabelTopConstraint.constant = 0
            }
        } else {
            subtitleLabelTopConstraint.constant = 0
        }

        layoutIfNeeded()
    }
    
    // MARK: View lifecycle
    
    public override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if newSuperview != nil {
            makeLayout()
        }
    }
    
    // MARK: Initialization & setup
    
    /// Setup prompt label
    private func setupPrompt() {
        promptLabel.textAlignment = .center
        promptLabel.font = UIFont.systemFont(ofSize: 12)
        promptLabel.textColor = .darkGray
        promptLabel.numberOfLines = 0
        promptLabel.textDidChange = { text in
            self.makeLayout()
        }
        addSubview(promptLabel)
        promptLabelTopConstraint = promptLabel.layout.top()
        promptLabel.layout.minSides()
        promptLabel.layout.bottomLessThanOrEqual()
    }
    
    /// Setup title label
    private func setupTitle() {
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.textColor = .darkText
        titleLabel.numberOfLines = 0
        titleLabel.textDidChange = { text in
            self.makeLayout()
        }
        addSubview(titleLabel)
        titleLabelTopConstraint = titleLabel.layout.top(toBottom: promptLabel)
        titleLabel.layout.minSides()
        titleLabel.layout.bottomLessThanOrEqual()
    }
    
    /// Setup subtitle label
    private func setupSubtitle() {
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.systemFont(ofSize: 13)
        subtitleLabel.textColor = .darkGray
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textDidChange = { text in
            self.makeLayout()
        }
        addSubview(subtitleLabel)
        subtitleLabelTopConstraint = subtitleLabel.layout.top(toBottom: titleLabel)
        subtitleLabel.layout.minSides()
        subtitleLabel.layout.bottomLessThanOrEqual()
    }
    
    /// Designated initializer
    public init() {
        super.init(frame: .zero)
        
        setupPrompt()
        setupTitle()
        setupSubtitle()
    }
    
    /// Not implemented
    @available(*, unavailable, message: "Initializer unavailable")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
