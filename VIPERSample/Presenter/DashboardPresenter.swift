//
//  DashboardPresenter.swift
//  VIPERSample
//
//  Created by Fumiaki Kobayashi on 2025/10/02.
//

import Foundation

protocol DashboardPresentation: AnyObject {}

class DashboardPresenter: DashboardPresentation, DashboardInteractorOutput {
    var router: DashboardWireframe!
    var interactor: DashboardInteractorInput!
    weak var view: DashboardViewInterface?
}
