//
//  CustomerProfileDataSource.swift
//  SwiftUI Sample
//
//  Created by Kevin Everly on 3/20/26.
//

import Foundation

/// Source of truth for a customer's profile
protocol CustomerProfileDataSource {
    /// Fetches a customer's profile data
    func fetch() async throws -> CustomerProfile
}

/// Real Implementation of CustomerProfileDataSource.
/// Used to pull data from backend services.
final class RealCustomerProfileDataSource: CustomerProfileDataSource {
    let customerId: String
    
    // MARK: Initializers
    
    init(customerId: String) {
        self.customerId = customerId
    }
    
    // MARK: CustomerProfileDataSource
        
    func fetch() async throws -> CustomerProfile {
        
        // This is just an example of how we would pull data from a real endpoint.
        // For demonstration purposes, we're going to just hardcode a sleep and mock the response down below.
        /*
        let (data, response) = try await URLSession.shared.data(from: URL(string: "https://mycoolsite.com/api/userProfiles?id=\(id)")!)
        
        let customerProfile = try JSONDecoder().decode(Customer.self, from: data)
        
        return customerProfile
         */
        
        // Simulate a network request
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        return CustomerProfile.preview
    }
}


/// Preview Implementation of CustomerProfileDataSource
/// Used to display hardcoded data in SwiftUI Previews
final class PreviewCustomerProfileDataSource: CustomerProfileDataSource {
    func fetch() async throws -> CustomerProfile {
        .preview
    }
}
