//
//  FileManagerClass.swift
//  PhoneBook3
//
//  Created by Vova on 8/29/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

final class FileManagerClass {
    
    private let fileManager = FileManager.default
    private let contacts = "Contacts"
    private let images = "Images"
    
    var filelist : [URL]? {
        get {
            guard let contactDirectory = contactDirectory else {
                return nil
            }
            let arrayOfUrl = try? fileManager.contentsOfDirectory(at: contactDirectory, includingPropertiesForKeys: nil, options: [])
            return arrayOfUrl
        }
    }
    private var documentDirectory : URL? {
        get {
            guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
                return nil
            }
            return documentDirectory
            }
        }
    private var contactDirectory : URL? {
        get {
            guard let documentDirectory = documentDirectory else {
                return nil
            }
            return documentDirectory.appendingPathComponent(contacts, isDirectory: true)
        }
    }
    
    private var imagesDirectory : URL? {
        get {
            guard let documentDirectory = documentDirectory else {
                return nil
            }
            return documentDirectory.appendingPathComponent(images, isDirectory: true)
        }
    }
        
    private var plistFile : URL? {
        get {
            guard let contactDirectory = contactDirectory else {
                return nil
            }
            return contactDirectory.appendingPathComponent("\(Date()).plist")
        }
    }
    
    private var imageFile : URL? {
        get {
            guard let imagesDirectory = imagesDirectory else {
                return nil
            }
            return imagesDirectory.appendingPathComponent("\(Date()).png")
        }
    }
    
    func createContactDirectory() throws {
        do {
            guard let contactDirectory = contactDirectory else { return }
            try fileManager.createDirectory(at: contactDirectory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            throw ErrorToThrow.failToCreate
        }
    }
    
    func createImagesDirectory() throws {
        do {
            guard let imagesDirectory = imagesDirectory else { return }
            try fileManager.createDirectory(at: imagesDirectory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            throw ErrorToThrow.failToCreate
        }
    }
    
    func removeFile(from : String) throws {
        do {
            try fileManager.removeItem(atPath: from)
        } catch {
            throw ErrorToThrow.failToDelete
        }
    }
    
    func readDataFromPlist(plist: URL) throws -> Contact {
        var readContact = Contact()
        do {
            let data = try Data(contentsOf: plist)
            let decoder = PropertyListDecoder()
            readContact = try decoder.decode(Contact.self, from: data)
        } catch {
            throw ErrorToThrow.failToReadFromPlist
        }
        return readContact
    }
    
    func writeDataToPlist(newContact: Contact) throws {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(newContact)
            if let plist = plistFile {
            try data.write(to: plist)
            }
        } catch {
            throw ErrorToThrow.failWriteToPlist
        }
    }
    
    func saveImageWith(fileName: UIImage) throws -> URL {
        guard let filePath = imageFile else {
            throw ErrorToThrow.failToGetData
        }
        
        if let data = UIImagePNGRepresentation(fileName) {
                try? data.write(to: filePath)
        }
        return filePath
    }
    
    func getPlistCount() -> Int {
        guard let filelist = filelist else {
            return 0
        }
     return filelist.count
    }
}
