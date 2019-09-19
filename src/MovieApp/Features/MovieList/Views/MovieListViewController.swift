//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Jaeseob Hwang on 17/09/2019.
//  Copyright © 2019 Jaeseob Hwang. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var viewModel: ListViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            fillUI()
        }
    }
    
    let labelView = UILabel()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any aditional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieItemTableViewCell.self, forCellReuseIdentifier: MovieItemTableViewCell.reusableIndentifer)
        
        fillUI()
        setupViews()
    }
    
    fileprivate func fillUI() {
        if !isViewLoaded {
            return
        }
        
        tableView.reloadData()
    }
    
    fileprivate func setupViews() {
        labelView.text = "This is movie list view controller"
        labelView.textAlignment = .center
        labelView.backgroundColor = .red
        addSubviews()
        constrainSubviews()
    }
    
    fileprivate func addSubviews() {
        view.addSubview(labelView)
        view.addSubview(tableView)
    }
    
    fileprivate func constrainSubviews() {
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        labelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        labelView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        labelView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: labelView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension MovieListViewController: ListViewModelViewDelegate {
    func itemsDidChange(viewModel: ListViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(viewModel?.itemAtIndex(indexPath.row) as Any)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.numberOfItems
        }
        
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieItemTableViewCell.reusableIndentifer, for: indexPath) as! MovieItemTableViewCell
        cell.item = viewModel?.itemAtIndex(indexPath.row)
        return cell
    }
}

class MovieItemTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    var item: DataItem? {
        didSet {
            if let item = item {
                titleLabel.text = item.title
            } else {
                titleLabel.text = "???"
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupViews() {
        titleLabel.backgroundColor = .blue
        addSubviews()
        constrainSubviews()
    }
    
    fileprivate func addSubviews() {
        addSubview(titleLabel)
    }
    
    fileprivate func constrainSubviews() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
}

extension MovieItemTableViewCell {
    class var reusableIndentifer: String { return String(describing: self) }
}
