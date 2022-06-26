//
//  FriendsController.swift
//  VK
//
//  Created by Lera on 26.06.22.
//

import UIKit

class FriendsController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
// MARK: - Table view data source extension

extension FriendsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            
            preconditionFailure("Error")
        }
        
        // Configure the cell...
        cell.friendName.text = friends[indexPath.row].name
        cell.friendImage.image = friends[indexPath.row].image
        
        return cell
    }
    
    
    
}

extension FriendsController: UITableViewDelegate {
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // добавить массив друзей и после этого настроить эту часть кода
        if segue.identifier == "showPhoto",
           let destinationVC = segue.destination as? PhotoViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            // передаем на контроллер ад
            destinationVC.photoAlbum = friends[indexPath.row].album
            let friendName = friends[indexPath.row].name
            
            destinationVC.title = friendName
        }
    }
    
}
