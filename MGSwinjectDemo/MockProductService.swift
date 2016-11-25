//
//  MockProductService.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/25/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

class MockProductService: ProductServiceProtocol {
    weak var delegate: ProductServiceDelegate?
    
    private static var products: [ String: Product] = {
        return [
            "ip7": Product(id: "ip7", name: "iPhone 7", price: 600),
            "ip7": Product(id: "ip7", name: "iPhone 7", price: 600)
        ]
    }()
    
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
