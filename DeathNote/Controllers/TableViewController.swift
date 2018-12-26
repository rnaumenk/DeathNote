//
//  TableViewController.swift
//  DeathNote
//
//  Created by Ruslan on 12/9/18.
//  Copyright © 2018 Ruslan Naumenko. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let cellSpacingHeight: CGFloat = 5
    
    override func viewDidLoad() {
        self.tableView.estimatedRowHeight = 40
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.corpses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeathNoteCell") as! TableViewCell
        cell.corpse = Data.corpses[indexPath.row]
        return cell
    }
    
}
