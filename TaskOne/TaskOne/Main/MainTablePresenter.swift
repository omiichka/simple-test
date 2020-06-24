//
//  MainTablePresenter.swift
//  TaskOne
//
//  Created by Artem Golovanev on 6/13/20.
//  Copyright © 2020 Artem Golovanev. All rights reserved.
//

import UIKit

final class MainTablePresenter: NSObject {
    
    private unowned let view: MainTableViewInput

    private let interactor: MainTableInteractorInput

    private let router: MainTableRouterInput

    private let identifier = "MainCell"
    
    private var imageArray = [UIImage]()
    
    init(view: MainTableViewInput, interactor: MainTableInteractorInput, router: MainTableRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MainTablePresenter: MainTableViewOutput {
   
    func viewDidLoad() {
        interactor.fetch(with: interactor.getURL(by: Array(1...100)))
    }
}

extension MainTablePresenter: MainTableInteractorOutput {
    
    func didRetrieveData(_ data: [Data]) {
        DispatchQueue.main.async {
            self.imageArray = data.compactMap { UIImage(data: $0)! }
            self.view.reloadTableView()
        }        
    }
    
    func callError(message: Error) {
        view.showError("Error", message.localizedDescription, withDelay: 0.5)
    }
}

extension MainTablePresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.setImage(image: imageArray[indexPath.row])
        return cell
        //        guard let img = imageArray.first(where: { $0.index == indexPath.row } )?.image else { return UITableViewCell() }
    }
}

extension MainTablePresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Cell selected at \(indexPath)")
    }
}
