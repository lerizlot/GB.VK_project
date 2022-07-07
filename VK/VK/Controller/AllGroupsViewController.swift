//
//  AllGroupsViewController.swift
//  VK
//
//  Created by Lera on 20.06.22.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
    var filteredGroups = [Group]()
    
    @IBOutlet weak var searchBarGroup: UISearchBar! {
        didSet {
            searchBarGroup.delegate = self
        }
    }
    
    @IBOutlet weak var customSearchBar: UITextField!
    
    // MARK: - GroupStorage
    
    let allGroups = [
        Group(name: "Nat Geo Wild", image: UIImage(named: "natGeoWild")),
        Group(name: "Science", image: UIImage(named: "science")),
        Group(name: "National Geographic", image: UIImage(named: "nationalGeographic")),
        Group(name: "Animal Planet", image: UIImage(named: "animalPlanet")),
        Group(name: "Discovery Knowledge", image: UIImage(named: "discoveryKnowledge")),
        Group(name: "Discovery Science", image: UIImage(named: "discoveryScience")),
        Group(name: "Investigation Discovery", image: UIImage(named: "investigationDiscovery")),
        Group(name: "Military History", image: UIImage(named: "militaryHistory")),
    ]
    
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
        
        tableView.register(UINib(nibName: GroupXibCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: GroupXibCell.reuseIdentifier)
        
        filteredGroups = allGroups
    }
}

// MARK: - Extensions

extension AllGroupsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupXibCell", for: indexPath) as? GroupXibCell else {
            
            preconditionFailure("Error")
        }
        
        cell.groupImage.image = filteredGroups[indexPath.row].image
        cell.groupName.text = filteredGroups[indexPath.row].name
        
        return cell
    }
}

extension AllGroupsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "addGroup", sender: nil)
    }
}

extension AllGroupsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print(searchText)
        
        if searchText.isEmpty {
            filteredGroups = allGroups
        } else {
            // перебираем названия наших групп и ищем если там есть буква из строки поиска
            filteredGroups = allGroups.filter {$0.name.contains(searchText)} //.description.lowercased()
        }
        // обязательно для обновления результата
        tableView.reloadData()
    }
}
