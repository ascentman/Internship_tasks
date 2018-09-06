//
//  ErrorCodes.swift
//  PhoneBook3
//
//  Created by Vova on 8/29/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import Foundation

enum ErrorToThrow : Error {
    case failToCreate
    case failToDelete
    case failToReadFromPlist
    case failWriteToPlist
    case failToGetData
    case cameraNoAvailable
}
