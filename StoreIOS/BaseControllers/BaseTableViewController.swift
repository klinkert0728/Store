//
//  BaseTableViewController.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/18/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        configureAppearance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerCells() {
        
    }
    
    func configureAppearance() {
        tableView.tableFooterView   = UIView()
    }
}
