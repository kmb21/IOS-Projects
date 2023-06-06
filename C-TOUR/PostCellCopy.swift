//
//  PostCellCopy.swift
//  C-Tour
//
//  Created by Maxwell Kumbong on 4/25/23.
//

import UIKit
import Alamofire
import AlamofireImage

class PostCellCopy: UITableViewCell {

    @IBOutlet weak var dayer: UILabel!
    @IBOutlet weak var captioner: UILabel!
    @IBOutlet weak var namer: UILabel!
    @IBOutlet weak var imagely: UIImageView!
    private var imageDataRequest: DataRequest?
    func configure(with post: Post) {
        // TODO: Pt 1 - Configure Post Cell
        if let user = post.user {
            namer.text = user.username
        }

        // Image
        if let imageFile = post.imageFile,
           let imageUrl = imageFile.url {
            
            // Use AlamofireImage helper to fetch remote image from URL
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    // Set image view image with fetched image
                    self?.imagely.image = image
                case .failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                    break
                }
            }
        }

        // Caption
        captioner.text = post.caption
    

        // Date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d'\(daySuffix(for: post.createdAt))', yyyy"
        if let date = post.createdAt {
            dayer.text = dateFormatter.string(from: date)
        }

    }
    
    func daySuffix(for date: Date?) -> String {
        guard let date = date else { return "" }
        let calendar = Calendar.current
        let dayOfMonth = calendar.component(.day, from: date)
        switch dayOfMonth {
        case 1, 21, 31: return "st"
        case 2, 22: return "nd"
        case 3, 23: return "rd"
        default: return "th"
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        // TODO: P1 - Cancel image download

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
