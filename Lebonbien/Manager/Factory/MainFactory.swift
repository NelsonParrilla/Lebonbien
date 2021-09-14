//
//  MainFactory.swift
//  lebonbien (iOS)
//
//  Created by nelson on 11/09/2021.
//

import Foundation

protocol MainFactoryInterface {

    /**
    * Make Server API
    * @return the Server API Client used to call web services for Main Module
    */
    func makeServerAPI() -> ServerAPIClient
}

final class MainFactory: MainFactoryInterface {

    let serverAPIClient: ServerAPIClient

    init(serverAPIClient: ServerAPIClient) {
        self.serverAPIClient = serverAPIClient
    }

    func makeServerAPI() -> ServerAPIClient {
        return serverAPIClient
    }
}

