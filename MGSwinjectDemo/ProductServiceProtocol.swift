//
//  ProductServiceProtocol.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/25/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

protocol ProductServiceDelegate: class {
    func addProductSuccess(product: Product)
    func addProductFailed(product: Product)
    func updateProductSuccess(product: Product)
    func updateProductFailed(product: Product)
    func deleteProductSuccess(product: Product)
    func deleteProductFailed(product: Product)
}

extension ProductServiceDelegate {
    func addProductSuccess(product: Product) {}
    func addProductFailed(product: Product) {}
    func updateProductSuccess(product: Product) {}
    func updateProductFailed(product: Product) {}
    func deleteProductSuccess(product: Product) {}
    func deleteProductFailed(product: Product) {}
}

protocol ProductServiceProtocol {
    weak var delegate: ProductServiceDelegate? { get set }
    func add(product: Product)
    func update(product: Product)
    func delete(withID id: String)
    func getAll() -> [Product]
}
