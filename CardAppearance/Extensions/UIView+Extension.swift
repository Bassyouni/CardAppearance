//
//  UIView+Extension.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 6/20/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

