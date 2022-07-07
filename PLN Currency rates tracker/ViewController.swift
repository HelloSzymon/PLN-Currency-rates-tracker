//
//  ViewController.swift
//  PLN Currency rates tracker
//
//  Created by Szymon Wnuk on 07/07/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PLNTableViewCell.self, forCellReuseIdentifier: PLNTableViewCell.identifier)
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PLN Currency Rates"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        fetchJson()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }

    // tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PLNTableViewCell.identifier, for: indexPath)
                as? PLNTableViewCell else {
            fatalError()
        }
        cell.textLabel?.text = "Currency"
        return cell
    }
    
}

