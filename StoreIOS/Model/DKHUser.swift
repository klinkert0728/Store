//
//  DKHUser.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/11/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class DKHUser: Object,Mappable {
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
    }
}
