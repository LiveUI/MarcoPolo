//
//  TableViewCell.swift
//  Demo
//
//  Created by Ondrej Rafaj on 07/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import Foundation
import UIKit


class TableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(white: 1, alpha: 0.3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
