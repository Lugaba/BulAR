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
    var router: TableSearchRouter?
    var data = [Bula]()
    var filteredData = [Bula]()
    let searchController = UISearchController(searchResultsController: nil)
    
    init(router: TableSearchRouter? = nil, interactor: TableSearchInteractor? = nil) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")

        interactor?.getMedicineList()
        
        title = "Pesquisar bula"
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        
        let item = filteredData[indexPath.row]
        var content = cell.defaultContentConfiguration()
                
        if var firstImageURL = item.imagesURL.first {
            if let cachedImage = interactor?.imageCash.object(forKey: NSString(string: firstImageURL)) {
                content.image = cachedImage
            } else {
                interactor?.getMedicineImage(imageURL: firstImageURL, completion: { image in
                    content.image = image
                    cell.contentConfiguration = content
                })
            }
            cell.contentConfiguration = content

        }
        
        content.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        content.text = item.nome
        
        var caption = ""
        for index in 0..<item.categorias.count {
            caption += item.categorias[index].nome
            if index < item.categorias.count-1 {
                caption += " | "
            }
        }
        
        content.secondaryText = caption
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.goToMedicineDetails(bula: filteredData[indexPath.row])
    }
    
    func showMedicineList(list: [Bula]) {
        data = list
        filteredData = data
        DispatchQueue.main.sync {
            tableView.reloadData()
        }
    }
    
}


extension TableSearchViewControllerImpl: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        filteredData = searchText.isEmpty ? data : data.filter {
            bula in
            let hasName = bula.nome.lowercased().contains(searchText.lowercased())
            let hasCategory = bula.categorias.contains { categoria in
                categoria.nome.lowercased().contains(searchText.lowercased())
            }
            return hasName || hasCategory
        }
        tableView.reloadData()
    }
}
