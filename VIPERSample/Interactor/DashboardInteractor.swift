//
//  DashboardInteractor.swift
//  VIPERSample
//
//  Created by Fumiaki Kobayashi on 2025/10/02.
//

import Foundation

protocol DashboardInteractorInput: AnyObject {}
protocol DashboardInteractorOutput: AnyObject {}

class DashboardInteractor: DashboardInteractorInput, DashboardInteractorOutput {
    weak var presenter: DashboardInteractorOutput?
}
