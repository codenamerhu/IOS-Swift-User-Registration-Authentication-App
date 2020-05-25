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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
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
