//
//  HopeViewController.swift
//  C-Tour
//
//  Created by Fanuel Dana on 4/21/23.
//

import UIKit

class HopeViewController: UIViewController {
    
    @IBOutlet weak var tabling: UITableView!
    
    
    let amphitheater = Spot(image: UIImage(named: "amp2") ?? UIImage(), spotName: "The Amphitheater", year: 1890, spotDescription: "When you see it for the first time, it will take your breath away. One of Swarthmore’s most treasured spaces, Scott Outdoor Amphitheater is the site of new students’ first formal gathering as a class, First Collection, and their Last Collection.")
    
    let arboretum = Spot(image: UIImage(named: "scott") ?? UIImage(), spotName: "Scott Arboretum", year: 1875, spotDescription: "The Scott Arboretum cultivates a variety of plants that create some of the region’s most intimate, authentic, and accessible horticultural experiences. It is referred to as the “garden of ideas” and is always there to sustain the body, enchant the eye, and soothe the spirit.")
    
    let crum = Spot(image: UIImage(named: "crum2") ?? UIImage(), spotName: "The Crum Woods", year: 1875, spotDescription: "The Crum Woods encompasses 220 acres of mostly forested land straddling the Crum Creek in Swarthmore, PA. The woods contain walking trails and provide recreational opportunities for the Swarthmore College community as well as visitors to the campus.")
    
    let whisper = Spot(image: UIImage(named: "whisper1") ?? UIImage(), spotName: "Whispers Bench", year: 1991, spotDescription: "The Whispering Bench is an often-forgotten place to sit on campus. Located on the front lawn of campus near the president’s house and the Cherry Border, the Whispering Bench is maintained in memory of Carolien Powers ’22'.")
  
  
    
    
    var spots :[Spot] = []
    private var posts = [Post]() {
        didSet {
            // Reload table view data any time the posts variable gets updated.
            tabling.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        spots = [amphitheater, arboretum, crum, whisper]

        tabling.delegate = self
        tabling.dataSource = self
        tabling.allowsSelection = false
        // Do any additional setup after loading the view.
    }
    

    @IBAction func add(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "feedSegue", sender: self)
    }
    
    
    @IBAction func didTapImage(_ sender: UITapGestureRecognizer) {
        
        if let tappedView = sender.view {
            performSegue(withIdentifier: "hopeDetailSegue", sender: tappedView)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "hopeDetailSegue",
            let tappedView = sender as? UIView,
            let HopeViewController = segue.destination as? HopeDetailViewController {

            if tappedView.tag == 0 {
                HopeViewController.spot = spots[0]
            } else if tappedView.tag == 1 {
                HopeViewController.spot = spots[1]
            } else if tappedView.tag == 2 {
                HopeViewController.spot = spots[2]
            } else if tappedView.tag == 3 {
                HopeViewController.spot = spots[3]
            } else {
                print("no Top Spot was tapped.")
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        queryPosts()
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func didTapLabel(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "theSegue", sender: tappedView)
        }
    }
    private func queryPosts() {
        // TODO: Pt 1 - Query Posts
        let query = Post.query()
            .include("user")
            .order([.descending("createdAt")])

        // Fetch objects (posts) defined in query (async)
        query.find { [weak self] result in
            switch result {
            case .success(let posts):
                // Update local posts property with fetched posts
                self?.posts = posts
            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }


    }
   
}
extension HopeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCellCopy", for: indexPath) as? PostCellCopy else {
            return UITableViewCell()
        }
        cell.configure(with: posts[indexPath.row])
        return cell
    }
}

extension HopeViewController: UITableViewDelegate { }
