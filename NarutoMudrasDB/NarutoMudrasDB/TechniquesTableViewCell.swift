//
//  TechniquesTableViewCell.swift
//  NarutoMudrasDB
//
//  Created by Louis Jeanty on 31/03/2021.
//

import UIKit

class TechniquesTableViewCell: UITableViewCell {
    @IBOutlet weak var techniqueImage: UIImageView!
    @IBOutlet weak var nameTechniqueTxt: UILabel!
    @IBOutlet weak var dateTechniqueTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
