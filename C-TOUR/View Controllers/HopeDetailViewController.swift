//
//  HopeDetailViewController.swift
//  C-Tour
//
//  Created by Kuzivakwashe Mavera on 4/23/23.
//

import UIKit

class HopeDetailViewController: UIViewController {
    
    var spot: Spot?
    
    
    @IBOutlet weak var spotImage: UIImageView!
    
    @IBOutlet weak var spotname: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    @IBOutlet weak var spotdesc: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let spot = spot {
                    spotname.text = spot.spotName
                    spotImage.image = spot.image
                    year.text = String(spot.year)
                    spotdesc.text = spot.spotDescription
                }
            // Do any additional setup after loading the view.
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
    }
    

