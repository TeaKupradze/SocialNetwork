//
//  AuthorizeFacebook.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 6/4/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit
import Parse

class AuthorizeFacebook: NSObject {
    
func authorizeUserWithFacebook () {
            let permissions = [ "email","user_birthday", "public_profile", "user_friends"]
            PFFacebookUtils.logInInBackground(withReadPermissions: permissions) { (object, error) in
            
        }
}
}
