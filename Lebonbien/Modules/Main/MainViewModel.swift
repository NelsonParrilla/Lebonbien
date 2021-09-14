//
//  MainViewModel.swift
//  lebonbien (iOS)
//
//  Created by nelson on 11/09/2021.
//

import Foundation

protocol MainViewModelInterface {

    /**
    *  Get Items list
    */
    func getItems()
}

class MainViewModel: MainViewModelInterface {

    let factory: MainFactoryInterface

    lazy var serverAPI: ServerAPIClient = factory.makeServerAPI()

    var items: [Item] = []

    var itemsRequestState: ((ItemsRequestState) -> Void)?

    init(factory: MainFactoryInterface) {
        self.factory = factory
        self.itemsRequestState?(.loading)
        getItems()
    }

    func getItems() {

        serverAPI.getItems() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.itemsRequestState?(.success(items: items))
                self.items = items
                break
            case .failure(let error):
                self.itemsRequestState?(.failure(error: error))
                break
            }
        }
    }
}

extension MainViewModel {

    enum ItemsRequestState {
        case loading, success(items: [Item]), failure(error: Error)
    }
}
