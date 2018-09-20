//
//  ViewController.swift
//  AutoLayout2
//
//  Created by Vova on 9/19/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

final class RootTableViewController: UITableViewController {

    private let data = RawData.getData()
    private var expandedCells: [IndexPath] = []
    
    // MARK: - TableView data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contentOfCell = data[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        cell.label.text = contentOfCell.components(separatedBy: " ").first
        cell.descriptionTextView.text = contentOfCell
        let imageFrame = UIBezierPath(rect: CGRect(x: 0, y: 0, width: cell.CellImageView.frame.width, height: cell.CellImageView.frame.height))
        cell.descriptionTextView.textContainer.exclusionPaths = [imageFrame]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if expandedCells.contains(indexPath) {
            expandedCells = expandedCells.filter { $0 != indexPath}
        } else {
            expandedCells.append(indexPath)
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        for index in expandedCells {
            if indexPath == index {
                return UITableViewAutomaticDimension
            }
        }
        // default cell height. 78 is equivalent for 3 lines of textView.
        return 78
    }
}
