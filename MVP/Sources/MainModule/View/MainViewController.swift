//
//  MainViewController.swift
//  MVP
//
//  Created by Денис Холодков on 27.09.2022.
//

import UIKit

class MainViewController: UIViewController {

// MARK: - Varibles

    var presenter: MainViewPresenterProtocol!


// MARK: - UI Elements

    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Label"
        label.backgroundColor = .blue
        label.sizeThatFits(CGSize(width: 400, height: 150))
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Кнопка", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

// MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
// MARK: - Button Action
    @objc func buttonPressed (_ sender: Any) {
        self.presenter.showGreeting()
    }

    func setupHierarchy() {
        view.addSubview(greetingLabel)
        view.addSubview(button)
    }

    func setupLayout() {

        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            button.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 30),
           button.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
    }
}

// MARK: - Extensions

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}

