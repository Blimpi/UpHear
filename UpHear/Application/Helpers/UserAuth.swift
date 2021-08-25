//
//  UserAuth.swift
//  UpHear
//
//  Created by Timothy Ananda on 24/08/21.
//

import Combine

class UserAuth: ObservableObject {

  let didChange = PassthroughSubject<UserAuth,Never>()

  // required to conform to protocol 'ObservableObject'
  let willChange = PassthroughSubject<UserAuth,Never>()

  func login() {
    // login request... on success:
    self.isLoggedin = true
  }

  var isLoggedin = false {
    didSet {
      didChange.send(self)
    }

    // willSet {
    //       willChange.send(self)
    // }
  }
}
