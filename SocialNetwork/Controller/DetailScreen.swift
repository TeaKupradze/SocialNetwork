//
//  DetailScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 5/4/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit
class DetailScreen: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var dataObject: UserObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewForDataUse()
    }
    
     func configureViewForDataUse () {
        imageView.image = dataObject?.profileImage

    }

    @IBAction func backButtonClickd(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)    }
    
}
