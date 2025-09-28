//
//  RootRouter.swift
//  VIPERSample
//
//  Created by Fumiaki Kobayashi on 2025/09/28.
//

import UIKit

protocol RootWireframe: AnyObject {
    func presentRoot(in window: UIWindow)
}

class RootRouter: RootWireframe {
    func presentRoot(in window: UIWindow) {
        window.makeKeyAndVisible()
        let storyboard = StoryboardScene.Root.initialScene
        let view = storyboard.instantiate()
        let presenter = RootPresenter()

        view.presenter = presenter
        window.rootViewController = view
    }
}
