//
//  CustomerDataSourceProvider.swift
//  SwiftUI Sample
//
//  Created by Kevin Everly on 3/20/26.
//

// Holds onto data sources for customer profiles who we've already loaded. This is essentially a simple caching mechanism.
protocol CustomerProfileDataSourceProvider {
    func get(for customerId: String) -> CustomerProfileDataSource
}

// MARK: Real

final class RealCustomerDataSourceProvider: CustomerProfileDataSourceProvider {
    private var dataSources: [String: RealCustomerProfileDataSource] = [:]
    
    func get(for customerId: String) -> CustomerProfileDataSource {
        if let existing = dataSources[customerId] {
            return existing
        } else {
            let new = RealCustomerProfileDataSource(customerId: customerId)
            
            dataSources[customerId] = new
            
            return new
        }
    }
}
