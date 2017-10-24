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
    
    dynamic var uuid        = ""
    dynamic var name        = ""
    dynamic var email       = ""
    dynamic var userType    = ""
    dynamic var token       = ""
    
    
    class var currentUser:DKHUser? {
        var user:DKHUser? = nil
        Realm.update { (realm) in
            user = realm.objects(DKHUser.self).first
        }
        return user
    }
    
    class var isLoggedIn:Bool {
        return currentUser != nil
    }
    
    class func logOut() {
        Realm.update { (realm) in
            realm.delete(realm.objects(DKHUser.self))
        }
    }
    convenience required init?(map: Map) {
        self.init()
    }
    
   override class func primaryKey() -> String? { return "uuid" }
    
    func mapping(map: Map) {
        
        
        uuid        <- map["uuid"]
        name        <- map["name"]
        email       <- map["userType"]
        token       <- map["token"]
    }
    
    class func login(email:String,password:String,successClosure: @escaping (_ user:DKHUser)->(),errorClosure:@escaping (_ message:String)->()) {
        DKHAPIClient.sharedClient.requestObject(endpoint: DKHEndPoint.login(email: email, password: password), completionHandler: { (user:DKHUser) in
            Realm.update(updateClosure: { (realm) in
                realm.delete(realm.objects(DKHUser.self))
                realm.add(user)
            })
            successClosure(user)
        }, errorClosure: {error in
            
            errorClosure(error.localizedDescription)
        })
    }
    

}
