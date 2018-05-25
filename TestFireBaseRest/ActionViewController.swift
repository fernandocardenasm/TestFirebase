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
    var userLogged: UserResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        print("Yes")
        
        APIClient.send(GetListOfProducts(), idToken: (userLogged?.idToken)!) { (response) in

            switch response {
                case .success(let value):
                    print("yes")
                    print(value)
                case .failure(let error):
                    print(error)
            }
        }
        
//        APIClient.submit(PostProduct(), object: Product(name: "alo", date: 1527240950), idToken: (userLogged?.idToken)!) { (error) in
//            if let error = error {
//                fatalError(error.localizedDescription)
//            }
//        }
        
    }
    
}
