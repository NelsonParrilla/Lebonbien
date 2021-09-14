//
//  MainViewModel.swift
//  lebonbien (iOS)
//
//  Created by nelson on 11/09/2021.
//

import Foundation

protocol MainViewModelInterface {

    /**
     *  Get Items array for a specific category
     */
    func getItemsForCategory(category: Category) -> [ItemCellModel]
}

class MainViewModel: MainViewModelInterface {

    let serverAPI: ServerAPIClientInterface

    var items: [Item] = []

    var categories: [Category] = []

    var itemsRequestState: ((ItemsRequestState) -> Void)?

    init(serverAPI: ServerAPIClientInterface) {
        self.serverAPI = serverAPI
        self.itemsRequestState?(.loading)
        getItemsAndCategories()
    }

    private func getItemsAndCategories() {

        serverAPI.getItems() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):

                // Sort by date
                self.items = items.sorted {
                    $0.creation_date.toDate() > $1.creation_date.toDate()
                }

                // Sort by urgency
                self.items = self.items.sorted {
                    $0.is_urgent && !$1.is_urgent
                }

                self.serverAPI.getCategories() { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let categories):
                        self.categories = categories
                        self.itemsRequestState?(.success)

                    case .failure(let error):
                        self.itemsRequestState?(.failure(error: error))
                    }
                }

            case .failure(let error):
                self.itemsRequestState?(.failure(error: error))
            }
        }
    }

    func getItemsForCategory(category: Category) -> [ItemCellModel] {
        let itemsByCategory = items
            .filter({$0.category_id == category.id})
        let itemCellModels = itemsByCategory.map {
            ItemCellModel(title: $0.title,
                          price: "\($0.price) €",
                          image: $0.images_url.first?.value ?? "",
                          isUrgent: $0.is_urgent)
        }
        return itemCellModels
    }
}

extension MainViewModel {

    enum ItemsRequestState {
        case loading, success, failure(error: Error)
    }
}
