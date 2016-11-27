//
//  MGSwinjectDemoTests.swift
//  MGSwinjectDemoTests
//
//  Created by Tuan Truong on 11/27/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import XCTest
@testable import MGSwinjectDemo

class MGSwinjectDemoTests: XCTestCase {
    var viewController: ProductListViewController!
    
    class FakeProductService: ProductServiceProtocol {
        weak var delegate: ProductServiceDelegate?
        func add(product: Product) {}
        func update(product: Product) {}
        func delete(withID id: String) {}
        func getAll() -> [Product] { return [] }
    }
    
    override func setUp() {
        super.setUp()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductListViewController") as! ProductListViewController
        viewController.productService = FakeProductService()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
