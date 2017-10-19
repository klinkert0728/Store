//
//  DKHEndpoint.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/11/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
import ObjectMapper
import CoreLocation

protocol APIEndpoint {
    var baseUrl:URL { get }
    var path: String { get }
    var method:HTTPMethod { get }
    var parameters:[String:Any]? { get }
    var parameterEncoding: ParameterEncoding { get }
    var customHeaders: [String:String]? { get }
}

extension APIEndpoint {
    var url:URL {
        return baseUrl.appendingPathComponent(path)
    }
}

enum DKHEndPoint {
    case register(name:String,email:String,password:String,userType:String)
    case getCategories()
    case getProductsByCategory(categoryUuid:String)
}


extension DKHEndPoint:APIEndpoint {
    
    var baseUrl:URL {
        switch  self {
        default:
            return URL(string: "http://138.197.33.33:4001/")!
        }
    }
    
    var path:String {
        switch self {
        case .getCategories():
            return "category"
        case .getProductsByCategory(categoryUuid: let categoryUUid):
            return "product\(categoryUUid)"
        case .register(name: _, email: _, password: _, userType: _):
            return "user"
        default:
            return "json"
        }
        
    }
    
    var method: HTTPMethod {
        
        switch self {
        case .register(name: _, email: _, password: _, userType: _):
            return .post
        default:
            return .get
        }
    }
    
    var parameters:[String:Any]? {
        
        switch self {
        case .register(name: let name, email: let email, password: let password, userType: _):
            return ["name":name,"email":email,"password":password,"userType":"str"]
        default:
            return [:]
        }
    }
    
    var customHeaders:[String:String]? {
        let pre = NSLocale.preferredLanguages[0]
        switch self {
        default:
            return ["Authorization": "Bearer \("hola")","Content-Type":"application/json","Accept-Language":pre]
        }
    }
    
    var parameterEncoding:ParameterEncoding {
        
        switch self {
        default:
            return JSONEncoding.default
        }
        
    }
}
