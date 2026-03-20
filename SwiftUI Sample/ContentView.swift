//
//  ContentView.swift
//  SwiftUI Sample
//
//  Created by Kevin Everly on 3/20/26.
//

import SwiftUI

struct ContentView: View {
    let customers: [Customer] = [.preview, .preview, .preview]
    
    let customerProfileDataSourceProvider: CustomerProfileDataSourceProvider = RealCustomerDataSourceProvider()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(customers) { customer in
                    NavigationLink(customer.name) {
                        CustomerDetailView(customerProfileDataSource: customerProfileDataSourceProvider.get(for: customer.id))
                            .environment(CustomerDetailView.ViewModel(customerProfileDataSource: customerProfileDataSourceProvider.get(for: customer.id)))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
