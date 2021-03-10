//
//  Network.swift
//  RocketReserver
//
//  Created by Daniel Martinez Condinanza on 10/8/20.
//  Copyright © 2020 danielmartinezcg. All rights reserved.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()

//    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com")!)

    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/")!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                     endpointURL: url)
        return ApolloClient(networkTransport: transport, store: store)
    }()
}

//import Foundation
//import Apollo
//import ApolloWebSocket
//
//// MARK: - Singleton Wrapper
//
//class Apollo {
//  static let shared = Apollo()
//
//  /// A web socket transport to use for subscriptions
//  private lazy var webSocketTransport: WebSocketTransport = {
//    let url = URL(string: "ws://localhost:8080/websocket")!
//    let request = URLRequest(url: url)
//    return WebSocketTransport(request: request)
//  }()
//
//  /// An HTTP transport to use for queries and mutations
//  private lazy var normalTransport: RequestChainNetworkTransport = {
//    let url = URL(string: "http://localhost:8080/graphql")!
//    return RequestChainNetworkTransport(interceptorProvider: LegacyInterceptorProvider(), endpointURL: url)
//  }()
//
//  /// A split network transport to allow the use of both of the above
//  /// transports through a single `NetworkTransport` instance.
//  private lazy var splitNetworkTransport = SplitNetworkTransport(
//    uploadingNetworkTransport: self.normalTransport,
//    webSocketNetworkTransport: self.webSocketTransport
//  )
//
//  /// Create a client using the `SplitNetworkTransport`.
//  private(set) lazy var client = ApolloClient(networkTransport: self.splitNetworkTransport)
//}
