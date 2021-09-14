//
//  ServerAPIClientMock.swift
//  LebonbienTests
//
//  Created by nelson on 14/09/2021.
//

@testable import Lebonbien

public final class ServerAPIClientMock: ServerAPIClientInterface {

    let mockedItems = [Item(id: 1,
                            category_id: 1,
                            title: "moteur",
                            description: "ceci est un moteur électrique",
                            price: 99,
                            images_url: [:],
                            creation_date: "2019-11-05T15:53:55+0000",
                            is_urgent: false),
                       Item(id: 2,
                            category_id: 1,
                            title: "moteur 2",
                            description: "ceci est un moteur thermique",
                            price: 101,
                            images_url: [:],
                            creation_date: "2019-11-04T15:53:55+0000",
                            is_urgent: true),
                       Item(id: 3,
                            category_id: 2,
                            title: "vélo",
                            description: "ceci est un vélo",
                            price: 102,
                            images_url: [:],
                            creation_date: "2019-11-06T15:53:55+0000",
                            is_urgent: false)]

    let mockedCategories = [Category(id: 1, name: "Moteurs"),
                            Category(id: 2, name: "Vélos")]

    public func getItems(completion: @escaping (Result<[Item], Error>) -> Void) {
        completion(.success(mockedItems))
    }

    public func getCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        completion(.success(mockedCategories))
    }
}
