//
//  ViewController.swift
//  NavCon
//
//  Created by Ondrej Rafaj on 05/06/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let level: Int
    
    let safeAreaLabel = UILabel()
    
    func updateSafeArea() {
        if #available(iOS 11.0, *) {
            safeAreaLabel.text = """
            Safe area:
                - top: \(view.safeAreaInsets.top + additionalSafeAreaInsets.top)
                - left: \(view.safeAreaInsets.left + additionalSafeAreaInsets.left)
                - right: \(view.safeAreaInsets.right + additionalSafeAreaInsets.right)
                - bottom: \(view.safeAreaInsets.bottom + additionalSafeAreaInsets.bottom)
            """
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateSafeArea()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .random
        
        updateSafeArea()
        
        safeAreaLabel.frame = CGRect(x: 50, y: 100, width: 300, height: 200)
        safeAreaLabel.numberOfLines = 0
        safeAreaLabel.textColor = .white
        safeAreaLabel.font = UIFont.boldSystemFont(ofSize: 15)
        view.addSubview(safeAreaLabel)
        
        let push = UIButton(frame: CGRect(x: 50, y: 260, width: 150, height: 44))
        push.setTitleColor(push.tintColor, for: .normal)
        push.setTitle("Push to level: \((level + 1))", for: .normal)
        push.addTarget(self, action: #selector(pushNewController(_:)), for: .touchUpInside)
        push.layer.borderWidth = 1
        push.layer.borderColor = push.tintColor.cgColor
        push.layer.cornerRadius = 5
        view.addSubview(push)
        
        if (level > 0) {
            let pop = UIButton(frame: CGRect(x: 50, y: 310, width: 150, height: 44))
            pop.setTitleColor(pop.tintColor, for: .normal)
            pop.setTitle("Pop to level: \((level - 1))", for: .normal)
            pop.addTarget(self, action: #selector(popController(_:)), for: .touchUpInside)
            pop.layer.borderWidth = 1
            pop.layer.borderColor = pop.tintColor.cgColor
            pop.layer.cornerRadius = 5
            view.addSubview(pop)
        }
    }
    
    // MARK: Actions
    
    @objc func pushNewController(_ sender: UIButton) {
        navigationViewController?.push(viewController: ViewController(level + 1))
    }
    
    @objc func popController(_ sender: UIButton) {
        navigationViewController?.popViewController()
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

