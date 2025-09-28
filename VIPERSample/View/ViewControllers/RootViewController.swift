//
//  RootViewController.swift
//  VIPERSample
//
//  Created by Fumiaki Kobayashi on 2025/09/28.
//

import UIKit


class RootViewController: UIViewController {
    var presenter: RootModuleInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDashboard()
    }
}
