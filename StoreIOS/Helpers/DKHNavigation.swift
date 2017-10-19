//
//  DKHNavigation.swift
//  LAFEMME
//
//  Created by Daniel Klinkert Houfer on 4/20/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import Foundation
import UIKit

class DKHNavigation {
    
    class func selectStoreCategories() -> SelectCategoryTableViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectCategoryTableViewController") as! SelectCategoryTableViewController
    }
    
}
