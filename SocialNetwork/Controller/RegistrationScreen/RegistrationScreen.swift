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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var activeField: UITextField?
    var lastOffset: CGPoint!
    var keyboardHeight: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        statusLbl.isHidden = true
        
        textuserName.delegate = self
        textPassword.delegate = self
        
        // Observe keyboard change
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
       // Add touch gesture for contentView
        self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnTextView(gesture:))))
        
    }
    
    @objc func returnTextView(gesture: UIGestureRecognizer) {
        guard activeField != nil else {
            return
        }
        
        activeField?.resignFirstResponder()
        activeField = nil
    }
    
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
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
    
   
    @IBAction func signInButtonClickd(_ sender: UIButton) {
         self.navigationController?.popViewController(animated: true)
    }
}

// MARK: UITextFieldDelegate
extension RegistrationScreen: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        lastOffset = self.scrollView.contentOffset
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activeField?.resignFirstResponder()
        activeField = nil
        return true
    }
}

// MARK: Keyboard Handling
extension RegistrationScreen {
    @objc func keyboardWillShow(notification: NSNotification) {
        if keyboardHeight != nil {
            return
        }
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = keyboardSize.height
            
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height + keyboardSize.height)
            scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
        
    }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        keyboardHeight = nil
    }
}
