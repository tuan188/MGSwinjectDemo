//
//  EntityMapper.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/25/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

class EntityMapper {
    class func map(from entity: ProductEntity, to product: Product) {
        product.id = entity.id ?? ""
        product.name = entity.name ?? ""
        product.price = entity.price
    }
    
    class func map(from product: Product, to entity: ProductEntity) {
        entity.id = product.id
        entity.name = product.name
        entity.price = product.price
    }
    
    class func product(from entity: ProductEntity) -> Product {
        let product = Product()
        map(from: entity, to: product)
        return product
    }
}
