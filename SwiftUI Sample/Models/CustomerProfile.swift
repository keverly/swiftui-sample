//
//  CustomerProfile.swift
//  SwiftUI Sample
//
//  Created by Kevin Everly on 3/20/26.
//

import Foundation

struct CustomerProfile {
    let id: String
    let name: String
    let email: String
    let avatarString: String
    let hasUpgraded: Bool
}

extension CustomerProfile {
    static var preview: CustomerProfile {
        CustomerProfile(
            id: UUID().uuidString,
            name: "Kevin",
            email: "keveverly@gmail.com",
            avatarString: "https://mycoolsite/avatars/1",
            hasUpgraded: true
        )
    }
}
