//
//  EntryViewController.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/24.
//  Copyright © 2020 SBI. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    let constant = Constants()

    @IBOutlet weak var fbSignupButton: UIButton!
    @IBOutlet weak var emailSignupButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add gesture recognizer
        configureGestures()
        setupUI()
        
    }
    
    
    
}


extension EntryViewController {
    
    func setupUI(){
        fbSignupButton.layer.cornerRadius = fbSignupButton.frame.height / 2
        emailSignupButton.layer.cornerRadius = emailSignupButton.frame.height / 2
    }
    
    // configure gesture recognizers
    func configureGestures(){
        let signInlabelTap = UITapGestureRecognizer(target: self, action: #selector(signInlabelTapped))
        
        signInLabel.addGestureRecognizer(signInlabelTap)
        signInLabel.isUserInteractionEnabled = true
    }
    
    @objc func signInlabelTapped(){
        
        
        let signinVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: constant.signinID) as! SignInViewController
        
        self.present(signinVC, animated: true, completion: nil)
        
        
    }
    
    
}
