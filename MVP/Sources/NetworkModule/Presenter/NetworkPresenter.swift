//
//  NetworkPresenter.swift
//  MVP
//
//  Created by Денис Холодков on 01.10.2022.
//

import Foundation

// MARK: - protocols

protocol TableViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol TableViewNetworkPresenterProtocol: AnyObject {
    init(view: TableViewProtocol, networkService: NetworkServiceProtocol) // идет захват view, посредством ссылки на протокол, что бы не завязывться на конкретной реализации
    // здесь делается инициализатор, что бы делать иньекцию зависимости (Dependency Injection)
    func getComments()
    var comments: [Comment]? { get set }
}

// MARK: - class

class NetworkPresenter: TableViewNetworkPresenterProtocol {

    weak var view: TableViewProtocol? // делается так, что бы завязаться на абстракции
    let networkService: NetworkServiceProtocol
    var comments: [Comment]?

    required init(view: TableViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }

    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
