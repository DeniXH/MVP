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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        presenter.setComment()
    }

// MARK: - Functions

    func setupHierarchy() {
        view.addSubview(commentLabel)
    }

    func setupLayout() {

        commentLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            commentLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            commentLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            commentLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - Extensions

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
