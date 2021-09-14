//
//  MainServerAPIClient.swift
//  lebonbien (iOS)
//
//  Created by nelson on 11/09/2021.
//

import Foundation

protocol ServerAPIClientInterface {

    func getItems(completion: @escaping (Result<[Item], Error>) -> Void)

    func getCategories(completion: @escaping (Result<[Category], Error>) -> Void)
}

public final class ServerAPIClient: ServerAPIClientInterface {

    let host = "https://raw.githubusercontent.com/leboncoin/paperclip/master"

    func getItems(completion: @escaping (Result<[Item], Error>) -> Void) {

        guard let url = URL(string: "\(host)/listing.json") else {
            print("Invalid URL!")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }

            do {
                let items = try! JSONDecoder().decode([Item].self, from: data!)
                completion(.success(items))
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }

    func getCategories(completion: @escaping (Result<[Category], Error>) -> Void) {

        guard let url = URL(string: "\(host)/categories.json") else {
            print("Invalid URL!")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }

            do {
                let categories = try! JSONDecoder().decode([Category].self, from: data!)
                completion(.success(categories))
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }

}
