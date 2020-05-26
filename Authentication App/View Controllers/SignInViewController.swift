//
//  SignInViewController.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/24.
//  Copyright © 2020 SBI. All rights reserved.
//

import UIKit
import CommonCrypto

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var fbSigninButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    
    @IBOutlet weak var topWrapper: UIView!
    let imageChecked = UIImage(named: "checked") as UIImage?
    let imageNotChecked = UIImage(named: "not checked") as UIImage?
    
    @IBOutlet weak var rememberMeButton: UIButton!
    var isRemeberMeCheck = false
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        // Escape text fields
        emailTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        passwordTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
    }
    
    @IBAction func signIn(_ sender: Any) {
        
        if emailTextField.backgroundColor == .red {
            emailTextField.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        if passwordTextField.backgroundColor == .red {
            passwordTextField.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        }
        
        guard emailTextField.text != "" else {
            
            print("Email field show not be empty")
            emailTextField.backgroundColor = .red
            emailTextField.placeholder = "Email | required"
            return
        }
        
        guard passwordTextField.text != "" else {
            
            print("Password field show not be empty")
            passwordTextField.backgroundColor = .red
            passwordTextField.placeholder = "Password | required"
            return
        }
        
        //loadingV(is_loading: true)
        
        let email       = emailTextField.text!
        let password    = passwordTextField.text!
        
        
        let reqbody = ["username":email,
                       "password":password]
        
        self.login(reqbody: reqbody)
    }
    
    @IBAction func onCheckPress(_ sender: Any) {
        checkRememberMe()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SignInViewController {
    
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

// UI
extension SignInViewController {
    
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
        
        signinButton.layer.cornerRadius = signinButton.frame.height
         / 2
        
        fbSigninButton.layer.cornerRadius = fbSigninButton.frame.height
        / 2
        
    }
}
// Login Api call
extension SignInViewController {
    
    func login(reqbody:[String:String]){
        
        AuthappNetworkService.login(reqbody, resultCallback: {
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
                        //self.loadingV(is_loading: false)
                        self.present(openViewController(_storyboard:"Main",idName: Constants.updateID(), vc: UpdateProfileViewController()), animated: true, completion: nil)
                    
                    case 0:
                        //self.loadingV(is_loading: false)
                        print("Nope")
                    showMessageDialog("Error", message: "Email or Password incorrect", image: nil, axis: .horizontal, viewController: self, handler: {
                        
                        // Clear password text field
                        self.passwordTextField.text = ""
                        
                    })
                        
                    default:
                        print()
                    }
                }
            
            }, errorCallback: { (err) in
                
                if (err.containsIgnoringCase(find: "serialize") || err.containsIgnoringCase(find: "JSON")){
                    DispatchQueue.main.async {
                       // self.loadingV(is_loading: false)
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
