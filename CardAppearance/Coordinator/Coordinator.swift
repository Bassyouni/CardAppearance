//
//  Coordinator.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 8/27/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import Foundation

protocol Coordinator {
    var router: Router { get }
    
    func present(animated: Bool)
}
