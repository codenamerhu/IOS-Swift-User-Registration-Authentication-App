//
//  UpdateProfileViewController.swift
//  Authentication App
//
//  Created by SBI Admin on 2020/05/24.
//  Copyright © 2020 SBI. All rights reserved.
//

import UIKit

class UpdateProfileViewController: UIViewController {

    @IBOutlet weak var profilePictures: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
    }

}


// UI Config
extension UpdateProfileViewController {
    
    func configureUI(){
        
        profileImage()
        setupButton()
    }
    
    func profileImage(){
        
        profilePictures.layer.cornerRadius = profilePictures.frame.height / 2
    }
    
    func setupButton(){
        
        saveButton.layer.cornerRadius = saveButton.frame.height / 2
    }
    
}
