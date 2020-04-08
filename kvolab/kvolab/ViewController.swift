//
//  ViewController.swift
//  kvolab
//
//  Created by Ahad Islam on 4/7/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var moneyTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let name = nameTextField.text ?? "Jeffrey"
        let balance = Double(moneyTextField.text ?? "0.0") ?? 0.0
        
        let user = User(name: name, balance: balance)
        
        clearUI()
        UsersSingleton.ok.users.append(user)
    }
    
    private func clearUI() {
        nameTextField.text = ""
        moneyTextField.text = ""
    }
    

}

