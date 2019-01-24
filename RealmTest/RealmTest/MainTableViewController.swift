//
//  ViewController.swift
//  RealmTest
//
//  Created by Vova on 1/23/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import UIKit
import RealmSwift

class MainTableViewController: UITableViewController {
    
    var cats: [Cat] = []
    var realm: Realm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRealmForMigrations()
        readFromRealm()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = cats[indexPath.row].name
        return cell ?? UITableViewCell()
    }

    @IBAction func addCatClicked(_ sender: Any) {
        let newCat = Cat()
        presentAlertWithTextField("New Cat", message: newCat.name ?? "Add new cat", acceptTitle: "Ok", declineTitle: "Cancel", inputPlaceholder: nil, okActionHandler: { (name) -> (Void) in
            newCat.name = name
            self.cats.append(newCat)
            self.writeToRealm(newCat: newCat)
            
        }, cancelActionHandler: nil)
    }
    
    // MARK: - Private
    
    private func writeToRealm(newCat: Cat) {
        try! realm?.write {
            realm?.add(newCat)
        }
        tableView.reloadData()
    }
    
    private func readFromRealm() {
        let result = realm?.objects(Cat.self)
        for cat in result! {
            cats.append(cat)
        }
    }
    
    private func setupRealmForMigrations() {
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
        })
        Realm.Configuration.defaultConfiguration = config
        //print(config.fileURL)
        realm = try! Realm()
    }
}
