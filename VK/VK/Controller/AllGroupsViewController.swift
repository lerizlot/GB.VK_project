//
//  AllGroupsViewController.swift
//  VK
//
//  Created by Lera on 20.06.22.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
    // MARK: - Database
    
    let groups = [
        Group(name: "Investigation Discovery", image: UIImage(named: "investigationDiscovery")),
        Group(name: "Military History", image: UIImage(named: "militaryHistory")),
        Group(name: "Nat Geo Wild", image: UIImage(named: "natGeoWild")),
        Group(name: "Science", image: UIImage(named: "science")),
        Group(name: "National Geographic", image: UIImage(named: "nationalGeographic")),
        Group(name: "Group Name", image: UIImage(systemName: "text.below.photo.fill")),
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
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroups", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = groups[indexPath.row].name
        content.image = groups[indexPath.row].image
        
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
