//
//  CameraScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 6/4/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit

class  PhotoIthem : UICollectionViewCell {
    
    @IBOutlet weak var filterImg: UIImageView!
    
}

class CameraScreen: UIViewController,UINavigationControllerDelegate ,UIImagePickerControllerDelegate{
    
    @IBOutlet weak var takeImg: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var imagePicker: UIImagePickerController!
    let filterNames = CIFilter.filterNames(inCategories: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        
    }
    
    func openCamera(){
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    func openGallary()
    {
        imagePicker!.allowsEditing = false
        imagePicker!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker!, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        takeImg.image = simpleBlurFilterExample(with: info[UIImagePickerControllerOriginalImage] as! UIImage)

    }
    
    
    @IBAction func tackePhotoButton(_ sender: UIButton) {
        openCamera()
    }
    
    @IBAction func gallaryButton(_ sender: Any) {
        openGallary()
    }
    
    func simpleBlurFilterExample(with image: UIImage) -> UIImage {
        // convert UIImage to CIImage
        let inputCIImage = CIImage(image: image)!
        
        // Create Blur CIFilter, and set the input image
        let blurFilter = CIFilter(name: "CIGaussianBlur")!
        blurFilter.setValue(inputCIImage, forKey: kCIInputImageKey)
        blurFilter.setValue(8, forKey: kCIInputRadiusKey)
        
        // Get the filtered output image and return it
        let outputImage = blurFilter.outputImage!
        return UIImage(ciImage: outputImage)
    }
}


extension CameraScreen : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoIthem", for: indexPath) as! PhotoIthem
        return cell
    }
    
}
