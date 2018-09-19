//
//  ViewController.swift
//  AutoLayout2
//
//  Created by Vova on 9/19/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {

    let data = RawData.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    // MARK: - TableView data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contentOfCell = data[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        cell.label.text = contentOfCell
        cell.label.numberOfLines = 2
//        if contentOfCell.count > 200 {
//            cell.moreButton.isHidden = false
//        }
        cell.delegate = self
        return cell
    }
}

extension RootTableViewController: CellDelegate {
    func contentDidChange(cell: CustomCell) {
        cell.label.numberOfLines = 0
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}
