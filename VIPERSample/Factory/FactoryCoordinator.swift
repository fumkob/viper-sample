//
//  FactoryCoordinator.swift
//  VIPERSample
//
//  Created by Fumiaki Kobayashi on 2025/10/02.
//

import Foundation

protocol Coordinator: AnyObject {
    func factory<T>(for key: FactoryKey, builder: () -> T) -> T
}

enum FactoryKey: String {
    case dashboard
    // Add more factory keys here as needed
    // case settings
    // case profile
}

class FactoryCoordinator: Coordinator {
    private var factories: [FactoryKey: Any] = [:]

    init() {}

    /// Creates and caches factory instances on first access
    /// - Parameters:
    ///   - key: Type-safe identifier for the factory
    ///   - builder: Closure to create the factory if not cached
    /// - Returns: The factory instance (cached or newly created)
    func factory<T>(for key: FactoryKey, builder: () -> T) -> T {
        if let cached = factories[key] as? T {
            return cached
        }
        let factory = builder()
        factories[key] = factory
        return factory
    }

    // MARK: - Convenience accessors for type-safe factory access

    var dashboardFactory: DashboardFactoryProtocol {
        factory(for: .dashboard) { DashboardFactory() }
    }
}
