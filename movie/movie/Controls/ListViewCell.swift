//
//  ListViewCell.swift
//  movie
//
//  Created by NGI-Noman on 16/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    @IBOutlet weak var imgThumb: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    @IBOutlet weak var lblOverView: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
