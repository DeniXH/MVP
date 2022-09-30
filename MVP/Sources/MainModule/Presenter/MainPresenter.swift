//
//  MainPresenter.swift
//  MVP
//
//  Created by Денис Холодков on 27.09.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person) // идет захват view, посредством ссылки на протокол, что бы не завязывться на конкретной реализации
    // здесь делается инициализатор, что бы делать иньекцию зависимости (Dependency Injection)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol // делается так, что бы завязаться на абстракции
    let person: Person

    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }

    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting) // берется абстрактное view и говорит, покажи бизнес логику (т.е. вызывается метод)
    }
}
