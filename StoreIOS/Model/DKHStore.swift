//
//  DKHStore.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/11/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class DKHStore: Object,Mappable {
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
    }

}
