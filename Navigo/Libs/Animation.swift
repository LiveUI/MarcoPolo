
//
//  Animation.swift
//  Navigo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//


/// View controller push pop animations
public enum Animation {
    
    /// No animation
    case none
    
    /// Default (paralax) animation on push, previously used one on pop
    case `default`
    
    /// Paralax animation
    case paralax
    
    /// Move alongside
    case move
    
    /// Go over the current view controller
    case overlap
    
}
