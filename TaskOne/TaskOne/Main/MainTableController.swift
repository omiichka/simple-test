//
//  MainTableController.swift
//  TaskOne
//
//  Created by Artem Golovanev on 6/13/20.
//  Copyright © 2020 Artem Golovanev. All rights reserved.
//

import UIKit

final class MainTableController: UIViewController {
    
    var presenter: MainTableViewOutput?
    
    private var contenView = MainTableView()
    
    override func loadView() {
        view = contenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    func setup() {
        guard let delegate = presenter as? UITableViewDelegate, let dataSource = presenter as? UITableViewDataSource else { return }
        contenView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainCell")
        contenView.delegate = delegate
        contenView.dataSource = dataSource
    }
}

extension MainTableController: MainTableViewInput {
    
    func reloadTableView() {
        contenView.reloadData()
    }
    
    func showError(_ withText: String, _ andDescription: String?, withDelay: Double) {
        let alert = UIAlertController(title: withText, message: andDescription, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + withDelay) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
