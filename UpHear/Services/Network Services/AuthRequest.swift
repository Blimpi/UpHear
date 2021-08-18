//
//  AuthRequest.swift
//  UpHear
//
//  Created by Timothy Ananda on 30/07/21.
//

import Foundation

class AuthRequest: NSObject {
    
    static func fetchUserData(url: String,
                          header: [String: String],
                          showLoader: Bool,
                          successCompletion: @escaping (UserData) -> Void,
                          failCompletion: @escaping (String) -> Void) {
        BaseRequest.GET(url: url, header: header, showLoader: showLoader) {
            response in
            
            var dataModel = DataManager.USERDATA
            
            do {
                let userModel = try JSONDecoder().decode(UserData.self, from: response as! Data)
                dataModel = userModel
                successCompletion(dataModel!)
            } catch let error {
                print("error reading json file: \(error.localizedDescription)")
            }
            
        }
    }
    
    static func addUser(url: String,
                        header: [String: String],
                        userItem: User,
                        showLoader: Bool,
                        successCompletion: @escaping (UserData) -> Void,
                        failCompletion: @escaping (String) -> Void) {
        
        let jsonString = """
            {"records":[{"fields": {"Email": "\(userItem.email ?? "")","Password": "\(userItem.password ?? "")","Name": "\(userItem.name ?? "")","Role": "\(userItem.role ?? userRole.user.rawValue)","Company": ["\(userItem.company?[0] ?? "")"],"Position": "\(userItem.position ?? "")","Division": "\(userItem.division ?? "")","agreedToS": "\(userItem.agreedToS ?? APIbool.f.rawValue)"}}]}
        """
        
        BaseRequest.POST(url: url, header: header, jsonString: jsonString, showLoader: showLoader) { response in
            
            var dataModel = DataManager.USERDATA
            
            do {
                let newUser = try JSONDecoder().decode(UserData.self, from: response as! Data)
                dataModel = newUser
                successCompletion(dataModel!)
            } catch let error {
                print("Error: \(error)")
            }
            
        } failCompletion: { message in
            print("Error: \(message)")
        }
    }
    
}
