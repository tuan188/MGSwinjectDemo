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
    
    private static var productDictionary: [ String: Product] = {
        return [
            "ip": Product(id: "ip", name: "iPhone", price: 600),
            "mac": Product(id: "mac", name: "Macbook", price: 1500),
            "watch": Product(id: "watch", name: "Apple Watch", price: 400),
        ]
    }()
    
    func add(product: Product) {
        MockProductService.productDictionary[product.id] = product
        delegate?.addProductCompleted(product: product, success: true)
    }
    
    func update(product: Product) {
        MockProductService.productDictionary[product.id] = product
        delegate?.updateProductCompleted(product: product, success: true)
    }
    
    func delete(withID id: String) {
        MockProductService.productDictionary.removeValue(forKey: id)
        delegate?.deleteProductCompleted(productID: id, success: true)
    }
    
    func getAll() -> [Product] {
        var products = Array(MockProductService.productDictionary.values)
        products.sort { $0.id < $1.id }
        return products
    }
}
