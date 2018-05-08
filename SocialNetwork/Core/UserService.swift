//
//  UserService.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 5/7/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit
import Parse


extension UserObject {
    
    static func userTokenIsActive () -> Bool {
        return PFUser.current() != nil
    }
    
    static func register (with username: String, pass: String, email: String, completion: @escaping (Bool) -> () ) {
        let user = PFUser()
        user.username = username
        user.password = pass
        user.email = email
        
        user.signUpInBackground { (success, error) in
            if error != nil && success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    static func authorize (with username: String, pass: String, completion: @escaping (UserObject?) -> () ) {
        PFUser.logInWithUsername(inBackground: username, password: pass) { (user, error) in
            if error == nil && user != nil {
                let object = UserObject(object: user!)
                completion(object)
            } else {
                completion(nil)
            }
        }
    }
    
    static func logout () {
        PFUser.logOut()
}
    
}
