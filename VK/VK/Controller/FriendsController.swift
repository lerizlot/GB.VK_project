//
//  FriendsController.swift
//  VK
//
//  Created by Lera on 26.06.22.
//

import UIKit

class FriendsController: UIViewController {
    
    var gradientView = GradientView()
    
    // создаем массив букв которые будут выводиться в боковом списке
    var firstLetters: [String] = []
    
    var sortedFriends = [Character: [User]]()
    
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
        
        self.sortedFriends = sort(friends: friends)
    }
    
    private func sort(friends: [User]) -> [Character: [User]] {
        var friendDict = [Character: [User]]()
        
        friends.forEach() { friend in
            
            guard let firstChar = friend.name.first else { return }
            if var thisCharFriends = friendDict[firstChar] {
                thisCharFriends.append(friend)
                friendDict[firstChar] = thisCharFriends
            } else {
                friendDict[firstChar] = [friend]
            }
        }
        return friendDict
    }
}

// MARK: - Table view data source extension

extension FriendsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriends.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keySorted = sortedFriends.keys.sorted()
        let friends = sortedFriends[keySorted[section]]?.count ?? 0
        
        return friends
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            
            preconditionFailure("Error")
        }
        
        let firstChar = sortedFriends.keys.sorted()[indexPath.section]
        let friends = sortedFriends[firstChar]!
        let friend: User = friends[indexPath.row]
        
        cell.friendImage.image = friend.image
        cell.friendName.text = friend.name
        
//        // Configure the cell...
//        cell.friendName.text = friends[indexPath.row].name
//        cell.friendImage.image = friends[indexPath.row].image
        
        return cell
    }
    
    // MARK: - Header
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedFriends.keys.sorted()[section])
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.lightGray
    }
}

extension FriendsController: UITableViewDelegate {
    
        func sectionIndexTitles(for tableView: UITableView) -> [String]? {
            return firstLetters
        }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // добавить массив друзей и после этого настроить эту часть кода
        if segue.identifier == "showPhoto",
        let destinationVC = segue.destination as? PhotoViewController,
            let indexPath = tableView.indexPathForSelectedRow {
                let firstChar = sortedFriends.keys.sorted()[indexPath.section]
                let friends = sortedFriends[firstChar]!
                let friend: User = friends[indexPath.row]
                
                // передаем на контроллер
                destinationVC.photoAlbum = friend.album
                let friendName = friend.name
                destinationVC.title = friendName
            }
        
        
    }
    
}
