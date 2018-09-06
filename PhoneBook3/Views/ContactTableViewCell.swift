//
//  ContactTableViewCell.swift
//  PhoneBook3
//
//  Created by Vova on 8/29/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

final class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var contactName: UILabel!
    @IBOutlet private weak var contactSurname: UILabel!
    @IBOutlet private weak var contactImageView: UIImageView!
    private let imageEmpty = "empty"
    
    func updateName(_ name: String?) {
        contactName.text = name
    }
    
    func updateSurname(_ surname: String?) {
        contactSurname.text = surname
    }
    
    func updateImageView(_ imagePath: String?) {
        if let imagePath = imagePath {
            contactImageView.image = UIImage(contentsOfFile: imagePath)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        contactName.text = nil
        contactSurname.text = nil
        contactImageView.image = UIImage(named: imageEmpty)
    }
}

extension UITableViewCell {
    
    // MARK: - UITableViewCell+Identifier
    
    class func identifier() -> String {
        return String(describing: self)
    }
    
    class func nib() -> UINib {
        return UINib.init(nibName: self.identifier(), bundle:nil)
    }
}

extension UITableViewCell {
    
    // MARK: - UITableViewCell
    
    func applyAppearence() {
        self.textLabel?.textColor = Theme.current.textColor
        self.detailTextLabel?.textColor = Theme.current.textColor
        self.backgroundColor = Theme.current.backgroundColor
    }
}
