//
//  Router.swift
//  MVP
//
//  Created by Денис Холодков on 02.10.2022.
//

import UIKit

protocol RouterMain: AnyObject { // протокол для Builder
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain { // можно наследоваться от другого протокола, и тогда при его реализации нужно будет реализовывать 2 протокола (дочерний и родительский)
    func initialViewController()
    func showDetail(comment: Comment?)
    func popToRoot() // метод, который возвращает на рутовый контроллер
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?

    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMain(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }

    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(comment: comment, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
