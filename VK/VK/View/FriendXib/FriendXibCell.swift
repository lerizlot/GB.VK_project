//
//  FriendXibCell.swift
//  VK
//
//  Created by Lera on 30.06.22.
//

import UIKit

class FriendXibCell: UITableViewCell {

    @IBOutlet weak var friendPhoto: UIImageView!
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
