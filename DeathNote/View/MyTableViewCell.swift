//
//  MyTableViewCell.swift
//  d02
//
//  Created by Ruslan NAUMENKO on 1/17/19.
//  Copyright © 2019 Ruslan NAUMENKO. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var corpse : (String, String, String)! {
        didSet {
            if let f = corpse {
                nameLabel.text = f.0
                descriptionLabel.text = f.1
                dateLabel.text = f.2
            }
        }
    }
    
}
