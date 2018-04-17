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
    //MARC:GOTOHomeScreen
    func goToHomeScreen(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeScreen")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    //MARK:IBAction
    @IBAction func logInButtonClickd(_ sender: UIButton) {
    if  txtUserName.text == (UserDefaults.standard.object(forKey: "userName") as? String) && (txtPassword.text == UserDefaults.standard.object(forKey: "password")as? String){
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
