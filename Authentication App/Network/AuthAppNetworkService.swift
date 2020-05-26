//
//  AuthAppNetworkService.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/26.
//  Copyright © 2020 SBI. All rights reserved.
//

import Alamofire
import CommonCrypto

class AuthappNetworkService:NSObject {
    
    class func login(_ bodyParam:Dictionary<String,Any>,resultCallback:@escaping (_ Result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        
        let defaults = UserDefaults.standard
        
        
        let manager = AF
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        manager.request(URLHelper.getURL("LOGIN"),method: .post, parameters: bodyParam).responseJSON {
            
            res in switch res.result {
            
             
         case .success(_):
            
             let data = res.value as! Dictionary<String,AnyObject>
             print(data)
             
             let validate = data["isSuccessful"]
             print(validate!)
             
             
             if(Int(truncating: data["isSuccessful"]! as! NSNumber) == 0){
                print("fail")
                resultCallback(data)
            }
            else {
                print("success")
                let result = res.value as! Dictionary<String,AnyObject>
                print("result: ")
                print(result)
                
                print("\(data["user"]!["first_name"]!!)")
                
                
                defaults.set("\(data["user"]!["id"]!!)", forKey: Keys.user_id)
                defaults.set("\(data["user"]!["full_name"]!!)", forKey: Keys.full_name)/*
                defaults.set("\(data["user"]!["first_name"]!!)", forKey: Keys.first_name)
                defaults.set("\(data["user"]!["last_name"]!!)", forKey: Keys.last_name) */
                defaults.set("\(data["user"]!["username"]!!)", forKey: Keys.username)
                
                if "\(data["user"]!["isProvider"]!!)" == "0" {
                    
                    defaults.set(false, forKey: Keys.is_provider)
                } else {
                    defaults.set(true, forKey: Keys.is_provider)
                }
                
                
                defaults.set(true, forKey: Keys.is_logged_in)
                
                
                    resultCallback(data)
                
            }
                
             
         case .failure(let errorOut):
             print(errorOut)
             print("some error")
             
             
            errorCallback(res.error!.localizedDescription)
         }
        }
        
    }
    
    class func register(_ bodyParam:Dictionary<String,Any>,resultCallback:@escaping (_ Result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        
        /*
        let headers = [
            "Content-Type": "application/json"
        ]*/
        //encoding: JSONEncoding.default, headers: nil
        
        let defaults = UserDefaults.standard
        
        let manager = AF
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        manager.request(URLHelper.getURL("REGISTER"),method: .post, parameters: bodyParam).responseJSON {
           
         res in switch res.result {
            
             
         case .success(_):
            
              let data = res.value as! Dictionary<String,AnyObject>
              print(data)
              
              let validate = data["isSuccessful"]
              print(validate!)
              
              
              if(Int(truncating: data["isSuccessful"]! as! NSNumber) == 0){
                 print("fail")
                 resultCallback(data)
             }
             else {
                 print("success")
                 let result = res.value as! Dictionary<String,AnyObject>
                 print("result: ")
                 print(result)
                 
                 print("\(data["user"]!["first_name"]!!)")
                 
                 
                 defaults.set("\(data["user"]!["id"]!!)", forKey: Keys.user_id)
                 defaults.set("\(data["user"]!["full_name"]!!)", forKey: Keys.full_name) /*
                 defaults.set("\(data["user"]!["first_name"]!!)", forKey: Keys.first_name)
                 defaults.set("\(data["user"]!["last_name"]!!)", forKey: Keys.last_name) */
                 defaults.set("\(data["user"]!["username"]!!)", forKey: Keys.username)
                 
                 if "\(data["user"]!["isProvider"]!!)" == "0" {
                     
                     defaults.set(false, forKey: Keys.is_provider)
                 } else {
                     defaults.set(true, forKey: Keys.is_provider)
                 }
                 
                 
                 defaults.set(true, forKey: Keys.is_logged_in)
                 
                 
                     resultCallback(data)
                 
             }
            
             
         case .failure(let errorOut):
             print(errorOut)
             errorCallback( res.error!.localizedDescription)
         }
        }
    }
    
    class func otp(_ bodyParam:Dictionary<String,Any>,resultCallback:@escaping (_ Result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        
        /*
        let headers = [
            "Content-Type": "application/json"
        ]*/
        //encoding: JSONEncoding.default, headers: nil
        
        let defaults = UserDefaults.standard
        
        let manager = AF
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        manager.request(URLHelper.getURL("OTP"),method: .post, parameters: bodyParam).responseJSON {
            
         res in switch res.result {
            
             
         case .success(_):
            
              let data = res.value as! Dictionary<String,AnyObject>
              print(data)
              
              let validate = data["isSuccessful"]
              print(validate!)
              
              
              if(Int(truncating: data["isSuccessful"]! as! NSNumber) == 0){
                 print("fail")
                 resultCallback(data)
             }
             else {
                 print("success")
                 let result = res.value as! Dictionary<String,AnyObject>
                 print("result: ")
                 print(result)
                 
                 
                     resultCallback(data)
                 
             }
            
             
         case .failure(let errorOut):
             print(errorOut)
             errorCallback( res.error!.localizedDescription)
         }
        }
    }
    
    
    class func add_org(_ bodyParam:Dictionary<String,Any>,resultCallback:@escaping (_ Result:Dictionary<String,AnyObject>?) -> Void ,errorCallback:@escaping (_ err:String) -> Void ){
        
        /*
        let headers = [
            "Content-Type": "application/json"
        ]*/
        //encoding: JSONEncoding.default, headers: nil
        
        let manager = AF
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        manager.request(URLHelper.getURL("Add-ORG"),method: .post, parameters: bodyParam).responseJSON {
            
         res in switch res.result {
            
             
         case .success(_):
            
              let data = res.value as! Dictionary<String,AnyObject>
              print(data)
              
              let validate = data["isSuccessful"]
              print(validate!)
              
              
              if(Int(truncating: data["isSuccessful"]! as! NSNumber) == 0){
                 print("fail")
                 resultCallback(data)
             }
             else {
                 print("success")
                 let result = res.value as! Dictionary<String,AnyObject>
                 print("result: ")
                 print(result)
                 
                 
                     resultCallback(data)
                 
             }
             
         case .failure(let errorOut):
             print(errorOut)
             errorCallback( res.error!.localizedDescription)
         }
        }
    }
    
    
}
