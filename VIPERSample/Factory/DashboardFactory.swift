//
//  DashboardFactory.swift
//  VIPERSample
//
//  Created by Fumiaki Kobayashi on 2025/10/02.
//

import UIKit

// MARK: - Dependencies

protocol DashboardFactoryProtocol {
    func makeModule() -> UIViewController
}

class DashboardFactory: DashboardFactoryProtocol {
    init() {}

    func makeModule() -> UIViewController {
        let router = DashboardRouter()
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter()
        let view = DashboardViewController()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
