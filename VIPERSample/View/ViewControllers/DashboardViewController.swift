//
//  DashboardViewController.swift
//  VIPERSample
//
//  Created by Fumiaki Kobayashi on 2025/09/28.
//

import SwiftUI
import SwiftUIView
import UIKit

protocol DashboardViewInterface: AnyObject {}

class DashboardViewController: UIViewController, DashboardViewInterface {
    var presenter: DashboardPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDashboardView()
    }

    private func setupDashboardView() {
        let dashboardView = DashboardView()
        let hostingController = UIHostingController(rootView: dashboardView)

        addChild(hostingController)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
