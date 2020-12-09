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

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
    
    func activateAll() {
        [
            top,
            leading,
            bottom,
            trailing,
            width,
            height
        ]
        .forEach{ $0?.isActive = true }
    }
}

extension UIView {
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        anchoredConstraints.activateAll()
        return anchoredConstraints
    }
    
    @discardableResult
    func fillSuperview(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let superviewTopAnchor = superview?.topAnchor {
            anchoredConstraints.top = topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top)
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom)
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left)
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right)
        }
        
        anchoredConstraints.activateAll()
        return anchoredConstraints
    }
    
    func equalWidthAndHeight(to view: UIView, multiplier: CGFloat) {
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
    }
}
