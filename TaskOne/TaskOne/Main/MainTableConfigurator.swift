//
//  MainTableConfigurator.swift
//  TaskOne
//
//  Created by Artem Golovanev on 6/13/20.
//  Copyright © 2020 Artem Golovanev. All rights reserved.
//

import UIKit

final class MainTableConfigurator: MainTableConfiguratorInput {

    func configurateModule() -> UIViewController {
        let view = MainTableController()
        let interactor: MainTableInteractorInput = MainTableInteractor()
        let router: MainTableRouterInput = MainTableRouter()
        let presenter: MainTableViewOutput & MainTableInteractorOutput = MainTablePresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}
