//
//  BackArrow.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


/// Back arrow type
public class BackArrow {
    
    enum Storage {
        
        /// Bold arrow
        case bold(UIColor?)
        
        /// Regular arrow
        case regular(UIColor?)
        
        /// Light arrow
        case light(UIColor?)
        
    }
    
    let storage: Storage
    
    private var _color: UIColor?
    public var color: UIColor {
        get {
            guard let color = _color else {
                guard let color = UIButton().tintColor else {
                    fatalError("There should always be color!!!")
                }
                _color = color
                return color
            }
            return color
        }
        set { _color = newValue }
    }
    
    init(_ value: Storage) {
        storage = value
    }
    
    /// Bold arrow
    public static func bold(_ color: UIColor? = nil) -> BackArrow { return .init(.bold(color)) }
    
    /// Regular arrow
    public static func regular(_ color: UIColor? = nil) -> BackArrow { return .init(.regular(color)) }
    
    /// Light arrow
    public static func light(_ color: UIColor? = nil) -> BackArrow { return .init(.light(color)) }
    
}

extension BackArrow {
    
    /// Convert arrow type to an image button
    public func asButton() -> UIButton {
        let button = UIButton()
        button.setImage(image(), for: .normal)
        button.backgroundColor = .green
        button.sizeToFit()
        if button.bounds.size.width < 36 {
            button.bounds.size.width = 36
        }
        if button.bounds.size.height < 36 {
            button.bounds.size.height = 36
        }
        return button
    }
    
    /// Image representation of the arrow
    public func image() -> UIImage? {
        let bezierPath = UIBezierPath()
        switch storage {
        case .light:
            bezierPath.move(to: CGPoint(x: 14.34, y: 24.8))
            bezierPath.addLine(to: CGPoint(x: 14.78, y: 24.41))
            bezierPath.addCurve(to: CGPoint(x: 14.78, y: 23.46), controlPoint1: CGPoint(x: 15.07, y: 24.14), controlPoint2: CGPoint(x: 15.07, y: 23.72))
            bezierPath.addLine(to: CGPoint(x: 2.67, y: 12.5))
            bezierPath.addLine(to: CGPoint(x: 14.78, y: 1.54))
            bezierPath.addCurve(to: CGPoint(x: 14.78, y: 0.59), controlPoint1: CGPoint(x: 15.07, y: 1.28), controlPoint2: CGPoint(x: 15.07, y: 0.86))
            bezierPath.addLine(to: CGPoint(x: 14.34, y: 0.2))
            bezierPath.addCurve(to: CGPoint(x: 13.29, y: 0.2), controlPoint1: CGPoint(x: 14.05, y: -0.07), controlPoint2: CGPoint(x: 13.58, y: -0.07))
            bezierPath.addLine(to: CGPoint(x: 0.22, y: 12.02))
            bezierPath.addCurve(to: CGPoint(x: 0.22, y: 12.98), controlPoint1: CGPoint(x: -0.07, y: 12.29), controlPoint2: CGPoint(x: -0.07, y: 12.71))
            bezierPath.addLine(to: CGPoint(x: 13.29, y: 24.8))
            bezierPath.addCurve(to: CGPoint(x: 14.34, y: 24.8), controlPoint1: CGPoint(x: 13.58, y: 25.07), controlPoint2: CGPoint(x: 14.05, y: 25.07))
            
        case .regular:
            bezierPath.move(to: CGPoint(x: 14.01, y: 24.8))
            bezierPath.addLine(to: CGPoint(x: 15.19, y: 23.68))
            bezierPath.addCurve(to: CGPoint(x: 15.19, y: 22.73), controlPoint1: CGPoint(x: 15.46, y: 23.42), controlPoint2: CGPoint(x: 15.46, y: 22.99))
            bezierPath.addLine(to: CGPoint(x: 4.48, y: 12.5))
            bezierPath.addLine(to: CGPoint(x: 15.19, y: 2.27))
            bezierPath.addCurve(to: CGPoint(x: 15.19, y: 1.32), controlPoint1: CGPoint(x: 15.46, y: 2.01), controlPoint2: CGPoint(x: 15.46, y: 1.58))
            bezierPath.addLine(to: CGPoint(x: 14.01, y: 0.2))
            bezierPath.addCurve(to: CGPoint(x: 13.01, y: 0.2), controlPoint1: CGPoint(x: 13.73, y: -0.07), controlPoint2: CGPoint(x: 13.28, y: -0.07))
            bezierPath.addLine(to: CGPoint(x: 0.6, y: 12.02))
            bezierPath.addCurve(to: CGPoint(x: 0.6, y: 12.98), controlPoint1: CGPoint(x: 0.32, y: 12.29), controlPoint2: CGPoint(x: 0.32, y: 12.71))
            bezierPath.addLine(to: CGPoint(x: 13.01, y: 24.8))
            bezierPath.addCurve(to: CGPoint(x: 14.01, y: 24.8), controlPoint1: CGPoint(x: 13.28, y: 25.07), controlPoint2: CGPoint(x: 13.73, y: 25.07))
        case .bold:
            bezierPath.move(to: CGPoint(x: 0.4, y: 11.53))
            bezierPath.addLine(to: CGPoint(x: 11.4, y: 0.4))
            bezierPath.addCurve(to: CGPoint(x: 13.32, y: 0.4), controlPoint1: CGPoint(x: 11.93, y: -0.13), controlPoint2: CGPoint(x: 12.79, y: -0.13))
            bezierPath.addLine(to: CGPoint(x: 14.6, y: 1.7))
            bezierPath.addCurve(to: CGPoint(x: 14.6, y: 3.64), controlPoint1: CGPoint(x: 15.13, y: 2.24), controlPoint2: CGPoint(x: 15.13, y: 3.1))
            bezierPath.addLine(to: CGPoint(x: 5.89, y: 12.5))
            bezierPath.addLine(to: CGPoint(x: 14.6, y: 21.36))
            bezierPath.addCurve(to: CGPoint(x: 14.6, y: 23.3), controlPoint1: CGPoint(x: 15.13, y: 21.9), controlPoint2: CGPoint(x: 15.13, y: 22.76))
            bezierPath.addLine(to: CGPoint(x: 13.32, y: 24.6))
            bezierPath.addCurve(to: CGPoint(x: 11.4, y: 24.6), controlPoint1: CGPoint(x: 12.79, y: 25.13), controlPoint2: CGPoint(x: 11.93, y: 25.13))
            bezierPath.addLine(to: CGPoint(x: 0.4, y: 13.47))
            bezierPath.addCurve(to: CGPoint(x: 0.4, y: 11.53), controlPoint1: CGPoint(x: -0.13, y: 12.93), controlPoint2: CGPoint(x: -0.13, y: 12.06))

        }
        bezierPath.close()
        color.setFill()
        
        return bezierPath.fill(imageOfSize: CGSize(width: 15, height: 25))
    }
    
}
