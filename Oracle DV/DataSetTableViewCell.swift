//
//  DataSetTableViewCell.swift
//  Oracle DV
//
//  Created by Alex Acosta on 8/22/19.
//  Copyright © 2019 Alex Acosta. All rights reserved.
//

import UIKit

class DataSetTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
