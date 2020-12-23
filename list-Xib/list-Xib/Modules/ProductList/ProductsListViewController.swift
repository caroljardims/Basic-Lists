//
//  ProductsListViewController.swift
//  table-Xib
//
//  Created by Ivo Dutra on 23/12/20.
//

import UIKit

class ProductsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var products: [Product] = []
    let identifier = "listCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List com Xib"
       
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let nib = UINib(nibName: "ProductsListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: identifier)

        // perform the request
        getProducts()
    }
    
    // MARK: - Get products
    
    // todo: deveria deixar com mesmo nome do service ou não?
    private func getProducts() {
        
        let service = ProductsService()
    
        service.getProducts { [weak self] (result) in
            guard let self = self else { return }
            // todo: activity indicator
            switch result {
            case .success(let products):
                self.products = products
                // todo: reload tada -> qual outra funcao?
                self.tableView.reloadData()
            case .failure:
                print("eerouuu")
            }
            print(self.products)
        }
    }

}

// MARK: - TableView

extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let productCell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                              for: indexPath) as? ProductsListCell else {
            return UITableViewCell()
        }
        
        productCell.setup(with: products[indexPath.row])

        return productCell
    }
    
}

