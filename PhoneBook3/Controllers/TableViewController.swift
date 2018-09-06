//
//  ViewController.swift
//  PhoneBook3
//
//  Created by Vova on 8/28/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {

    @IBOutlet weak var contactsTableView: UITableView!
    private let manager = FileManagerClass()
    private var contacts : [Contact] = []
    private let detailedSegue = "detailedSegue"
    private let settingsSegue = "settingsSegue"

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if manager.getPlistCount() != 0 {
            if let filelist = manager.filelist {
                for file in filelist {
                    let contact = try? manager.readDataFromPlist(plist: file)
                    if let contact = contact {
                        contacts.append(contact)
                    }
                }
            }
        }
        self.applyAppearence()
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == detailedSegue) {
            let index = tableView.indexPathForSelectedRow
            if let destination = segue.destination as? ContactViewController {
                if let index = index {
                    destination.newContact = contacts[index.row]
                    destination.currentState = .show
                }
                destination.delegate = self
            }
        } else if(segue.identifier == settingsSegue) {
            if let destination = segue.destination as? SettingsViewController {
                destination.delegate = self
            }
        }
    }
}

extension TableViewController: SendContactDelagate {
    
    // MARK: - SendContactDelagate
    
    func userDidEnterData(contact: Contact) {
        contacts.append(contact)
        contactsTableView.reloadData()
    }
}

extension TableViewController : ChangeThemeDelegate {
    
    // MARK: - ChangeThemeDelegate
    
    func update() {
        contactsTableView.reloadData()
    }
}

extension TableViewController {
    
    // MARK: - TableViewControllerDelegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier(), for: indexPath) as! ContactTableViewCell
        let contact = contacts[indexPath.row]
        cell.updateName(contact.name)
        cell.updateSurname(contact.surname)
        if let imagePath = contact.imagePath {
            cell.updateImageView(imagePath.path)
        }
        cell.applyAppearence()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contact = contacts[indexPath.row]
            if let imagePath = contact.imagePath {
                try? manager.removeFile(from: imagePath.path)
            }
            if let files = manager.filelist {
                try? manager.removeFile(from: files[indexPath.row].path)
            }
            contacts.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
