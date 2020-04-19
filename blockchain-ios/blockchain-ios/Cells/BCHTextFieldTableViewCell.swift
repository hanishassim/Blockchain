//
//  BCHTextFieldTableViewCell.swift
//  blockchain-ios
//
//  Created by Hanis Hassim on 19/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import UIKit

let fontSize = UIFont.systemFont(ofSize: 16, weight: .regular)

class BCHTextFieldTableViewCell: UITableViewCell {
    
    // MARK: - Properties -
    
    // MARK: Internal
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = fontSize
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = fontSize
        textField.tintColor = .blue
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textField])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: Public
    
    var title: String! {
        didSet {
            titleLabel.text = title
        }
    }
    
    // MARK: - Initializer and Lifecycle Methods -
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupCell()
        setupListeners()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private API -
    
    private func setupCell() {
        backgroundColor = .white
        
        translatesAutoresizingMaskIntoConstraints = false
        selectionStyle = .none
        
        contentView.addSubview(containerStackView)
        
        let containerStackViewLeadingConstraint = containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32)
        let containerStackViewTopConstraint = containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor,  constant: 12)
        
        NSLayoutConstraint.activate([
            // containerStackView
            containerStackViewLeadingConstraint,
            containerStackViewTopConstraint,
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -containerStackViewLeadingConstraint.constant),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -containerStackViewTopConstraint.constant)
        ])
    }
    
    private func setupListeners() {
    }
}

extension BCHTextFieldTableViewCell: UITextFieldDelegate {
    
}
