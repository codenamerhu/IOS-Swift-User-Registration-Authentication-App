//
//  Constants.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/24.
//  Copyright © 2020 SBI. All rights reserved.
//
import Alamofire

public class Constants {
    
    public let entryID = "entryPage"
    let signinID = "signinPage"
    let signupID = "signupPage"
    let updateID = "updatePage"
    
    class func updateID() -> String { return "updatePage" }
    
    class func sandboxBaseURL() -> String { return "https://authapp001.herokuapp.com/" }
    
    class func liveBaseURL () -> String { return "https://authapp001.herokuapp.com/" }
    
    class func isConnectedToInternet() ->Bool { return NetworkReachabilityManager()!.isReachable }
    
    class func relativeURL()->Dictionary<String,String>{
        return [
            "LOGIN"     : "api/auth/login",
            "REGISTER"  : "api/auth/signup",
            "OTP"       : "api/auth/send-otp",
            
            /*
            "ADD-ORANIZATIONS" : "api/",
            "PAY"       : "api/payment/pay",
            "GET-ORG" : "api/messaging/create-organization",
            "GET-CHANNELS" : "api/messaging/create-channel",
            "GET-ORANIZATIONS" : "", */
            
        ]
    }
}

struct Keys {
    static let full_name    = "full_name"
    static let first_name   = "first_name"
    static let last_name    = "last_name"
    static let username     = "username"
    static let user_id      = "user_id"
    static let is_logged_in = "is_logged_in"
    static let is_provider  = "is_provider"
}
