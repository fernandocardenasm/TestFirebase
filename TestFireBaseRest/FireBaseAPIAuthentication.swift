//
//  FireBaseAPIAuthentication.swift
//  TestFireBaseRest
//
//  Created by Fernando on 24.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

public class FireBaseAPIAuthentication {
    
    public let baseEndpoint = "https://www.googleapis.com/identitytoolkit/v3/relyingparty"
    
    let key = "AIzaSyDUikkW4eertVjSEKha66A5w7sHsOsJX5o"
    
    private let session = URLSession(configuration: .default)
    
    func signIn<T: APIRequest, M: Codable>(_ request: T, object: M, completion: @escaping ResultCallback<T.Response>) {
        
        let endpoint = self.endpoint(for: request)
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = "POST"
        
        var headers = urlRequest.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        urlRequest.allHTTPHeaderFields = headers
        
        // Now let's encode out Post struct into JSON data...
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(object)
            // ... and set our request's HTTP body
            urlRequest.httpBody = jsonData
//            print("jsonData: ", String(data: urlRequest.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
             completion(.failure(error))
        }
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            // APIs usually respond with the data you just sent in your POST request
            if let data = data, let utf8Representation = String(data: data, encoding: .utf8) {
//                print("response: ", utf8Representation)
                do {
                    let decoder = JSONDecoder()
                    
                    let fireBaseResponse = try decoder.decode(T.Response.self, from: data)
                    completion(.success(fireBaseResponse))

                }
                catch{
                    completion(.failure(error))
                }
                
                
            } else if let error = error{
                completion(.failure(error))
            }

        }
        task.resume()
        
    }
    
    func endpoint<T: APIRequest>(for request: T) -> URL {
        return URL(string: "\(baseEndpoint)\(request.resourceName)?key=\(key)")!
    }
    
}
