//
//  RootPresenter.swift
//  VIPERSample
//
//  Created by Fumiaki Kobayashi on 2025/09/28.
//

protocol RootModuleInterface: AnyObject {
    func showDashboard()
}

class RootPresenter: RootModuleInterface {
    func showDashboard() {
        print("Dashboard is shown")
    }
}
