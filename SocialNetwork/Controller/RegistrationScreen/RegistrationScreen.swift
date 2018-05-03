//
//  RegistrationScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 4/16/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit

class RegistrationScreen: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //MARk:IBOutlet
    @IBOutlet weak fileprivate var textuserName: UITextField!
    @IBOutlet weak fileprivate var textPassword: UITextField!
    @IBOutlet weak fileprivate var textEmail: UITextField!
    @IBOutlet weak fileprivate var statusLbl: UILabel!
    @IBOutlet weak fileprivate var uploaImagedBtn: UIButton!
    @IBOutlet weak fileprivate var scrollView: UIScrollView!
    @IBOutlet weak fileprivate var contentView: UIView!
    @IBOutlet weak fileprivate var avatarImageView: UIImageView!
    
    var activeField: UITextField?
    var lastOffset: CGPoint!
    var keyboardHeight: CGFloat!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        statusLbl.isHidden = true
        avatarImageView.image = UIImage(named: "avatarHolder")
        textuserName.delegate = self
        textPassword.delegate = self
        textEmail.delegate = self
        
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
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
    func saveData(userName : String , password : String , email : String , avatar : UIImageView){
        let userName = textuserName.text
        let password = textPassword.text
        let email = textEmail.text
        let avatar = UIImageJPEGRepresentation (avatarImageView.image!, 0.8)
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(avatar, forKey: "avatar")
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            avatarImageView.contentMode = .scaleAspectFit
            avatarImageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:IBAction
    @IBAction func registerButtonClickd(_ sender: Any) {
        if ((textuserName.text?.count)! > 0 && (textPassword.text?.count)! > 0 &&  (textEmail.text?.count)! > 0 ){
            saveData(userName: textuserName.text!, password: textPassword.text!, email: textEmail.text!, avatar: avatarImageView)
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
    
    @IBAction func uploadButtonClickd(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
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
