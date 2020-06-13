//
//  BatteryView.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 5/15/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import UIKit

class BatteryView: UIView {
    
    private let batteryImageView = UIImageView(image: #imageLiteral(resourceName: "batteryIcon"))
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        addSubview(batteryImageView)
        batteryImageView.tintColor = .white
    }

    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        batteryImageView.translatesAutoresizingMaskIntoConstraints = false
        batteryImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        batteryImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        batteryImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        batteryImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    override func draw(_ rect: CGRect) {
        let height = rect.height
        let width = rect.width
        let fillFullPercentage: CGFloat = 0.75
        let rectWidthPercentage = max(0.0, CGFloat(UIDevice.current.batteryLevel)) * fillFullPercentage

        let drect = CGRect(x: (width * 0.1), y: (height * 0.25), width: (width * rectWidthPercentage), height: (height * 0.5))
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        UIColor.white.setFill()
        bpath.fill()
    }
}


