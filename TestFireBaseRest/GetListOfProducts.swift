//
//  GetListOfProducts.swift
//  TestFireBaseRest
//
//  Created by Fernando on 24.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class GetListOfProducts: APIRequest {

    typealias Response = [String: Product?]
    
    var resourceName: String {
        return "/products"
    }
    
    //Parameters
    
    let orderBy: String?
    let limitToLast: Int?

    init(orderBy: String? = "date", limitToLast: Int? = 4) {
        self.orderBy = orderBy
        self.limitToLast = limitToLast
    }
    
}

