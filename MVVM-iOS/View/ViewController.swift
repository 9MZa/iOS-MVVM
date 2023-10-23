//
//  ViewController.swift
//  MVVM-iOS
//
//  Created by Bandit Silachai on 23/10/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var viewModel: UserViewModel!
    var nameLabel = UILabel()
    var emailLabel = UILabel()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRectMake(0 , 0, self.view.bounds.width, self.view.bounds.height)
        
        view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailView = DetailViewController()
        
        let detailViewModel = DetailViewModel(name: users[indexPath.row].name, email: users[indexPath.row].email, avatar: users[indexPath.row].avatar)
        
        detailView.viewModel = detailViewModel
        
        
        present(detailView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = HeaderTableView()
        headerView.headerLabel.text = "Users"
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        55
    }
}

