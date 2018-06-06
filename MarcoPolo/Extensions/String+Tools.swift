//
//  String+Tools.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 06/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation


extension Optional where Wrapped == String {
    
    var isEmpty: Bool {
        guard let string = self else {
            return true
        }
        return string.isEmpty
    }
    
}
