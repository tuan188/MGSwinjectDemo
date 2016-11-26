//
//  ProductListViewController.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/25/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

class ProductListViewController: UITableViewController {
    
    var productService: ProductServiceProtocol = ProductService()
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        productService.delegate = self
        
        getListProduct()
    }

    fileprivate func getListProduct() {
        products = productService.getAll()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)

        config(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    private func config(cell: UITableViewCell, indexPath: IndexPath) {
        let product = products[indexPath.row]
        switch cell {
        case let productCell as ProductCell:
            productCell.product = product
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        self.performSegue(withIdentifier: "presentProduct", sender: product)
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let product = products[indexPath.row]
            productService.delete(withID: product.id)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        switch identifier {
        case "presentProduct":
            if let productViewController = (segue.destination as? UINavigationController)?.topViewController as? ProductViewController {
                productViewController.delegate = self
                if let product = sender as? Product {
                    productViewController.product = product
                }
                else {
                    productViewController.product = Product()
                }
            }
        default:
            break
        }
    }
}

extension ProductListViewController: ProductServiceDelegate {
    func addProductCompleted(product: Product, success: Bool) {
        getListProduct()
    }
    
    func updateProductCompleted(product: Product, success: Bool) {
        getListProduct()
    }
    
    func deleteProductCompleted(productID: String, success: Bool) {
        if let index = products.index(where: { $0.id == productID }) {
            let indexPath = IndexPath(row: index, section: 0)
            products.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ProductListViewController: ProductViewControllerDelegate {
    func didSaveProduct(product: Product) {
        if product.id.isEmpty {
            product.id = NSUUID().uuidString
            productService.add(product: product)
        }
        else {
            productService.update(product: product)
        }
    }
}
