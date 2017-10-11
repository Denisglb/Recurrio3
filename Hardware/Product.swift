//
//  product.swift
//  Hardware
//
//  Created by Will Porter on 11/10/2017.
//  Copyright © 2017 Hardware. All rights reserved.
//

//import Foundation
//
class Product {
    
    // MARK: - State variables
    let name, productDesc: String
    let initialWeight: Float
    var currentWeight: Float
    
    // MARK: - Initializer
    init(initialWeight: Float, name: String, productDesc: String) {
        self.initialWeight = initialWeight
        self.name = name
        self.currentWeight = initialWeight
        self.productDesc = productDesc
    }
    
}

// MARK: - Public Methods
extension Product {
    func updateWeight(weight: Float) {
        self.currentWeight = weight
    }
}
