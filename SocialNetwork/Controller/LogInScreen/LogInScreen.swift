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
    @IBOutlet weak fileprivate var txtEmail: UITextField!
    @IBOutlet weak fileprivate var txtPassword: UITextField!
    @IBOutlet weak fileprivate var statusLbl: UILabel!
    
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
    //MARC:GOTOHomeScreen
    func goToHomeScreen(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeScreen")
        navigationController?.pushViewController(vc!, animated: true)
    }

    
    //MARK:IBAction
    @IBAction func logInButtonClickd(_ sender: UIButton) {
        if let userName = txtEmail.text, let pass = txtPassword.text {
            if !userName.isEmpty && !pass.isEmpty {
                UserObject.authorize(with: userName, pass: pass) { [weak self] (user) in
                    if user != nil {
                        UserObject.cuurent = user
                        self?.goToHomeScreen()
                    } else {
                        print("Error while logging user")
                    }
                }
            }
        }
//    if  txtEmail.text == (UserDefaults.standard.object(forKey: "email") as? String) && (txtPassword.text == UserDefaults.standard.object(forKey: "password")as? String){
//        goToHomeScreen()
//    }else{
//        statusLbl.isHidden = false
//        statusLbl.text = "Password or UserName incorrect "
//        }
    }
    
    @IBAction func registerButtonClickd(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationScreen")
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    

}

