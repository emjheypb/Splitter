//
//  MasterViewController.swift
//  Splitter
//
//  Created by Mariah Baysic on 3/31/20.
//  Copyright © 2020 SpacedOut. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        changeCellHeight(tableView.frame.height)
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! ImagePresentationVC
                controller.image = imagesArray[indexPath.row]
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = namesArray[indexPath.row]
        cell.backgroundColor = colorsArray[indexPath.row]
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        changeCellHeight(size.height)
    }
    
    func changeCellHeight(_ height: CGFloat) {
        if let navBarHeight = navigationController?.navigationBar.frame.height {
            tableView.rowHeight = (height - navBarHeight) / CGFloat(imagesArray.count)
        } else {
            tableView.rowHeight = (height - 44) / CGFloat(imagesArray.count)
        }
    }
}

