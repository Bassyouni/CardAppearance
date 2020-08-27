//
//  RootCoordinator.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 8/27/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import RxSwift
import Foundation

final class RootCoordinator: Coordinator {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func present(animated: Bool) {
        let screenTypeVC = MagicScreenTypeViewController(delegate: self)
        router.present(screenTypeVC, animated: false)
    }
}

extension RootCoordinator: MagicScreenTypeViewControllerDelegate {
    func didChooseEmptyScreen() {
        router.present(getMagicVC(), animated: true)
    }
    
    func didChooseScreenWithCard() {
        
    }
    
    private func getMagicVC() -> MagicViewController {
        let secondsUseCase = CreateSecondsTimerUseCase(scheduler: MainScheduler.instance)
        let viewModel = MagicViewModel(secondsUseCase: secondsUseCase)
        return MagicViewController(viewModel: viewModel)
    }
}
