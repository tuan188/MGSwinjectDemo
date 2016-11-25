//
//  ProductService.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/25/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

class ProductService: NSObject {
    weak var delegate: ProductServiceDelegate?
    
    func add(product: Product) {
        
    }
    func update(product: Product) {
        
    }
    func delete(withID id: String) {
        
    }
    func getAll() -> [Product] {
        return []
    }
}
