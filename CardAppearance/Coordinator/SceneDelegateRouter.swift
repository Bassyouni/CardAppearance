//
//  SceneDelegateRouter.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 8/27/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import UIKit

class SceneDelegateRouter: Router {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func present(_ viewController: UIViewController, animated: Bool) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
