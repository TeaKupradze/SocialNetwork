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
    @IBOutlet weak var textuserName: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var statusLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLbl.isHidden = true
        hideKeyboard()

    }
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
    }
    
    //MARK:HideKeyboard
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    //MARK:SaveData
    func saveData(userName : String , password : String){
        let userName = textuserName.text
        let password = textPassword.text
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(password, forKey: "password")
    }
    
    //MARK:IBAction
    @IBAction func registerButtonClickd(_ sender: Any) {
        if ((textuserName.text?.count)! > 0 && (textPassword.text?.count)! > 0 ){
            saveData(userName: textuserName.text!, password: textPassword.text!)
            statusLbl.isHidden = false
            statusLbl.text = "Register Sucssesful"
        } else{
            statusLbl.text = "Error"
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func backButtonClickd(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
