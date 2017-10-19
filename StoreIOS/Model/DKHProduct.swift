//
//  DKHProduct.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/18/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class DKHProduct:Object,Mappable {
    
    dynamic var uuid                    = ""
    dynamic var name                    = ""
    dynamic var productDescription      = ""
    dynamic var price                   = ""
    dynamic var category                = ""
    dynamic var store                   = ""
    var images                          = List<RealmString>()
    
    private var imagesArray:[String] {
        set {
            images.removeAll()
            images.append(objectsIn: newValue.map({RealmString(value:[$0])}))
        }
        get {
            return images.map({$0.value})
        }
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override class func ignoredProperties() -> [String] {
        return ["imagesArray"]
    }
    
    func mapping(map: Map) {
        
    }
    
    
}
