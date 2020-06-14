//
//  SceneDelegate.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 5/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import RxSwift
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let secondsUseCase = CreateSecondsTimerUseCase(scheduler: MainScheduler.instance)
        let magicViewModel = MagicViewModel(secondsUseCase: secondsUseCase)
        window?.rootViewController = MagicViewController(viewModel: magicViewModel)
        window?.makeKeyAndVisible()
    }
}

