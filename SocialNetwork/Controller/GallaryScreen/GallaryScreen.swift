//
//  GallaryScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 4/20/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit
//MARK: GallaryCell
class GallaryCell: UITableViewCell {
    
    //MARK:IBOutlet
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var countPhotoLbl: UILabel!
    
}

    //MARK:GallaryScreen
class GallaryScreen: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    //MAR: IBAction
    @IBAction func menuButtonClickd(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK:UITableViewDelegate,UITableViewDataSource
extension GallaryScreen : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GallaryCell", for: indexPath) as! GallaryCell
        
        cell.backgroundImageView.image = UIImage(named: "bgGallaryIMG")
        cell.nameLbl.text = "KIDS"
        cell.countPhotoLbl.text = "10PHoto"
        
        return cell
        
    }
}
