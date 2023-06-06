//
//  SearchCell.swift
//  C-Tour
//
//  Created by Maxwell Kumbong on 4/21/23.
//

import UIKit

class SearchCell: UITableViewCell {
    
    struct College {
        var name: String
        var location: String
        var logopic: UIImage
    }
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    
    @IBOutlet weak var logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        logo.layer.cornerRadius = logo.frame.width / 2.0
        logo.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with college: College) {
        schoolLabel.text = college.name
        locationLabel.text = college.location
        logo.image = college.logopic
    }

}
