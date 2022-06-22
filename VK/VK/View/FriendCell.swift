//
//  FriendCell.swift
//  VK
//
//  Created by Lera on 20.06.22.
//

import UIKit

class FriendCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}