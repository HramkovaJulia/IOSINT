//
//  FeedViewController.swift
//  Navigation
//

import UIKit

protocol Check: AnyObject {
    func check(word: String) -> Bool
}

class FeedModel: Check {
    
    var secretWord = "Julia"
    
    func check(word: String) -> Bool {
        if word == secretWord {
            return true
        } else {
            return false
        }
    }
}

final class FeedViewController: UIViewController {
    
    var delegate: Check?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        createSubView()
        delegate = FeedModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label1.layer.cornerRadius = label1.frame.width / 2
    }
    
    var loginField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "Log In"
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.borderWidth = 0.25
        login.leftViewMode = .always
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.returnKeyType = .done
        login.backgroundColor = .white
        login.layer.cornerRadius = LayoutConstants.cornerRadius
        
        return login
    }()
    
    lazy var checkGuessButton = CustomButton(
        title: "Login",
        titleColor: .white,
        bgColor: .systemBlue,
        action: { [unowned self] in
            if let text = self.loginField.text {
                if self.delegate?.check(word: text) == true {
                    self.label1.text = "True"
                    self.label1.backgroundColor = .green
                    self.label1.isHidden = false
                } else {
                    self.label1.text = "False"
                    self.label1.backgroundColor = .red
                    self.label1.isHidden = false
                }
            }
        }
    )
    
    private func createCircularLabel(with text: String, backgroundColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = backgroundColor
        label.layer.cornerRadius = label.bounds.width / 2 // Округление формы
        label.clipsToBounds = true
        return label
    }
    
    private lazy var label1: UILabel = {
        let label = createCircularLabel(with: "False", backgroundColor: .red)
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        label.isHidden = true
        return label
    }()
    
    private func createSubView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(loginField)
        stackView.addArrangedSubview(checkGuessButton)
        stackView.addArrangedSubview(post1)
        stackView.addArrangedSubview(post2)
        view.addSubview(label1)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: -32),
            
            label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 146),
            label1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
    
    @objc func tapPostButton() {
        let post = postExamples[0]
        label1.isHidden = true
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    lazy var post1 = CustomButton(title: "Post number One", bgColor: .systemPurple) { [unowned self] in
        self.tapPostButton()
    }
    
    lazy var post2 =  CustomButton(title: "Post number Two", bgColor: .systemIndigo) { [unowned self] in
        self.tapPostButton()
    }
}

