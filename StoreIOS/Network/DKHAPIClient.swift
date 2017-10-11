//
//  DKHAPIClient.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/11/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper
import AlamofireObjectMapper
import Alamofire
import RealmSwift

class DKHAPIClient {
    static var sharedClient: DKHAPIClient {
        return DKHAPIClient()
    }
    
    func requestObject<T:Object>(endpoint: DKHEndPoint,keyPath:String? = nil ,completionHandler:@escaping (_ object:T) ->(),errorClosure:@escaping (_ error:Error)->()) where T : Mappable {
        
        
        Alamofire.request(endpoint.url, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.parameterEncoding, headers: endpoint.customHeaders).responseObject { (response:DataResponse<T>) in
            
            if let value = response.value, response.result.isSuccess, response.response?.statusCode == 200 {
                completionHandler(value)
            }else {
                
                guard let responseData = response.data, let dictionaryObject = try? JSONSerialization.jsonObject(with: responseData, options: []), let dict = dictionaryObject as? [String:Any] else {
                    let newError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey:"Illegal login response."])
                    errorClosure(newError)
                    
                    return
                }
                
                if let err = dict["error"] as? String, let statusCode = dict["statusCode"] as? Int {
                    if let message = dict["message"] as? String {
                        
                        let newError = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey:message])
                        
                        errorClosure(newError)
                    }
                    else {
                        let newError = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Error: \(err); Http code: \(statusCode)"])
                        errorClosure(newError)
                    }
                }
            }
        }
    }
    
    
    func requestArrayOfObject<T:Object>(endpoint: DKHEndPoint,keyPath:String?  = nil ,completionHandler:@escaping (_ object:[T]) ->(),errorClosure:@escaping (_ error:Error)->()) where T : Mappable {
        
        Alamofire.request(endpoint.url, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.parameterEncoding, headers: endpoint.customHeaders).responseArray(keyPath:keyPath) { (response:DataResponse<[T]>) in
            
            if let value = response.value, response.result.isSuccess, response.response?.statusCode == 200 {
                completionHandler(value)
            }else {
                
                guard let responseData = response.data, let dictionaryObject = try? JSONSerialization.jsonObject(with: responseData, options: []), let dict = dictionaryObject as? [String:Any] else {
                    let newError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey:"Illegal login response."])
                    errorClosure(newError)
                    
                    return
                }
                
                if let err = dict["error"] as? String, let statusCode = dict["statusCode"] as? Int {
                    if let message = dict["message"] as? String {
                        
                        let newError = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey:message])
                        
                        errorClosure(newError)
                    }
                    else {
                        let newError = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Error: \(err); Http code: \(statusCode)"])
                        errorClosure(newError)
                    }
                }
            }
        }
    }
    
    func requestJSONObject(endpoint: DKHEndPoint,completionHandler:@escaping (_ object:Any) ->(),errorClosure:@escaping (_ error:Error)->()) {
        Alamofire.request(endpoint.url, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.parameterEncoding, headers: endpoint.customHeaders).responseJSON(completionHandler: { (response:DataResponse<Any>) in
            
            if let value = response.value, response.result.isSuccess, response.response?.statusCode == 200 {
                completionHandler(value)
            }else {
                
                guard let responseData = response.data, let dictionaryObject = try? JSONSerialization.jsonObject(with: responseData, options: []), let dict = dictionaryObject as? [String:Any] else {
                    let newError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey:"Illegal login response."])
                    errorClosure(newError)
                    
                    return
                }
                
                if let err = dict["error"] as? String, let statusCode = dict["statusCode"] as? Int {
                    if let message = dict["message"] as? String {
                        
                        let newError = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey:message])
                        
                        errorClosure(newError)
                    }
                    else {
                        let newError = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Error: \(err); Http code: \(statusCode)"])
                        errorClosure(newError)
                    }
                }
            }
        })
    }
}
