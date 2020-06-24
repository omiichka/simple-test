//
//  MainTableInteractor.swift
//  TaskOne
//
//  Created by Artem Golovanev on 6/13/20.
//  Copyright © 2020 Artem Golovanev. All rights reserved.
//

import Foundation

final class MainTableInteractor {
    
    var presenter: MainTableInteractorOutput?
    
    private let pathString = "http://placehold.it/375x150?text="
    
    private var dataArray = [Data]()
    
    private func getData(url: URL, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let data = data else { return completion(nil, error) }
            completion(data, nil)
        }
        task.resume()
    }
}

extension MainTableInteractor: MainTableInteractorInput {
    
    func fetch(with links: [URL]) {
        DispatchQueue.global(qos: .userInteractive).async {
            links.forEach { value in
                self.getData(url: value) { (data, error) in
                    guard let data = data, error == nil else {
                        self.presenter?.callError(message: error!)
                        return
                    }
                    self.dataArray.append(data)
                    if self.dataArray.count == links.count {
                        self.presenter?.didRetrieveData(self.dataArray)
                    }
                }
            }
        }
    }
    
    func getURL(by indexes: [Int]) -> [URL] {
        return indexes.map { URL(string: pathString + String($0))! }
    }
}

