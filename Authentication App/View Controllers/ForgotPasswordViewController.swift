//
//  ForgotPasswordViewController.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/24.
//  Copyright © 2020 SBI. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    

}


// Configure UI
extension ForgotPasswordViewController {
    
    func configureUI(){
        setupButtons()
    }
    
    func setupButtons(){
        
        sendButton.layer.cornerRadius = sendButton.frame.height / 2
    }
    
}
