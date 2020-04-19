//
//  BCHLaunchScreenView.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import UIKit

class BCHLaunchScreenView: UIView {
    // MARK: - Properties -
    
    // MARK: Private
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Blockchain POC"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializer and Lifecycle Methods -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private API -
    // MARK: Setup Methods
    
    private func setupSubviews() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            // titleLabel
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 24),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 24),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.yellow.cgColor,
                                UIColor.white.cgColor,
                                UIColor.cyan.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
