//
//  TableViewController.swift
//  simple-calc
//
//  Created by Xuan Liu on 16/11/1.
//  Copyright © 2016年 Xuan Liu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
        
    var history = [1,2,3]
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = String(history[indexPath.row])
        
        
        return cell
    }
}

