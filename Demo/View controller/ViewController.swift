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
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            let infoSection = PresentableSection()
            infoSection.append(Presentable<TableViewCell>.create({ cell in
                cell.textLabel?.numberOfLines = 0
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
        section.append(Presentable<TableViewCell>.create({ cell in
            cell.textLabel?.text = "Push to level: \((self.level + 1))"
            cell.accessoryType = .disclosureIndicator
        }).cellSelected {
            self.navigationViewController?.push(viewController: ViewController(self.level + 1), animation: .bounce)
        })
        if level > 0 {
            section.append(Presentable<TableViewCell>.create({ cell in
                cell.textLabel?.text = "Pop to level: \((self.level - 1))"
                cell.accessoryType = .disclosureIndicator
            }).cellSelected {
                self.navigationViewController?.popViewController(animation: .bounce)
            })
        }
        data.append(section)
        
        section.append(Presentable<TableViewCell>.create({ cell in
            cell.textLabel?.text = "Title only"
            cell.accessoryType = .disclosureIndicator
        }).cellSelected {
            self.navigation.content.prompt = nil
            self.navigation.content.title = "This is only title!"
            self.navigation.content.subtitle = nil
        })
        section.append(Presentable<TableViewCell>.create({ cell in
            cell.textLabel?.text = "All"
            cell.accessoryType = .disclosureIndicator
        }).cellSelected {
            self.navigation.content.prompt = "This is a prompt!"
            self.navigation.content.title = "This is a title!"
            self.navigation.content.subtitle = "This is a subtitle, yay!!!!"
        })
        section.append(Presentable<TableViewCell>.create({ cell in
            cell.textLabel?.text = "Prompt & title"
            cell.accessoryType = .disclosureIndicator
        }).cellSelected {
            self.navigation.content.prompt = "This is my little prompt"
            self.navigation.content.title = "This is title!"
            self.navigation.content.subtitle = nil
        })
        section.append(Presentable<TableViewCell>.create({ cell in
            cell.textLabel?.text = "Title & subtitle"
            cell.accessoryType = .disclosureIndicator
        }).cellSelected {
            self.navigation.content.prompt = nil
            self.navigation.content.title = "This is title!"
            self.navigation.content.subtitle = "This is subtitle"
        })
        section.append(Presentable<TableViewCell>.create({ cell in
            cell.textLabel?.text = "Prompt & subtitle"
            cell.accessoryType = .disclosureIndicator
        }).cellSelected {
            self.navigation.content.prompt = "This is my little prompt"
            self.navigation.content.title = nil
            self.navigation.content.subtitle = "This is subtitle"
        })
        section.append(Presentable<TableViewCell>.create({ cell in
            cell.textLabel?.text = "Subtitle only"
            cell.accessoryType = .disclosureIndicator
        }).cellSelected {
            self.navigation.content.prompt = nil
            self.navigation.content.title = nil
            self.navigation.content.subtitle = "This is only subtitle, but a very long one! Lorem ipsum dolor sit amet fiscum dolae.  Lorem ipsum dolor sit amet fiscum dolae.  Lorem ipsum dolor sit amet fiscum dolae. "
        })
        
        presentableManager.selectedCell = { info in
            info.tableView.deselectRow(at: info.indexPath, animated: true)
        }
        
        view.backgroundColor = .random
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    // MARK: Initialization

    /// Initializer
    init(_ level: Int = 0) {
        self.level = level

        super.init(nibName: nil, bundle: nil)
        
        navigation.content.prompt = "MarcoPolo"
        navigation.content.title = "Level \(level)"
        navigation.content.subtitle = "You can change the level using the interface below"
    }

    /// Not implemented
    @available(*, unavailable, message: "Initializer unavailable")
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }

}

