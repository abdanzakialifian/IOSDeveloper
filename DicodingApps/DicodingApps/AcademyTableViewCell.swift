//
//  AcademyTableViewCell.swift
//  DicodingApps
//
//  Created by Abdan Zaki Alifian on 28/04/24.
//

import UIKit

class AcademyTableViewCell: UITableViewCell {

    @IBOutlet weak var academyImageView: UIImageView!
    
    @IBOutlet weak var academyTitle: UILabel!
    
    @IBOutlet weak var academyDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
