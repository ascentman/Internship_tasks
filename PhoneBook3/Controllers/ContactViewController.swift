//
//  ContactViewController.swift
//  PhoneBook3
//
//  Created by Vova on 8/29/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit


protocol SendContactDelagate {
    func userDidEnterData(contact: Contact)
}

enum ContactViewControllerStates {
    case add
    case show
}

final class ContactViewController: ImagePickerClass {

    @IBOutlet private weak var name: UITextField!
    @IBOutlet private weak var surname: UITextField!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var surnameLabel: UILabel!
    @IBOutlet private weak var saveButton: UIButton!
    
    var newContact = Contact()
    var delegate : SendContactDelagate?
    var currentState : ContactViewControllerStates = .add
    private let manager = FileManagerClass()
    private let pickImage = ImagePickerClass()
    private let emptyImage = "empty"
    private let viewControllerTitle = "Details"

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currentState == .show {
            showContactDetails()
        }
        nameLabel.text = newContact.name
        surnameLabel.text = newContact.surname
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        alertOptions()
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        guard let name = name.text,
            !name.isEmpty,
            let surname = surname.text,
            !surname.isEmpty else {
                presentAlert(withTitle: "Error", message: "Please enter name and surname")
                return
        }
        newContact.name = name
        newContact.surname = surname
        newContact.imagePath = try? manager.saveImageWith(fileName: imageView.image ?? UIImage(named: emptyImage)!)
        
        try? manager.writeDataToPlist(newContact: newContact)
        delegate?.userDidEnterData(contact: newContact)
        navigationController?.popViewController(animated: true)
    }
    
    override func selectedImage(choosen: UIImage) {
        imageView.image = choosen
    }
    
    private func showContactDetails() {
        self.title = viewControllerTitle
        saveButton.isHidden = true
        name.isHidden = true
        surname.isHidden = true
        imageView.isUserInteractionEnabled = false
        if let imagePath = newContact.imagePath {
            imageView.image = UIImage(contentsOfFile: (imagePath.path))
        }
    }
}

extension UIViewController {
    
    // MARK: - presentAlert
    
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
