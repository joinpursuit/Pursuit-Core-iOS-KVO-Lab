//
//  Person.swift
//  kvolab
//
//  Created by Ahad Islam on 4/7/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation

@objc class User: NSObject {
    let name: String
    @objc dynamic var balance: Double
    
    init(name: String, balance: Double) {
        self.name = name
        self.balance = balance
    }
}

class UserObserver {
    var kvoToken: NSKeyValueObservation?
    
    func observe(user: User) {
        kvoToken = user.observe(\.balance, options: [.old, .new], changeHandler: { (user, change) in
            guard let balance = change.newValue else { return }
            
        })
    }
    
    deinit {
        kvoToken?.invalidate()
    }
}
