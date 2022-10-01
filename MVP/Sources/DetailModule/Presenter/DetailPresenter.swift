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
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?)
    func setComment() // протокол на выход
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol? // делается так, что бы завязаться на абстракции
    let networkService: NetworkServiceProtocol
    var comment: Comment?

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }

    func setComment() {
        self.view?.setComment(comment: comment)
    }
}
