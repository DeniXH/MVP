//
//  DetailViewController.swift
//  MVP
//
//  Created by Денис Холодков on 01.10.2022.
//

import UIKit

class DetailViewController: UIViewController {

// MARK: - varibles
    var presenter: DetailViewPresenterProtocol!

// MARK: - UI Elements

    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Label"
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
//        label.sizeToFit()
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Кнопка", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        presenter.setComment()
    }

// MARK: - Functions

    func setupHierarchy() {
        view.addSubview(commentLabel)
        view.addSubview(button)
    }

    func setupLayout() {

        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            commentLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            commentLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            commentLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

   @objc func buttonPressed() {
       presenter.tap()
    }
}

// MARK: - Extensions

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
