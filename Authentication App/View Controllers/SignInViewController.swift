//
//  SignInViewController.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/24.
//  Copyright © 2020 SBI. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var fbSigninButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    
    @IBOutlet weak var topWrapper: UIView!
    let imageChecked = UIImage(named: "checked") as UIImage?
    let imageNotChecked = UIImage(named: "not checked") as UIImage?
    
    @IBOutlet weak var rememberMeButton: UIButton!
    var isRemeberMeCheck = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    @IBAction func onCheckPress(_ sender: Any) {
        checkRememberMe()
        
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
