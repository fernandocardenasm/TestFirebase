//
//  FireBaseAPIClient.swift
//  TestFireBaseRest
//
//  Created by Fernando on 24.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

public class FireBaseAPIClient: APIClient {

    public let baseEndpoint = "https://testrest-489ba.firebaseio.com"
    private let session = URLSession(configuration: .default)
    
    func send<T: APIRequest>(_ request: T, idToken: String, completion: @escaping ResultCallback<T.Response>) {
        let endpoint = self.endpoint(for: request, idToken: idToken)
        
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    
                    let fireBaseResponse = try decoder.decode(T.Response.self, from: data)
                    completion(.success(fireBaseResponse))
                }
                catch {
                    completion(.failure(error))
                }
            }
            else if let error = error {
                completion(.failure(error))
            }
            
        }
        task.resume()
        
    }
    
    func submit<T: APIRequest, M: Encodable>(_ request: T, object: M, idToken: String, completion: ((Error?)->Void)?) {
        
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "testrest-489ba.firebaseio.com"
//        urlComponents.path = "/products.json?"
//        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        let endpoint = self.endpoint(for: request, idToken: idToken)
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = "POST"
        
        // Now let's encode out Post struct into JSON data...
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(object)
            // ... and set our request's HTTP body
            urlRequest.httpBody = jsonData
            print("jsonData: ", String(data: urlRequest.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            completion?(error)
        }
        
        let task = session.dataTask(with: urlRequest) { (responseData, response, responseError) in
            guard responseError == nil else {
                completion?(responseError!)
                return
            }
            // APIs usually respond with the data you just sent in your POST request
            if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
                print("response: ", utf8Representation)
            } else {
                print("no readable data received in response")
            }
        }
        task.resume()
        
    }
    
    func endpoint<T: APIRequest>(for request: T, idToken: String) -> URL {
        guard let parameters = try? URLQueryEncoder.encode(request) else { fatalError("Wrong parameters")}
        
        return URL(string: "\(baseEndpoint)\(request.resourceName).json?\(parameters)&auth=\(idToken)")!
    }
    
}
