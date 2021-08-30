//
//  BaseRequest.swift
//  UpHear
//
//  Created by Timothy Ananda on 30/07/21.
//

import Foundation

class BaseRequest: NSObject {
    
    static func GET(url: String,
                    header: [String: String],
                    showLoader: Bool,
                    completionHandler: @escaping (Any) -> Void) {
        if showLoader {
            // load animation
        }
        
        //init request
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        //configure request method and set header
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header
        
        //init session
        let session = URLSession.shared
        
        //init datatask dengan
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                if let dataFromAPI = data {
                    completionHandler(dataFromAPI)
                }
            }
        })
        
        dataTask.resume()
        
    }
    
    static func POST(url: String,
                     header: [String: String],
                     jsonString: String,
                     showLoader: Bool,
                     successCompletion: @escaping (Any) -> Void,
                     failCompletion: @escaping (String) -> Void) {
        if showLoader {
            // load animation
        }
        
        //init request
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        let jsonSessionData = jsonString.data(using: .utf8)!
        print(jsonString)
        let jsonSession = try! JSONSerialization.jsonObject(with: jsonSessionData, options: .allowFragments)
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonSession)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = header
        request.httpBody = jsonData
        
        //init session
        let session = URLSession.shared
        
        //init datatask dengan
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
                failCompletion(error?.localizedDescription ?? "Connection to Server error")
            } else {
                if let dataFromAPI = data {
                    successCompletion(dataFromAPI)
                }
            }
        })
        
        dataTask.resume()
        
    }
    
}
