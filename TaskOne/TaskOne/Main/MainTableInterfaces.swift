//
//  MainTableInterfaces.swift
//  TaskOne
//
//  Created by Artem Golovanev on 6/13/20.
//  Copyright © 2020 Artem Golovanev. All rights reserved.
//

import UIKit

//typealias CellData = (index: Int, data: Data)
//typealias CellError = (index: Int, message: String?)
//typealias CellImages = (index: Int, image: UIImage)

protocol MainTableViewInput: class {

    var presenter: MainTableViewOutput? { get set }
    
    func reloadTableView()
    func showError(_ withText: String, _ andDescription: String?, withDelay: Double)
}

protocol MainTableViewOutput: class {

    func viewDidLoad()
}

protocol MainTableInteractorInput: class {
    
    var presenter: MainTableInteractorOutput? { get set }
    
    func getURL(by indexes: [Int]) -> [URL]
    func fetch(with links: [URL])
}

protocol MainTableInteractorOutput: class {
    
    func didRetrieveData(_ data: [Data])
    func callError(message: Error)
}

protocol MainTableRouterInput: class {}

protocol MainTableConfiguratorInput: class {

     func configurateModule() -> UIViewController
}
