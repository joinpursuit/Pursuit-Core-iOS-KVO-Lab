//
//  BalanceViewController.swift
//  kvolab
//
//  Created by Ahad Islam on 4/7/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var usersObserver: NSKeyValueObservation?
    var userObserver: NSKeyValueObservation?
    
    var users = UsersSingleton.ok.users {
        didSet {
            tableView.reloadData()
        }
    }
    
    deinit {
        usersObserver?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeUsers()
        
    }
    
    private func observeUsers() {
        usersObserver = UsersSingleton.ok.observe(\.users, options: [.old, .new], changeHandler: { (singleton, change) in
            guard let users = change.newValue else { return }
            print("OBSERVED THE USERSSS")
            self.users = users
        })
    }
    
}

extension BalanceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "balance cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = "Balance : \(users[indexPath.row].balance)"
        return cell
    }
    
    



}
