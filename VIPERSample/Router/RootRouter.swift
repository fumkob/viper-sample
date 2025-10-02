//
//  RootRouter.swift
//  VIPERSample
//
//  Created by Fumiaki Kobayashi on 2025/09/28.
//

import UIKit

protocol RootWireframe: AnyObject {
    func presentRoot(in window: UIWindow, coordinator: FactoryCoordinator)
}

class RootRouter: RootWireframe {
    private var window: UIWindow?

    func presentRoot(in window: UIWindow, coordinator: FactoryCoordinator) {
        let view = coordinator.dashboardFactory.makeModule()
        window.rootViewController = view
        window.makeKeyAndVisible()

        self.window = window
    }
}
