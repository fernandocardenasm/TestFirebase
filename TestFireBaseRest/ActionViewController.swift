//
//  ActionViewController.swift
//  TestFireBaseRest
//
//  Created by Fernando on 25.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation
import UIKit

class ActionViewController: UIViewController {
    
    let APIClient = FireBaseAPIClient()
    var userLogged: UserLoggedIn?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        print("Yes")
        
        //        APIClient.send(GetListOfProducts(), idToken: (userLogged?.idToken)!) { (response) in
        //
        //            switch response {
        //                case .success(let value):
        //                    print("yes")
        //                    print(value)
        //                case .failure(let error):
        //                    print(error)
        //            }
        //        }
        
        let object = Product(name: "PPPPP", date: 1527666700)
        
        APIClient.submit(PostProduct(), object: Product(name: object.name, date: object.date), idToken: (userLogged?.idToken)!) { (response) in
            
            switch response {
            case .success(let value):
//                print(value)
                
                print("Object Created")
 
                self.APIClient.update(PutUserProduct(userId: (self.userLogged?.localId)!, productId: value.name), object: object, idToken: (self.userLogged?.idToken)!) { (response) in
                    switch response {
                    case .success(let value):
//                        print(value)
                        print("Object added to product")
                        
                    case .failure(let error):
                        print(error)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
        
        
        
    }
    
}
