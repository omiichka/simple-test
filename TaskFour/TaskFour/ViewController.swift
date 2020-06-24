//
//  ViewController.swift
//  TaskFour
//
//  Created by Artem Golovanev on 6/17/20.
//  Copyright © 2020 Artem Golovanev. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private let field = UITextField()
    
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
}

private extension ViewController {
    
    func setup() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.addTarget(self, action: #selector(didHandleButton(_:)), for: .touchUpInside)

        field.placeholder = "Write something"
        field.borderStyle = .roundedRect
        field.clearButtonMode = .always
        field.contentMode = .scaleAspectFit
        
        button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        button.setTitle("Check", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.contentMode = .scaleAspectFit
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.layer.cornerRadius = 45 / 2
        button.showsTouchWhenHighlighted = true
        
        [field, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            field.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            field.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            field.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            field.heightAnchor.constraint(equalToConstant: 45),
            
            button.centerYAnchor.constraint(equalTo: field.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: field.trailingAnchor, constant: 15),
            button.heightAnchor.constraint(equalToConstant: 45),
            button.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc func didHandleButton(_ sender: UIButton) {
         guard let text = field.text else {
            print("Field content empty")
            return
        }
        let isValidLogin = LoginContent(with: text).isValid
        let statusString = isValidLogin ? " successful" : "failed"
        print("Login verification \(statusString)")
    }
}
