//
//  HomeScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 4/16/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func galleryButtonClickd(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GallaryScreen")
        self.navigationController?.pushViewController(vc!, animated: true)
    
    }
    
}
