//
//  CustomButton.swift
//  Navigation
//
//  Created by Julia on 05.07.2023.
//

import UIKit

open class CustomButton: UIButton {
    
    typealias Action = () -> Void
    var buttonAction: Action
    
    init(title: String, titleColor: UIColor = .white, bgColor: UIColor, action: @escaping Action) {
        buttonAction = action
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = bgColor
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = LayoutConstants.cornerRadius
        clipsToBounds = true
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        buttonAction()
    }
}
