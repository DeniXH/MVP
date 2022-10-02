//
//  DetailPresenter.swift
//  MVP
//
//  Created by Денис Холодков on 01.10.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?) // протокол на вход
}

// если в протоколе написать init метод, то в реализующем этот класс этот init станет required
protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment() // протокол на выход
    func tap() // для выполнения возврата Юзера обратно
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol? // делается так, что бы завязаться на абстракции
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol
    var comment: Comment?

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }

    func tap() {
        router?.popToRoot()
    }

    func setComment() {
        self.view?.setComment(comment: comment)
    }
}
