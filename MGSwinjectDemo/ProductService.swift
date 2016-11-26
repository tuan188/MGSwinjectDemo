//
//  ProductService.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/25/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

class ProductService: ProductServiceProtocol {
    weak var delegate: ProductServiceDelegate?
    
    private var productRepository: ProductRepositoryProtocol
    
    init(productRepository: ProductRepositoryProtocol) {
        self.productRepository = productRepository
    }
    
    func add(product: Product) {
        productRepository.add(product: product, completion: { [weak self] success in
            self?.delegate?.addProductCompleted(product: product, success: success)
        })
    }
    
    func update(product: Product) {
        productRepository.update(product: product, completion: { [weak self] success in
            self?.delegate?.addProductCompleted(product: product, success: success)
        })
    }
    
    func delete(withID id: String) {
        productRepository.delete(withID: id, completion: { [weak self] success in
            self?.delegate?.deleteProductCompleted(productID: id, success: success)
        })
    }
    
    func getAll() -> [Product] {
        return productRepository.getAll()
    }
}
