//
//  viewcontrollerTableViewCell.swift
//  1search
//
//  Created by Mac on 19/09/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class viewcontrollerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var labelprize: UILabel!
    @IBOutlet weak var labelname: UILabel!
    
    @IBOutlet weak var nameimg: UIImageView!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
