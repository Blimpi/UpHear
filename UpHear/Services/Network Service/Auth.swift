//
//  Auth.swift
//  UpHear
//
//  Created by Timothy Ananda on 30/07/21.
//

import Foundation

class APIRequest: NSObject {
    
    static func fetchUsers(url: String,
                          header: [String: String],
                          showLoader: Bool,
                          successCompletion: @escaping ([User]) -> Void,
                          failCompletion: @escaping (String) -> Void) {
        BaseRequest.GET(url: url, header: header, showLoader: showLoader) {
            response in
            
            var dataModel = DataManager.USERS
            
            do {
//                let userModel = try JSONDecoder().decode(User.self, from: response as! Data)
//                dataModel = userModel
//                successCompletion(dataModel!)
            } catch let error {
                print("error reading json file: \(error.localizedDescription)")
            }
            
        }
    }
    
}
