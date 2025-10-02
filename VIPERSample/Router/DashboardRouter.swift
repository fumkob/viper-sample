//
//  DashboardRouter.swift
//  VIPERSample
//
//  Created by Fumiaki Kobayashi on 2025/09/29.
//

import UIKit

protocol DashboardWireframe: AnyObject {
    func assembleModule() -> UIViewController
}

class DashboardRouter: DashboardWireframe {
    weak var viewController: UIViewController?

    func assembleModule() -> UIViewController {
        let view = DashboardViewController()
        return view
    }
}
