//
//  ViewController.swift
//  TestFireBaseRest
//
//  Created by Fernando on 24.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    let APIAuthentication = FireBaseAPIAuthentication()
    
    var userResponse: UserLoggedIn?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//                APIClient.send(GetListOfProducts()) { (response) in
//
//                    switch response {
//                    case .success(let value):
//                        print(value)
//                    case .failure(let error):
//                        print(error)
//                    }
//                }
        
//        APIClient.submit(PostProduct(), object: Product(name: "Sofia", date: 1527168583)) { (error) in
//            if let error = error {
//                fatalError(error.localizedDescription)
//            }
//        }
        
//        APIAuthentication.signIn { (error) in
//            
//            if let error = error {
//                fatalError(error.localizedDescription)
//            }
//            
//        }
        
        APIAuthentication.signIn(PostSignInUser(), object: UserRequest(email: "b@abc.com", password: "123456", returnSecureToken: true)) { (response) in
            switch response {
            case .success(let value):
//                print(value)
                self.userResponse = value
                
                let actionViewController = ActionViewController()
                actionViewController.userLogged = value
                self.present(actionViewController, animated: true, completion: nil)
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

struct Product: Codable {
    let name: String?
    let date: Int?
}

protocol APIClient {
    func send <T: APIRequest>(_ request: T, idToken: String, completion: @escaping ResultCallback<T.Response>)
    func submit <T: APIRequest, M: Encodable>(_ request: T, object: M, idToken: String, completion: @escaping ResultCallback<T.Response>)
}

protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    var resourceName: String { get }
}

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

typealias ResultCallback<Value> = (Result<Value>) -> Void


