//
//  DependencyContainer.swift
//  lebonbien (iOS)
//
//  Created by nelson on 11/09/2021.
//

import Foundation

final class DependencyContainer {

    private var hostURL: String {
        return "https://raw.githubusercontent.com/leboncoin/paperclip/master"
    }

    lazy var serverAPIClient = ServerAPIClient()

    func makeMainFactory() -> MainFactoryInterface {
        let factory = MainFactory(serverAPIClient: serverAPIClient)
        return factory
    }

}
