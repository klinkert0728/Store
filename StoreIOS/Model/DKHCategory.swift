//
//  DKHCategory.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/18/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift


class DKHCategory:Object,Mappable {
    
    dynamic var uuid                    = ""
    dynamic var name                    = ""
    dynamic var categoryDescription     = ""
    dynamic var avatar                  = ""

    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        uuid                    <- map["uuid"]
        name                    <- map["name"]
        categoryDescription     <- map["description"]
        avatar                  <- map["avatar"]
    }
}
