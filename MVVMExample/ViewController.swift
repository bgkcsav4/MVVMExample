//
//  ViewController.swift
//  MVVMExample
//
//  Created by Mariam Latsabidze on 11.12.21.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {
    
    private var models = [Person]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: PersonFollowingTableViewCell.identifier, for: indexPath) as? PersonFollowingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: PersonFollowingTableViewCellModel(with: model))
        cell.delegate = self
        return cell
    }
    
    private func configureModelIs() {
        let names = [
            "Peter", "Joe", "Joseph", "Billie"
        ]
        for name in names {
            models.append(Person(name: name))
        }
    }

    private let tableview : UITableView = {
        let table = UITableView()
        table.register(PersonFollowingTableViewCell.self, forCellReuseIdentifier: PersonFollowingTableViewCell.identifier)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.frame = view.bounds
        configureModelIs()
    }

}

extension ViewController:PersonFollowingTableViewCellDelegate{
    func personFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellModel) {

    }
}
