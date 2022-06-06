//
//  AcronymCell.swift
//  AcronymSearch
//
//  Created by Suvidha Nakhawa on 6/5/22.
//

import UIKit

class AcronymCell: UITableViewCell {

    @IBOutlet weak var longformLbl: UILabel!
    @IBOutlet weak var freqLbl: UILabel!
    
    @IBOutlet weak var yearLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
