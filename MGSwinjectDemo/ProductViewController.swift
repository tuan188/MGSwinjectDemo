//
//  ProductViewController.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/25/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

protocol ProductViewControllerDelegate: class {
    func didSaveProduct(product: Product)
}

class ProductViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    weak var delegate: ProductViewControllerDelegate?
    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = product.name
        if product.price > 0 {
            priceTextField.text = String(product.price)
        }
        
        nameTextField.becomeFirstResponder()
    }

    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        guard let priceString = priceTextField.text else {
            return
        }
        product.name = name
        product.price = Double(priceString) ?? 0.0
        
        self.delegate?.didSaveProduct(product: product)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
