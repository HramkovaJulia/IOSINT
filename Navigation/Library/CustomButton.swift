//
//  CustomButton.swift
//  Navigation
//
//  Created by Julia on 05.07.2023.
//

import UIKit

open class CustomButton: UIButton {
    
    var buttonTapped: (() -> Void)?
    var title: String?
    var backColor: UIColor?
    
    init(title: String? = nil, backColor: UIColor? = nil) {
        self.title = title
        self.backColor = backColor
        super.init(frame: .zero)
        
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setup() {
        if let title = title, let backColor = backColor {
            setTitle(title, for: .normal)
            backgroundColor = backColor
        }
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = LayoutConstants.cornerRadius
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }
    
    @objc public func buttonTap() {
        buttonTapped?()
    }
}
