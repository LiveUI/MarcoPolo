//
//  ReportingLabel.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


public class ReportingLabel: UILabel {
    
    var textDidChange: ((String?) -> Void)?
    
    public override var text: String? {
        get { return super.text }
        set {
            super.text = newValue
            textDidChange?(newValue)
        }
    }
    
}
