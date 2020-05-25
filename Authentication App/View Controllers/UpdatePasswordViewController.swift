//
//  UpdatePasswordViewController.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/24.
//  Copyright © 2020 SBI. All rights reserved.
//

import UIKit

class UpdatePasswordViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
}


// Configure UI
extension UpdatePasswordViewController {
    
    func configureUI(){
        setupButton()
    }
    
    func setupButton(){
        resetButton.layer.cornerRadius = resetButton.frame.height / 2
    }
}
