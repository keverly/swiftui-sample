//
//  Customer.swift
//  SwiftUI Sample
//
//  Created by Kevin Everly on 3/20/26.
//

import Foundation

struct Customer: Identifiable {
    let id: String
    let name: String
}

extension Customer {
    static var preview: Customer {
        Customer(id: UUID().uuidString, name: "Kevin")
    }
}
