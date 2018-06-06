
//
//  Animation.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import CoreGraphics


/// View controller push pop animations
public struct Animation {
    
    enum Storage: Hashable {
        
        /// No animation
        case none
        
        /// Default (paralax) animation on push, previously used one on pop
        case `default`(TimeInterval)
        
        /// Paralax animation
        case paralax(TimeInterval)
        
        /// Move alongside
        case move(TimeInterval)
        
        /// Bounce on screen
        case bounce
        
        /// Go over the current view controller
        case over(TimeInterval)
        
    }
    
    /// Internal value store
    let storage: Storage
    
    /// No animation
    public static var none = Animation(storage: .none)
    
    /// Default (paralax) animation on push, previously used one on pop
    public static func `default`(duration: TimeInterval = 0.3) -> Animation { return Animation(storage: .default(duration)) }
    
    /// Paralax animation
    public static func paralax(duration: TimeInterval = 0.3) -> Animation { return Animation(storage: .paralax(duration)) }
    
    /// Move alongside
    public static func move(duration: TimeInterval = 0.3) -> Animation { return Animation(storage: .move(duration)) }
    
    /// Bounce on screen
    public static var bounce = Animation(storage: .bounce)
    
    /// Go over the current view controller
    public static func over(duration: TimeInterval = 0.3) -> Animation { return Animation(storage: .over(duration)) }
    
    // TODO: Add closure based custom animation!!!
    
}

extension Animation.Storage {
    
    /// Animation time extraction
    var animationTime: TimeInterval {
        switch self {
        case .default(let time), .paralax(let time), .move(let time), .over(let time):
            return time
        default:
            return 0.3
        }
    }
    
}
