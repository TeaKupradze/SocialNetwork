//
//  RegistrationScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 4/16/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit

class RegistrationScreen: UIViewController {
    //MARk:IBOutlet
    @IBOutlet weak var textuserNaem: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    
    //MARK:IBAcrion
    @IBAction func registerButtonClickd(_ sender: Any) {
    }
    
    @IBAction func backButtonClickd(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
