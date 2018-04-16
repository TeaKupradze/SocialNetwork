//
//  LogInScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 4/16/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit

class LogInScreen: UIViewController {
    //MARK:IBOutlet
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    
    //MARK:IBAction
    @IBAction func logInButtonClickd(_ sender: UIButton) {
    }
    
    
    @IBAction func registerButtonClickd(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationScreen")
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}
