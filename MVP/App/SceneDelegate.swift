//
//  SceneDelegate.swift
//  MVP
//
//  Created by Денис Холодков on 27.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        let navigationBar = UINavigationController(rootViewController: ModelBuilder.createMain())
        window?.rootViewController = navigationBar
        window?.makeKeyAndVisible()
    }
}
