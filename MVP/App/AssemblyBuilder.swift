//
//  Builder.swift
//  MVP
//
//  Created by Денис Холодков on 30.09.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController {
        let view = TableViewController()
        let networkService = NetworkService()
//        let presenter = MainPresenter(view: view, person: model) // здесь презентеру инжектим view и модель снаружи
        let presenter = NetworkPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }

    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
               let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
               view.presenter = presenter
               return view
    }
}

// это называется Внедрение зависимостей, здесь они создаются, и далее внедряются (когда используются)
// еще Dependency Injection нужен для тестирования с помощью mock объекта
