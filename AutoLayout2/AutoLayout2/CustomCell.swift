//
//  CustomCell.swift
//  AutoLayout2
//
//  Created by Vova on 9/19/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

protocol CellDelegate: class {
    func contentDidChange(cell: CustomCell)
}

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    weak var delegate: CellDelegate?
    
    @IBAction func moreButtonClicked(_ sender: Any) {
        delegate?.contentDidChange(cell: self)
    }
}
