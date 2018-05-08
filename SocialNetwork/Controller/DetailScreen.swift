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
    @IBOutlet weak var contentView: UIView!
    fileprivate var dataSource = [UserObject]()
    var dataObject: UserObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewForDataUse()
    }
    
     func configureViewForDataUse () {
        imageView.image = dataObject?.profileImage

    }

//    func loadFirstData(){
//        for i in 0..<2 {
//            let object = UserObject(object: )
//            object.profileImage = UIImage(named: "test_\(Int(arc4random_uniform(2)))")
//            self.dataSource.append(object)
//        }
//    }
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
      //  loadFirstData()
        
     
        
    }
    @IBAction func backButtonClickd(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)    }
    
}
