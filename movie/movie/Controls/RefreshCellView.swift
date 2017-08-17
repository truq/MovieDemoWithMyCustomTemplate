//
//  RefreshCellView.swift
//  movie
//
//  Created by NGI-Noman on 17/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import UIKit

class RefreshCellView: UITableViewCell {
   
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var viewProgress: UIActivityIndicatorView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    
    func startStopLoading(_ isStart : Bool)
    {
        if(isStart)
        {   viewProgress.isHidden = false
            viewProgress.startAnimating()
            lblProgress.text = "Fetching Data"
        }
        else
        {   viewProgress.isHidden = true
            viewProgress.stopAnimating()
            lblProgress.text = "Pull for more data"
        }
    }
    
}
