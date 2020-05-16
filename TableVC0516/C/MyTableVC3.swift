//
//  MyTableVC3.swift
//  TableVC0516
//
//  Created by leslie on 5/16/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class MyTableVC3: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//MARK: - Search Controller
        let searchController = UISearchController(searchResultsController: nil)
        
        //Allocating self to be the Search Controller's delegate
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
//MARK: - Search Bar
        let searchBar = searchController.searchBar
        searchBar.delegate = self
        searchBar.placeholder = "Search Product"
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Names", "Calories"]
        searchBar.selectedScopeButtonIndex = 0
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData2.fileteredItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell2", for: indexPath)
        let data = AppData2.fileteredItems[indexPath.row]
        cell.textLabel?.text = data

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyTableVC3: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            let search = text.trimmingCharacters(in: .whitespaces)
            AppData2.filterData(search: search)
            tableView.reloadData()
        }
    }
}

extension MyTableVC3: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        AppData2.selectedButton = selectedScope
        
        if selectedScope == 0 {
            searchBar.placeholder = "Search Product"
        } else {
            searchBar.placeholder = "Maximum Calories"
        }
        
        searchBar.text = ""
        AppData2.filterData(search: "")
        tableView.reloadData()
    }
}
