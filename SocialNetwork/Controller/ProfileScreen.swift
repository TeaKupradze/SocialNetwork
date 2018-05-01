//
//  ProfileScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 5/1/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit

class ProfileScreen: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLbl.text = UserDefaults.standard.object(forKey: "userName") as? String
        profileImageView.image = UIImage(data: (UserDefaults.standard.object(forKey: "avatar") as? Data)!)
    
    }

    @IBAction func goToHomeScreen(_ sender: UIButton) {
        navigationController?.popViewController(animated:true)
    }
    
}
