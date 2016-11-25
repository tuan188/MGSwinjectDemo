//
//  ProductRepository.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/25/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit
import MagicalRecord

class ProductRepository: NSObject {
    func add(product: Product, completion: @escaping (_ success: Bool) -> Void) {
        MagicalRecord.save({ (context) in
            if let entity = ProductEntity.mr_createEntity(in: context) {
                EntityMapper.map(from: product, to: entity)
            }
            else {
                completion(false)
            }
        }, completion: { success, error in
            completion(success)
        })
    }
    
    func update(product: Product, completion: @escaping (_ success: Bool) -> Void) {
        MagicalRecord.save({ (context) in
            let predicate = NSPredicate(format: "id = \(product.id)")
            if let entity = ProductEntity.mr_findFirst(with: predicate, in: context) {
                EntityMapper.map(from: product, to: entity)
            }
            else {
                completion(false)
            }
        }, completion: { success, error in
            completion(success)
        })
    }
    
    func delete(withID id: String, completion: @escaping (_ success: Bool) -> Void) {
        MagicalRecord.save({ (context) in
            let predicate = NSPredicate(format: "id = \(id)")
            let success = ProductEntity.mr_deleteAll(matching: predicate)
            completion(success)
        }, completion: { success, error in
            completion(success)
        })
    }
    
    func getAll() -> [Product] {
        var products = [Product]()
        let context = NSManagedObjectContext.mr_()
        if let entities = ProductEntity.mr_findAll(in: context) as? [ProductEntity] {
            for entity in entities {
                let product = EntityMapper.product(from: entity)
                products.append(product)
            }
        }
        return products
    }
}
