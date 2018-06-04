//
//  CameraScreen.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 6/4/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit

class CameraScreen: UIViewController, UINavigationControllerDelegate ,UIImagePickerControllerDelegate{
    
    @IBOutlet weak var takeImg: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        takeImg.image = info[UIImagePickerControllerOriginalImage] as? UIImage
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
    
    @IBAction func tackePhotoButton(_ sender: UIButton) {
        openCamera()
    }
    
    @IBAction func gallaryButton(_ sender: Any) {
        openGallary()
    }
}
