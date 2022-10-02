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
    init(view: TableViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) // идет захват view, посредством ссылки на протокол, что бы не завязывться на конкретной реализации
    // здесь делается инициализатор, что бы делать иньекцию зависимости (Dependency Injection)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnTheComment(comment: Comment?) // метод нужен для того, что бы могли передать наш коммент из didSelectRow дальше
}

// MARK: - class

class NetworkPresenter: TableViewNetworkPresenterProtocol {
    weak var view: TableViewProtocol? // делается так, что бы завязаться на абстракции
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol
    var comments: [Comment]?

    required init(view: TableViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }

    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment) // в итоге при нажатии на comment произойдет переход в Роутер и далее в showDetail
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
