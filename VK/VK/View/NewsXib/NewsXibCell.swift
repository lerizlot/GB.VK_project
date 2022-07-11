//
//  NewsCell.swift
//  VK
//
//  Created by Lera on 04.07.22.
//

import UIKit

class NewsXibCell: UITableViewCell {
    
    static let reuseIdentifier = "NewsXibCell"
    
    
    // MARK: - Text
    @IBOutlet weak var newsAvatar: UIImageView!
    @IBOutlet weak var newsName: UILabel!
    @IBOutlet weak var newsPostDate: UILabel!
    @IBOutlet weak var newsText: UILabel! {
        didSet {
            newsText.lineBreakMode = .byWordWrapping
            newsText.numberOfLines = 0
        }
    }
    
    // MARK: - Images
    @IBOutlet weak var newsImage1: UIImageView!
//    @IBOutlet weak var newsImage2: UIImageView!
//    @IBOutlet weak var newsImage3: UIImageView!
//    @IBOutlet weak var newsImage4: UIImageView!
    
    // MARK: - Labels
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var replyLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Cell configuration

    func configure(news: News) {
        newsAvatar.image = news.avatar
        newsName.text = news.name
        newsPostDate.text = news.date
        newsText.text = news.text
        newsImage1.image = news.image1
//        newsImage2.image = news.image2
//        newsImage3.image = news.image3
//        newsImage4.image = news.image4
        
        likeLabel.text = String(news.likes)
        commentLabel.text = String(news.comments)
        replyLabel.text = String(news.replies)
        viewsLabel.text = String(news.views)
    }


}
