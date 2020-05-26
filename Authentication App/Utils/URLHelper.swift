//
//  URLHelper.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/26.
//  Copyright © 2020 SBI. All rights reserved.
//
import UIKit

class URLHelper: NSObject {
    
    static let isStaging = false
    
    class func getURL(_ URLKey:String) -> String {
        
        return self.getURL(URLKey, withURLParam: [:])
    }
    
    
    class func getURL(_ URLKey:String ,withURLParam:Dictionary<String,String>) -> String{
        if (!withURLParam.isEmpty){
            var str:String!
           str =  Constants.relativeURL()[URLKey]!
            for (key,value) in withURLParam{
               str = str.replacingOccurrences(of: ":" + key, with: value)
            }
            return (isStaging ? Constants.sandboxBaseURL(): Constants.liveBaseURL()) + str!
            
        }else{
            print((isStaging ? Constants.sandboxBaseURL(): Constants.liveBaseURL()) + Constants.relativeURL()[URLKey]!)
            
            return (isStaging ? Constants.sandboxBaseURL(): Constants.liveBaseURL()) + Constants.relativeURL()[URLKey]!
        }
    }
}
