//
//  ViewController.swift
//  MarcoPolo
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import UIKit
import Presentables


class ViewController: PresentableTableViewController {
    
    let level: Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            let infoSection = PresentableSection()
            infoSection.append(Presentable<UITableViewCell>.create({ cell in
                cell.textLabel?.numberOfLines = 0
                cell.backgroundColor = UIColor(white: 1, alpha: 0.3)
                cell.textLabel?.text = """
                Safe area:
                    - top: \(self.view.safeAreaInsets.top)
                    - left: \(self.view.safeAreaInsets.left)
                    - right: \(self.view.safeAreaInsets.right)
                    - bottom: \(self.view.safeAreaInsets.bottom)
                """
            }))
            data.append(infoSection)
        }
        
        let section = PresentableSection()
        section.append(Presentable<UITableViewCell>.create({ cell in
            cell.textLabel?.text = "Push to level: \((self.level + 1))"
            cell.backgroundColor = UIColor(white: 1, alpha: 0.3)
            cell.accessoryType = .disclosureIndicator
        }).cellSelected {
            self.navigationViewController?.push(viewController: ViewController(self.level + 1), animation: .bounce)
        })
        if level > 0 {
            section.append(Presentable<UITableViewCell>.create({ cell in
                cell.textLabel?.text = "Pop to level: \((self.level - 1))"
                cell.backgroundColor = UIColor(white: 1, alpha: 0.3)
                cell.accessoryType = .disclosureIndicator
            }).cellSelected {
                self.navigationViewController?.popViewController(animation: .bounce)
            })
        }
        data.append(section)
        
        presentableManager.selectedCell = { info in
            info.tableView.deselectRow(at: info.indexPath, animated: true)
        }
        
        view.backgroundColor = .random
        tableView.tableFooterView = UIView()
    }
    
    // MARK: Initialization

    /// Initializer
    init(_ level: Int = 0) {
        self.level = level

        super.init(nibName: nil, bundle: nil)
    }

    /// Not implemented
    @available(*, unavailable, message: "Initializer unavailable")
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }

}

