//
//  CorrectViewController.swift
//  C-Tour
//
//  Created by Fanuel Dana on 4/21/23.
//

import UIKit
import MapKit

class CorrectViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        picture.image = UIImage(named: "Parrish")
        mapy.delegate = self
        wiser.text = "Parrish"
        texter.text = "Parrish Hall, the College’s iconic oldest building, sits in the center of campus and serves as a hub of campus life, with Admissions, the Dean’s Office, the Post Office, and the President’s Office on the first two floors and residence hall rooms above. "
        
        
        
        let location = locations[0]
        let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        //let region = MKCoordinateRegion(center: coordinate, span: span)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = location.imageName
//        mapy.setRegion(region, animated: true)
        mapy.addAnnotation(annotation)
        
        
        
        
        
        locationManager.delegate = self
                
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
                
        mapy.showsUserLocation = true
        
        
        // Do any additional setup after loading the view.
    }
    let locationManager = CLLocationManager()
   
    @IBOutlet weak var wiser: UILabel!
    let locations = [
        Location(imageName: "Parrish", latitude: 39.905379084102805, longitude: -75.35420943232845),
        Location(imageName: "SciCenter", latitude: 39.906792551164735, longitude: -75.35571378999889),
        Location(imageName: "Mccabe", latitude: 39.90547192361826, longitude: -75.35237412309667),
        Location(imageName: "Singer", latitude: 39.9074898293348, longitude: -75.35396583232837),
        Location(imageName: "Wharton", latitude: 39.903929563583574, longitude: -75.35623306116378),
        Location(imageName: "Beardsley", latitude: 39.90681467113786, longitude: -75.35472576116368),
        Location(imageName: "DCC", latitude: 39.903448676535184, longitude: -75.35378860475394)
    ]
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            
            mapy.setRegion(region, animated: true)
        }
    
    
    
    
    
    @IBOutlet weak var mapy: MKMapView!
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var texter: UILabel!
    
    var tapCount = 1
    @IBAction func tap(_ sender: UIButton) {
        if tapCount == 1 {
            texter.text = "A new 145,000-SF facility joined all of Swarthmore’s science departments including physics, astronomy, mathematics/statistics, chemistry, biology, computer science and the science library under one roof. "
            wiser.text = "Science Center"
            picture.image = UIImage(named: "SciCenter")
            
                let location = locations[1]
                let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
                let span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
                //let region = MKCoordinateRegion(center: coordinate, span: span)
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = location.imageName
                //mapy.setRegion(region, animated: true)
                mapy.addAnnotation(annotation)
            
            
        } else if tapCount == 2 {
            texter.text = "McCabe Library is the center of the College Libraries system. The Circulation, Technical Services and Reference Departments occupy the main floor. Other facilities include study carrels, lounges, computers for student use, conference rooms, and faculty studies. "
            wiser.text = "Mccabe Library"
            picture.image = UIImage(named: "Mccabe")
            
            let location = locations[2]
            let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025)
            //let region = MKCoordinateRegion(center: coordinate, span: span)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = location.imageName
            //mapy.setRegion(region, animated: true)
            mapy.addAnnotation(annotation)
        } else if tapCount == 3 {
            texter.text = "As the new home of Swarthmore’s engineering, biology, and psychology departments, Singer Hall affirms the college’s interdisciplinary values and supports their long-term strategic plan."
            wiser.text = "Singer Hall"
            picture.image = UIImage(named: "Singer")
            
            let location = locations[3]
            let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025)
            //let region = MKCoordinateRegion(center: coordinate, span: span)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = location.imageName
            //mapy.setRegion(region, animated: true)
            mapy.addAnnotation(annotation)
        } else if tapCount == 4 {
            texter.text = "Wharton, centrally located and with beautiful views of the Crum and the amphitheater, is divided into three sections (AB, CD, and EF), CD houses only seniors. AB and EF house first-year student. "
            picture.image = UIImage(named: "Wharton")
            wiser.text = "Wharton"
            
            let location = locations[4]
            let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let span = MKCoordinateSpan(latitudeDelta:0.0025, longitudeDelta: 0.0025)
            //let region = MKCoordinateRegion(center: coordinate, span: span)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = location.imageName
            //mapy.setRegion(region, animated: true)
            mapy.addAnnotation(annotation)
        } else if tapCount == 5 {
            texter.text = "Built in 1906, Beardsley Hall was created using an architectural cutting-edge material technology: molded concrete blocks. Today, this unique structure is the home to an 1,100 sq ft painting studio.  In addition to the Art Office, you can also find faculty and staff’s offices."
            picture.image = UIImage(named: "Beardsley")
            wiser.text = "Beardsley"
            
            let location = locations[5]
            let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025)
            //let region = MKCoordinateRegion(center: coordinate, span: span)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = location.imageName
            //mapy.setRegion(region, animated: true)
            mapy.addAnnotation(annotation)
        } else if tapCount == 6 {
            texter.text = "Dining in community is at the heart of the College experience. Gathering to share a meal brings a chance to rest, share stories, and build lasting relationships with friends and colleagues. "
            picture.image = UIImage(named: "DCC")
            wiser.text = "DCC"
            
            let location = locations[6]
            let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025)
            //let region = MKCoordinateRegion(center: coordinate, span: span)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = location.imageName
            //mapy.setRegion(region, animated: true)
            mapy.addAnnotation(annotation)
            tapCount = 0
        }
        tapCount += 1
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

//extension CorrectViewController {
//    func mapy(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
//        let region = MKCoordinateRegion(center: userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//        mapView.setRegion(region, animated: true)
//
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = userLocation.coordinate
//        annotation.title = "My Location"
//        mapView.addAnnotation(annotation)
//    }
//
//}
