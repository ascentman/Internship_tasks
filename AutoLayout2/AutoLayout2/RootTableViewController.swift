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
//        cell.layoutIfNeeded()
        cell.label.text = contentOfCell.components(separatedBy: " ").first
        cell.descriptionTextView.text = contentOfCell
        let imageFrame = UIBezierPath(rect: CGRect(x: 0, y: 0, width: cell.CellImageView.frame.width, height: cell.CellImageView.frame.height))
        cell.descriptionTextView.textContainer.exclusionPaths = [imageFrame]
        return cell
    }
}
