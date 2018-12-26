//
//  TableViewCell.swift
//  DeathNote
//
//  Created by Ruslan on 12/9/18.
//  Copyright © 2018 Ruslan Naumenko. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var generalView: UIView!
    
    var corpse : (String, String, String)? {
        
        didSet {
            generalView.layer.borderWidth = 1
            if let f = corpse {
                nameLabel?.text = f.0
                descLabel?.text = f.1
                dateLabel?.text = f.2
            }
        }
    }
    
}
