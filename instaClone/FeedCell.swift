//
//  FeedCell.swift
//  instaClone
//
//  Created by MaurZac on 26/06/20.
//  Copyright © 2020 MaurZac. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var usrEmailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var usrImgView: UIImageView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeBtnSelected(_ sender: UIButton) {
    }
    

}
