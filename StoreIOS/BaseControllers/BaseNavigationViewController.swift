//
//  BaseNavigationViewController.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/18/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {
    
    @IBInspectable var colorNavBar:String  = "" {
        didSet {
            Appearance.colorNavigationBar(color: UIColor.colorFromString(titleColor: colorNavBar), navigationBar: navigationBar)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureAppearance() {
        if colorNavBar.characters.count > 0 {
            Appearance.colorNavigationBar(color: UIColor.colorFromString(titleColor: colorNavBar), navigationBar: navigationBar)
        }
        
        self.navigationItem.leftBarButtonItem   = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
