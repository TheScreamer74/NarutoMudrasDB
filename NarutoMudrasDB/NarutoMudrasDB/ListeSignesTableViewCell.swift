//
//  ListeSignesTableViewCell.swift
//  NarutoMudrasDB
//
//  Created by Louis Jeanty on 31/03/2021.
//

import UIKit

class ListeSignesTableViewCell: UITableViewCell {
    @IBOutlet weak var signeImage: UIImageView!
    @IBOutlet weak var signeNameTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
