//
//  NavigationItem.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


public class NavigationItem {
    
    /// Private interface for title views content
    private var _content: TitleView.Content?
    
    /// Content for title view
    public var content: TitleView.Content {
        get {
            guard let content = _content else {
                let content = TitleView.Content()
                self.content = content
                return content
            }
            return content
        }
        set { _content = newValue }
    }
    
}
