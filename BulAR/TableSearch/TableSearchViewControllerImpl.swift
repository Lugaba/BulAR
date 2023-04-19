//
//  TableSearchViewControllerImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

class TableSearchViewControllerImpl: UITableViewController, TableSearchViewController {
    var interactor: TableSearchInteractor?
    var data = ["Apple", "Banana", "Cherry", "Durian", "Elderberry", "Fig", "Grape", "Honeydew", "Jackfruit", "Kiwi"]
    var filteredData = [String]()
    let searchController = UISearchController(searchResultsController: nil)
    
    init(interactor: TableSearchInteractor? = nil) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pesquisar bula"
        filteredData = data
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquisar"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        
        var item = filteredData[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(named: "tylenol")
        content.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        content.text = item
        content.secondaryText = "Analgésico"
        
        cell.contentConfiguration = content
        
        return cell
    }
    
}


extension TableSearchViewControllerImpl: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        filteredData = searchText.isEmpty ? data : data.filter { $0.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
}
