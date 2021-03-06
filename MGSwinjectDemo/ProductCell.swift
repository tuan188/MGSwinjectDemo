//
//  ProductCell.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/25/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    var product: Product? {
        didSet {
            guard let product = product else {
                return
            }
            self.textLabel?.text = product.name
            self.detailTextLabel?.text = "$\(product.price)"
        }
    }
}
