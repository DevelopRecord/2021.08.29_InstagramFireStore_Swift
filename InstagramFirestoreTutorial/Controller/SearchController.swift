//
//  SearchController.swift
//  InstagramFirestoreTutorial
//
//  Created by LeeJaeHyeok on 2021/08/29.
//

import UIKit

private let reuseIdentifier = "UserCell"

class SearchController: UITableViewController {
    
    // MARK: Lifecycle
    
    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        fetchUsers()
    }
    
    // MARK: API
    
    func fetchUsers() {
        UserService.fetchUsers { users in
            self.users = users
            self.tableView.reloadData() // 열의 카운트를 불러와야하기 때문에 reloadData가 필요함
        }
    }
    
    func configureTableView() {
        view.backgroundColor = .white
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 64
    }
}

// MARK: UITableViewDataSource

extension SearchController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        cell.user = users[indexPath.row]
        return cell
    }
}
