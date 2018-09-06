//
//  ImagePickerClass.swift
//  PhoneBook3
//
//  Created by Vova on 8/30/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

class ImagePickerClass: UIViewController {
    
    private let imagePickerController = UIImagePickerController()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePickerController.delegate = self
    }
    
    func alertOptions() {
        let actionList = UIAlertController(title: "Choose photo", message: "use a photo library or make a new", preferredStyle: .actionSheet)
        
        let galleryAction = UIAlertAction(title: "Photo Library", style: .default) {
            _ in
            self.imagePickerController.sourceType = .photoLibrary
            self.presentPicker()
        }
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {
            _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePickerController.sourceType = .camera
                self.presentPicker()
            } else {
                print(ErrorToThrow.cameraNoAvailable)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        actionList.addAction(galleryAction)
        actionList.addAction(cameraAction)
        actionList.addAction(cancelAction)
        
        self.present(actionList, animated: true, completion: nil)
    }
    
    func presentPicker() {
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func selectedImage(choosen: UIImage) {
        
    }
}

extension ImagePickerClass : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK - UIImagePickerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let choosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        selectedImage(choosen: choosenImage)
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
