//
//  LoadingState.swift
//  SwiftUI Sample
//
//  Created by Kevin Everly on 3/20/26.
//

enum LoadingState<Value> {
    case loading
    case loaded(Value)
    case failed(Error)
}
