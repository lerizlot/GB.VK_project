//
//  AllGroupsViewController.swift
//  VK
//
//  Created by Lera on 20.06.22.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
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
        
        // Do any additional setup after loading the view.
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
// MARK: - Extensions

extension AllGroupsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as? GroupCell else {
            
            preconditionFailure("Error")
        }
        
        var content = cell.defaultContentConfiguration()
        content.text = allGroups[indexPath.row].name
        content.image = allGroups[indexPath.row].image
        
        content.imageProperties.maximumSize.height = 100
        content.imageProperties.maximumSize.width = 100
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

extension AllGroupsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата строка № \(indexPath.row) в секции \(indexPath.section)")
    }
}
