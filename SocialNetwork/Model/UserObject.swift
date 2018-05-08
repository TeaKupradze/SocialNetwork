
//  UserObject.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 5/1/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.


import UIKit
import Parse

enum Gender: Int {
    case Female = 0
    case Male
}


class UserObject {
    
    var userName: String!
    var profileImage : UIImage!
    var email: String!
    var password: String!
    var age: Int?
    var biography: String?
    var dateOfBirth: String?
    var gender: Gender?
    
    static var cuurent : UserObject?
    
    init(object:PFUser) {
        self.userName = object.username
        self.password = object.password
        self.email = object.email
        
        if let userInfo = object["userInfo"] as? [String: Any] {
            self.age = userInfo["age"] as? Int
            self.biography = userInfo["biography"] as? String
            self.dateOfBirth = userInfo["dob"] as? String
            self.gender = (userInfo["gender"] as? String) == "Female" ? .Female : .Male
        }

        
    }

}
