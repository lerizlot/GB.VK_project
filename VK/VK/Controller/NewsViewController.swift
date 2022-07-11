//
//  NewsViewController.swift
//  VK
//
//  Created by Lera on 04.07.22.
//

import UIKit

class NewsViewController: UIViewController {
    
    var news = [News]()

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        news = NewsStorage().news
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: NewsXibCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: NewsXibCell.reuseIdentifier)
    }
    
}

extension NewsViewController: UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        600.0
//    }
//    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsXibCell.reuseIdentifier, for: indexPath) as? NewsXibCell else {
        return UITableViewCell()
    }
    let news = news[indexPath.row]
    cell.configure(news: news)
    return cell
    
    }
}

extension NewsViewController: UITableViewDelegate {
    
}
