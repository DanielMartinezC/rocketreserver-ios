//
//  NetworkInterceptorProvider.swift
//  RocketReserver
//
//  Created by Daniel Martinez Condinanza on 11/4/20.
//  Copyright © 2020 danielmartinezcg. All rights reserved.
//

import Foundation
import Apollo

class NetworkInterceptorProvider: LegacyInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(TokenAddingInterceptor(), at: 0)
        return interceptors
    }
}
