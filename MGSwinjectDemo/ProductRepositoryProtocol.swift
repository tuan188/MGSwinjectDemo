//
//  ProductRepositoryProtocol.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/26/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

protocol ProductRepositoryProtocol {
    func add(product: Product, completion: @escaping (_ success: Bool) -> Void)
    func update(product: Product, completion: @escaping (_ success: Bool) -> Void)
    func delete(withID id: String, completion: @escaping (_ success: Bool) -> Void)
    func getAll() -> [Product]
}
