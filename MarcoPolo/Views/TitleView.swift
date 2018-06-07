//
//  TitleView.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


public class TitleView: UIView {
    
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
    
    public let promptLabel = ReportingLabel()
    public let titleLabel = ReportingLabel()
    public let subtitleLabel = ReportingLabel()
    
    public var promptTitleMargin: CGFloat = 12
    public var titleSubtitleMargin: CGFloat = 6
    public var promptSubtitleMargin: CGFloat = 6
    
    var titleLabelTopConstraint: NSLayoutConstraint!
    var subtitleLabelTopConstraint: NSLayoutConstraint!
    
    var disableLayout: Bool = false
    
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
    
    func makeLayout() {
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
            subtitleLabelTopConstraint.constant =  0
        }

        layoutIfNeeded()
    }
    
    public override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if newSuperview != nil {
            makeLayout()
        }
    }
    
    // MARK: Initialization
    
    public init() {
        super.init(frame: .zero)
        
        // Prompt
        promptLabel.textAlignment = .center
        promptLabel.font = UIFont.systemFont(ofSize: 11)
        promptLabel.textColor = .darkGray
        promptLabel.numberOfLines = 0
        promptLabel.textDidChange = { text in
            self.makeLayout()
        }
        addSubview(promptLabel)
        promptLabel.layout.pinTopToSuperview()
        promptLabel.layout.pinHorizontalEdgesToSuperView()
        promptLabel.layout.makeBottomLessThanOrEqualToSuperview()
        
        // Title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .darkText
        titleLabel.numberOfLines = 0
        titleLabel.textDidChange = { text in
            self.makeLayout()
        }
        addSubview(titleLabel)
        titleLabelTopConstraint = titleLabel.layout.pinTopToBottom(view: promptLabel)
        titleLabel.layout.pinHorizontalEdgesToSuperView()
        titleLabel.layout.makeBottomLessThanOrEqualToSuperview()
        
        // Subtitle
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.textColor = .darkGray
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textDidChange = { text in
            self.makeLayout()
        }
        addSubview(subtitleLabel)
        subtitleLabelTopConstraint = subtitleLabel.layout.pinTopToBottom(view: titleLabel)
        subtitleLabel.layout.pinHorizontalEdgesToSuperView()
        subtitleLabel.layout.makeBottomLessThanOrEqualToSuperview()
    }
    
    @available(*, unavailable, message: "Initializer unavailable")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
