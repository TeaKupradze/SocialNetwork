//
//  FriendsScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 5/4/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit

class FriendsIthems : UICollectionViewCell {
    
    @IBOutlet weak var avagtarImageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avagtarImageView.layer.cornerRadius = avagtarImageView.frame.size.height/2
        avagtarImageView.layer.masksToBounds = true
        avagtarImageView.layer.borderWidth = 1
        avagtarImageView.layer.borderColor = UIColor.white.cgColor
    }
}

class FriendsScreen: UIViewController {
    
@IBOutlet weak var collectionView: UICollectionView!
    
     fileprivate var dataSource = [UserObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
       // loadFirstData()

    }
    
//    func loadFirstData(){
//        for i in 0..<2 {
//            let object = UserObject()
//            object.profileImage = UIImage(named: "test_\(Int(arc4random_uniform(2)))")
//            self.dataSource.append(object)
//        }
//    }
    
@IBAction func backButtonClickd(_ sender: UIButton) {
        navigationController?.popViewController(animated:true)
    }
    
}

extension FriendsScreen : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ithem = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsIthems", for: indexPath) as! FriendsIthems
        
        ithem.avagtarImageView.image = UIImage(data: (UserDefaults.standard.object(forKey: "avatar") as? Data)!)
        ithem.userNameLbl.text = UserDefaults.standard.object(forKey: "userName") as? String
        return ithem
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailScreen") as! DetailScreen
        vc.dataObject = self.dataSource[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
