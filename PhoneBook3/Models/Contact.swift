//
//  Contact.swift
//  PhoneBook3
//
//  Created by Vova on 8/29/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

final class Contact : Codable {
    var name : String
    var surname : String
    var imagePath : URL?
    
    init(name: String = "", surname: String = "") {
        self.name = name
        self.surname = surname
    }
}
