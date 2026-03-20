//
//  CustomerDetailView.swift
//  SwiftUI Sample
//
//  Created by Kevin Everly on 3/20/26.
//

import Foundation
import SwiftUI

struct CustomerDetailView: View {
    @State private var viewModel: ViewModel
    
    init(customerProfileDataSource: CustomerProfileDataSource) {
        self.viewModel = ViewModel(customerProfileDataSource: customerProfileDataSource)
    }
    
    var body: some View {
        Group {
            switch viewModel.profile {
            case .loading:
                ProgressView()
            case .loaded(let value):
                VStack(alignment: .leading) {
                    Text(value.name)
                        .font(.headline)
                    Text(value.email)
                        .font(.subheadline)
                    Toggle("Upgrade", isOn: .constant(value.hasUpgraded))
                }
            case .failed(let error):
                Text(error.localizedDescription)
            }
        }
        .padding()
        .task {
            await viewModel.fetchCustomerData()
        }
    }
}

#Preview {
    CustomerDetailView(customerProfileDataSource: PreviewCustomerProfileDataSource())
}

// MARK: View Model

extension CustomerDetailView {
    @Observable
    @MainActor
    final class ViewModel {
        var profile: LoadingState<CustomerProfile> = .loading
        
        let customerProfileDataSource: CustomerProfileDataSource
        
        init(customerProfileDataSource: CustomerProfileDataSource) {
            self.customerProfileDataSource = customerProfileDataSource
        }
        
        func fetchCustomerData() async {
            do {
                let profile = try await customerProfileDataSource.fetch()
                
                self.profile = .loaded(profile)
                
                print(self.profile)
            } catch {
                profile = .failed(error)
            }
        }
    }
}
