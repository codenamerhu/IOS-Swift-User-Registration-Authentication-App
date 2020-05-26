//
//  SignUpViewController.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/24.
//  Copyright © 2020 SBI. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var fbSignupButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    
    @IBOutlet weak var rememberMeButton: UIButton!
    
    let imageChecked = UIImage(named: "checked") as UIImage?
    let imageNotChecked = UIImage(named: "not checked") as UIImage?
    
    var isRemeberMeCheck = false
    
    @IBOutlet weak var full_name: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm_password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        
        full_name.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        username.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        password.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        confirm_password.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
    }

    @IBAction func createAccount(_ sender: Any) {
        
        
        if full_name.backgroundColor == .red {
            full_name.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        if username.backgroundColor == .red {
            username.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        if password.backgroundColor == .red {
            password.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        if confirm_password.backgroundColor == .red {
            confirm_password.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        guard full_name.text != "" else {
            
            print("Name text field should not be empty")
            full_name.backgroundColor = .red
            full_name.placeholder = "Full name | required"
            return
        }
        
        guard username.text != "" else {
            
            print("Email text field should not be empty")
            username.backgroundColor = .red
            username.placeholder = "Email | required"
            return
        }
        
        
        guard password.text != "" else {
            
            print("Password text field should not be empty")
            password.backgroundColor = .red
            password.placeholder = "Password | required"
            return
        }
        
        guard confirm_password.text != "" else {
            
            print("Confirm password text field should not be empty")
            confirm_password.backgroundColor = .red
            confirm_password.placeholder = "Confirm password | required"
            return
        }
        
        guard password.text == confirm_password.text else {
            print("passwords don't match")
            confirm_password.backgroundColor = .red
            confirm_password.text = ""
            confirm_password.placeholder = "Passwords do not match"
            return
        }
        
        //loadingV(is_loading: true)
        
        let name = full_name.text!
        let user = username.text!
        let pass = password.text!
        
        let reqbody = ["full_name":name,"username":user,"password":pass]
        register(reqbody: reqbody)
    }
    
    @IBAction func checkPressed(_ sender: Any) { checkRememberMe() }
}

// UI Config
extension SignUpViewController {
    
       func configureUI(){
           setImage()
           setupButtons()
       }
       
       func setImage(){
           
           rememberMeButton.setImage(imageNotChecked, for: .normal)
           rememberMeButton.contentVerticalAlignment = .fill
           rememberMeButton.contentHorizontalAlignment = .fill
       }
       
       func setupButtons(){
           
           signupButton.layer.cornerRadius = signupButton.frame.height
            / 2
           
           fbSignupButton.layer.cornerRadius = fbSignupButton.frame.height
           / 2
       }
}

extension SignUpViewController {
    
    func checkRememberMe(){
        
        print("in check")
        if isRemeberMeCheck == false {
            
            rememberMeButton.setImage(imageChecked, for: .normal)
            print("on")
            isRemeberMeCheck = true
        } else {
            rememberMeButton.setImage(imageNotChecked, for: .normal)
            print("off")
            isRemeberMeCheck = false
        }
    }
}

// signup api call
extension SignUpViewController {
    
   func register(reqbody:[String:String]){
        
        AuthappNetworkService.register(reqbody, resultCallback: {
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
                
                    //self.loadingV(is_loading: false)
                    // Open app home page
                self.present(openViewController(_storyboard:"Main",idName: "otpPage", vc: OTPViewController()), animated: true, completion: nil)
                
                case 0:
                    print("Nope")
                    //self.loadingV(is_loading: false)
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
                    //self.loadingV(is_loading: false)
                    //self.delegate?.peachPay(self, didFailPaymentWithResult: ["error" : err as AnyObject])
                }
            }else{
                //self.loadingV(is_loading: false)
                showMessageDialog("Error", message: err, image: nil, axis: .horizontal, viewController: self, handler: {
                    
                })
            }
            print(err)
        })
    }
}
