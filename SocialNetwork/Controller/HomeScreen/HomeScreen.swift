//
//  HomeScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 4/16/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLbl.text = UserDefaults.standard.object(forKey: "userName") as? String
        profileImageView.image = UIImage(data: (UserDefaults.standard.object(forKey: "avatar") as? Data)!)
    }

    
    @IBAction func galleryButtonClickd(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GallaryScreen")
        self.navigationController?.pushViewController(vc!, animated: true)
    
    }
    
    @IBAction func profileButtonClickd(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileScreen")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
