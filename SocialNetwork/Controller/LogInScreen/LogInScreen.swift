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

//    func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.lightContent;
//    }
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // releasing the focus on the textField and hiding the keyboard
        txtEmail.resignFirstResponder()
       // self.tapOnSignIn()
        return true
    }
    
    
    //MARK:IBAction
    @IBAction func logInButtonClickd(_ sender: UIButton) {
    if  txtEmail.text == (UserDefaults.standard.object(forKey: "email") as? String) && (txtPassword.text == UserDefaults.standard.object(forKey: "password")as? String){
        goToHomeScreen()
    }else{
        statusLbl.isHidden = false
        statusLbl.text = "Password or UserName incorrect "
        }
    }
    
    @IBAction func registerButtonClickd(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationScreen")
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    

}

