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
    
    public let promptLabel = ReportingLabel()
    public let titleLabel = ReportingLabel()
    public let subtitleLabel = ReportingLabel()
    
    public var promptTitleMargin: CGFloat = 12
    public var titleSubtitleMargin: CGFloat = 6
    public var promptSubtitleMargin: CGFloat = 6
    
    var titleLabelTopConstraint: NSLayoutConstraint!
    var subtitleLabelTopConstraint: NSLayoutConstraint!
    
    
    // MARK: Layout
    
    func makeLayout() {
        // Title
        if titleLabelTopConstraint != nil {
            titleLabel.removeConstraint(titleLabelTopConstraint)
        }
        if promptLabel.text.isEmpty {
            titleLabelTopConstraint = titleLabel.layout.pinTopToSuperview()
        } else {
            titleLabelTopConstraint = titleLabel.layout.pinTopToBottom(view: promptLabel, margin: promptTitleMargin)
        }
        
        // Subtitle
        if subtitleLabelTopConstraint != nil {
            subtitleLabel.removeConstraint(subtitleLabelTopConstraint)
        }
        if titleLabel.text.isEmpty {
            if promptLabel.text.isEmpty {
                subtitleLabelTopConstraint = subtitleLabel.layout.pinTopToSuperview()
            } else {
                subtitleLabelTopConstraint = subtitleLabel.layout.pinTopToBottom(view: promptLabel, margin: promptSubtitleMargin)
            }
        } else {
            subtitleLabelTopConstraint = subtitleLabel.layout.pinTopToBottom(view: titleLabel, margin: titleSubtitleMargin)
        }
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
        promptLabel.text = "Prompt"
        promptLabel.textDidChange = { text in
            self.makeLayout()
        }
        addSubview(promptLabel)
        promptLabel.layout.pinTopToSuperview()
        promptLabel.layout.pinHorizontalEdgesToSuperView()
        promptLabel.layout.makeBottomLessThanOrEqualToSuperview()
        
        // Title
        titleLabel.text = "Title"
        titleLabel.textDidChange = { text in
            self.makeLayout()
        }
        addSubview(titleLabel)
        titleLabel.layout.pinHorizontalEdgesToSuperView()
        titleLabel.layout.makeBottomLessThanOrEqualToSuperview()
        
        // Subtitle
        subtitleLabel.text = "Subtitle"
        subtitleLabel.textDidChange = { text in
            self.makeLayout()
        }
        addSubview(subtitleLabel)
        subtitleLabel.layout.pinHorizontalEdgesToSuperView()
        subtitleLabel.layout.makeBottomLessThanOrEqualToSuperview()
    }
    
    @available(*, unavailable, message: "Initializer unavailable")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
