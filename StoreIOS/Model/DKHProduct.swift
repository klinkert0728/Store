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
import ReachabilitySwift

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
    
    override class func primaryKey() -> String? {
        return "uuid"
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override class func ignoredProperties() -> [String] {
        return ["imagesArray"]
    }
    
    func mapping(map: Map) {
        
        uuid                <- map["uuid"]
        name                <- map["name"]
        productDescription  <- map["description"]
        price               <- map["price"]
        category            <- map["category"]
        store               <- map["store"]
        imagesArray         <- map["images"]
    }
    
    class func getProductsByCategory(endpoint:DKHEndPoint, selectedCategory:String,successClosure:@escaping (_ products:[DKHProduct])->(),errorClosure: @escaping (_ error:String)->()) {
        
        let reachability = Reachability()!
        if reachability.currentReachabilityStatus == .notReachable {
            Realm.update { (realm) in
                let products  = realm.objects(DKHProduct.self).filter("uud == '\(selectedCategory)'")
                if products.count > 0 {
                    successClosure(Array(products))
                }else {
                    errorClosure("No on database")
                }
            }
        }else {
            DKHAPIClient.sharedClient.requestArrayOfObject(endpoint: endpoint, completionHandler: { (products:[DKHProduct]) in
                Realm.update(updateClosure: { (realm) in
                    realm.add(products, update: true)
                })
                successClosure(products)
            }, errorClosure: {error in
                errorClosure(error.localizedDescription)
            })
        }
    }
}
