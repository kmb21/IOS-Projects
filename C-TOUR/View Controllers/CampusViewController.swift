//
//  CampusViewController.swift
//  C-Tour
//
//  Created by Maxwell Kumbong on 4/24/23.
//

import UIKit


class CampusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    struct College {
        var name: String
        var location: String
        var logopic: UIImage
    }
    

    let colleges = [
        College(name: "Swarthmore College", location: "500 College Ave, Swarthmore, PA 19081", logopic: UIImage(named: "Logo")!) ,
        College(name: "Haverford College", location: "370 Lancaster Ave, Haverford, PA 19041", logopic: UIImage(named: "haverford")!),
        College(name: "University of Pennsylvania", location: "UPenn University of, Philadelphia, PA 19104", logopic: UIImage(named: "UPenn")!),
        College(name: "Bryn Mawr College", location: "101 N Merion Ave, Bryn Mawr, PA 19010", logopic: UIImage(named: "Bryn")!),
        College(name: "Stanford University", location: "450 Serra Mall, Stanford, CA 94305", logopic: UIImage(named: "stanford")!),
        College(name: "Harvard University", location: "Cambridge, MA", logopic: UIImage(named: "harvard")!),
        College(name: "Yale University", location: "New Haven, CT 06520", logopic: UIImage(named: "yale")!),
        College(name: "Massachussetts Institute of Technology", location: "77 Massachussetts Ave, Cambridge, MA 02139", logopic: UIImage(named: "mit")!),
        College(name: "Columbia University", location: "NewYork, NY 10027", logopic: UIImage(named: "columbia")!),
        College(name: "Amherst College", location: "Amherst, MA", logopic: UIImage(named: "amherst")!),
        College(name: "Princeton University", location: "Princeton, NJ", logopic: UIImage(named: "princeton")!),
        College(name: "Thomas Jefferson University", location: "4201 Henry Ave, Philadelphia, PA 19144", logopic: UIImage(named: "jefferson")!),
        College(name: "Vanderbilt University", location: "2201 West End Ave, Nashville, TN 37235", logopic: UIImage(named: "vanderbilt")!),
        College(name: "Williams College", location: "800 Main St, Williamstown, MA", logopic: UIImage(named: "williams")!),
        College(name: "John Hopkins University", location: "Baltimore, MD", logopic: UIImage(named: "hopkins")!),
        College(name: "Carnegie Mellon University", location: "5000 Forbes Ave, Pittsburgh, PA", logopic: UIImage(named: "cmu")!)
    ]
    
    var filteredData = [College]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return filteredData.count
        }
        else{
            return colleges.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let college = colleges[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchCell
        if searching{
            cell.schoolLabel?.text = filteredData[indexPath.row].name
            cell.locationLabel?.text = filteredData[indexPath.row].location
            cell.logo?.image = filteredData[indexPath.row].logopic
        }
        else{
            cell.schoolLabel.text = college.name
            cell.locationLabel.text = college.location
            cell.logo.image = college.logopic
            
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let college: College
        if searching {
            college = filteredData[indexPath.row]
        } else {
            college = colleges[indexPath.row]
        }
        performSegue(withIdentifier: "tour", sender: college)
        table.deselectRow(at: indexPath, animated: true)
        table.reloadData()
    }


    

}

extension CampusViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = colleges.filter({$0.name.lowercased().contains(searchText.lowercased()) || $0.location.lowercased().contains(searchText.lowercased())})
        searching = true
        table.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        table.reloadData()
    }
}
