//
//  OTPViewController.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/26.
//  Copyright © 2020 SBI. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {

    
        @IBOutlet weak var countryCode: UITextField!
        @IBOutlet weak var phone: UITextField!
        
        var otpCode:String = ""
        var matchOtp:String!
        
        @IBOutlet weak var returnedValue: UITextField!
        
        override
        func viewDidLoad() {
            super.viewDidLoad()
            
        }
        @IBAction func clickCountryCode(_ sender: Any) {
            self.present(openViewController(_storyboard: "Auth", idName: "signuppage", vc: SignUpViewController()), animated: true, completion: nil)
        }
        
        @IBAction func sendOtp(_ sender: Any) {
            
            guard countryCode.text != nil else {
                
                print("code should not be empty")
                return
            }
            
            guard phone != nil else {
                
                print("phone should not be empty")
                return
            }
            
            let code = countryCode.text!
            let cell_phone = phone.text!
            
            let c1 = "\(Int.random(in: 1..<9))"
            let c2 = "\(Int.random(in: 1..<9))"
            let c3 = "\(Int.random(in: 1..<9))"
            let c4 = "\(Int.random(in: 1..<9))"
            let c5 = "\(Int.random(in: 1..<9))"
            
            otpCode = "\(c1)\(c2)\(c3)\(c4)\(c5)"
            print(otpCode)
            self.code(code: otpCode)
            let reqbody = ["phone":"\(code)\(cell_phone)",
                "message":"OTP: \(otpCode)"]
            print(reqbody)
            //otp(reqbody: reqbody)
            
            
        }
        
        
        func otp(reqbody:[String:String]){
            
            AuthappNetworkService.otp(reqbody, resultCallback: {
            res in
            
            print("OOra")
            print(res! as Any)
            if let status:Dictionary<String,AnyObject> = res!{
                print(status)
                print("here")
                print(status["isSuccessful"]!)
                //LMLoading.hide()
                switch status["isSuccessful"] as! Int {
                    case 1:
                        print("natha oora")
                    
                    
                        // Open app home page
                    //self.present(openViewController(_storyboard:"App",idName: "testpage2", vc: HomeViewController()), animated: true, completion: nil)
                    
                    case 0:
                        print("Nope")
                    showMessageDialog("Error", message: "Email or Password incorrect", image: nil, axis: .horizontal, viewController: self, handler: {
                        
                        // Clear password text field
                        //self.passwordTextField.text = ""
                        
                    })
                        
                    default:
                        print()
                    }
                }
            
            }, errorCallback: { (err) in
                
                if (err.containsIgnoringCase(find: "serialize") || err.containsIgnoringCase(find: "JSON")){
                    DispatchQueue.main.async {
                        //self.delegate?.peachPay(self, didFailPaymentWithResult: ["error" : err as AnyObject])
                    }
                }else{
                    showMessageDialog("Error", message: err, image: nil, axis: .horizontal, viewController: self, handler: {
                        
                    })
                }
                print(err)
            })
            
        }
        
        func code(code:String) -> String {
            self.matchOtp = code
            return matchOtp
        }
        
        @IBAction func verifyOtp(_ sender: Any) {
            
            guard returnedValue.text != nil else {
                
                print("ot field should not be empty")
                return
            }
            
            //var otp_returned = returnedValue.text!
            
            print(matchOtp!)
            print("and")
            print(returnedValue.text!)
            
            if matchOtp! == returnedValue.text! {
                self.present(openViewController(_storyboard:"Main",idName: Constants.updateID(), vc: UpdateProfileViewController()), animated: true, completion: nil)
            } else {
                print("Incorrect otp")
            }
        }
    }

