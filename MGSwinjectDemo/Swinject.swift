//
//  Swinject.swift
//  MGSwinjectDemo
//
//  Created by Tuan Truong on 11/26/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit
import SwinjectStoryboard
import Swinject

extension SwinjectStoryboard
{
    class func setup ()
    {
        defaultContainer.register(ProductRepositoryProtocol.self) { _ in return ProductRepository() }
        
        defaultContainer.register(ProductServiceProtocol.self) { resolveable in
            return ProductService(productRepository: resolveable.resolve(ProductRepositoryProtocol.self)!)
        }
        
        defaultContainer.registerForStoryboard(ProductListViewController.self) {
            resolveable, viewController in
            viewController.productService = resolveable.resolve(ProductServiceProtocol.self)
        }
        
    }
}
