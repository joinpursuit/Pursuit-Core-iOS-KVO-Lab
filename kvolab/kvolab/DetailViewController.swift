//
//  DetailViewController.swift
//  kvolab
//
//  Created by Ahad Islam on 4/7/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let user: User
    
    private lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "insert number u want to add/withdraw"
        return tf
    }()
    
    private lazy var wButton: UIButton = {
        let b = UIButton()
        b.setTitle("withdraw", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        b.addTarget(self, action: #selector(wButtonPressed(_:)), for: .touchUpInside)
        return b
    }()
    
    private lazy var dButton: UIButton = {
        let d = UIButton()
        d.setTitle("deposit", for: .normal)
        d.setTitleColor(.blue, for: .normal)
        d.addTarget(self, action: #selector(dButtonPressed(_:)), for: .touchUpInside)
        return d
    }()
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @objc private func wButtonPressed(_ sender: UIButton) {
        guard let text = textField.text, let number = Double(text) else {return}
        user.balance -= number
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func dButtonPressed(_ sender: UIButton) {
        guard let text = textField.text, let number = Double(text) else { return }
        user.balance += number
        dismiss(animated: true, completion: nil)
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        setupTextField()
        setupWButton()
        setupDButton()
    }
    
    private func setupTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: view.frame.width / 2)])
    }
    
    private func setupWButton() {
        view.addSubview(wButton)
        wButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            wButton.leadingAnchor.constraint(equalTo: textField.leadingAnchor)])
    }
    
    private func setupDButton() {
        view.addSubview(dButton)
        dButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            dButton.trailingAnchor.constraint(equalTo: textField.trailingAnchor)])
    }
    
}
