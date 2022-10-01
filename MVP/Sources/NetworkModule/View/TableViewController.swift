//
//  TableViewController.swift
//  MVP
//
//  Created by Денис Холодков on 30.09.2022.
//

import UIKit

class TableViewController: UIViewController {

// MARK: - Varibles

    var presenter: TableViewNetworkPresenterProtocol!

    private var names = ["John", "Dima", "Nikita", "Alexey", "Sonya", "Anna", "Elena", "Alexander", "Ivan", "Petr"]
    private var icons = ["pause", "pause", "pause", "pause", "pause", "pause", "pause", "pause", "pause", "pause"]


// MARK: - UI Elements
    private lazy var table: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()


// MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

func setupHierarchy() {
    view.addSubview(table)
}

func setupLayout() {
    table.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
        table.topAnchor.constraint(equalTo: view.topAnchor),
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //names.count
        presenter.comments?.count ?? 0 // ставим столько строк, сколько у нас лежит в комментах
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        cell.textLabel?.text = comment?.body //names[indexPath.row]
       // cell.imageView?.image = UIImage(systemName: icons[indexPath.row])
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //  метод с didSelect отрабатывает нажатие кнопки
        let comment = presenter.comments?[indexPath.row]
        let detailViewController = ModelBuilder.createDetailModule(comment: comment)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension TableViewController: TableViewProtocol {

    func success() {
        table.reloadData() // если все нормально пришло, то говорим таблице, что нужно обновиться
    }

    func failure(error: Error) {
        print(error.localizedDescription) // если пришла ошибка, то распечатываем ошибку
    }
}
