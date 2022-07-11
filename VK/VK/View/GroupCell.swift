//
//  GroupCell.swift
//  VK
//
//  Created by Lera on 20.06.22.
//

import UIKit

class GroupCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        groupImage.layer.cornerRadius = groupImage.bounds.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
