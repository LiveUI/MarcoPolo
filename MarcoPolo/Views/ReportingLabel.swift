//
//  ReportingLabel.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


/// Label with internal text observation callback
public class ReportingLabel: UILabel {
    
    /// Callback
    internal var textDidChange: ((String?) -> Void)?
    
    /// Set text override
    public override var text: String? {
        get { return super.text }
        set {
            super.text = newValue
            textDidChange?(newValue)
        }
    }
    
}
