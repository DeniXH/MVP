//
//  Builder.swift
//  MVP
//
//  Created by Денис Холодков on 30.09.2022.
//

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}

class ModelBuilder: Builder {
    static func createMain() -> UIViewController {
       // let model = Person(firstName: "David", lastName: "Blane")
        let view = TableViewController()
        let networkService = NetworkService()
//        let presenter = MainPresenter(view: view, person: model) // здесь презентеру инжектим view и модель снаружи
        let presenter = NetworkPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }

    static func createDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}

// это называется Внедрение зависимостей, здесь они создаются, и далее внедряются (когда используются)
// еще Dependency Injection нужен для тестирования с помощью mock объекта
