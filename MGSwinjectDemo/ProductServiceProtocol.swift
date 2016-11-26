//
//  ProductServiceProtocol.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/25/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

protocol ProductServiceDelegate: class {
    func addProductCompleted(product: Product, success: Bool)
    func updateProductCompleted(product: Product, success: Bool)
    func deleteProductCompleted(productID: String, success: Bool)
}

extension ProductServiceDelegate {
    func addProductCompleted(product: Product, success: Bool) {}
    func updateProductCompleted(product: Product, success: Bool) {}
    func deleteProductCompleted(productID: String, success: Bool) {}
}

protocol ProductServiceProtocol {
    weak var delegate: ProductServiceDelegate? { get set }
    func add(product: Product)
    func update(product: Product)
    func delete(withID id: String)
    func getAll() -> [Product]
}
