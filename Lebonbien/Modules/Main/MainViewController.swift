//
//  MainViewController.swift
//  lebonbien (iOS)
//
//  Created by nelson on 11/09/2021.
//

import UIKit

class MainViewController: UIViewController {

    let mainViewModel: MainViewModel?

    lazy var tableView = UITableView()

    var safeArea: UILayoutGuide!

    init(viewModel: MainViewModel)
    {
        self.mainViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.mainViewModel = nil
        super.init(coder: coder)
    }

    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        mainViewModel?.itemsRequestState = { [weak self] itemsRequestState in
            guard let self = self else { return }
            switch itemsRequestState {
            case .loading:
                break
            case .success:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                break
            case .failure(_):
                break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - Setup table view
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        tableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.mainViewModel?.categories.count ?? 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return self.mainViewModel?.categories[section].name
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let category = self.mainViewModel?.categories[section] else {
            return 0
        }
        return self.mainViewModel?.getItemsForCategory(category: category).count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell

        let category = self.mainViewModel?.categories[indexPath.section]
        cell.itemCellModel = self.mainViewModel?.getItemsForCategory(category: category!)[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}
