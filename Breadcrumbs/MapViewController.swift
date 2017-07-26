//
//  SecondViewController.swift
//  Breadcrumbs
//
//  Created by iD Student on 7/24/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    

    var ButtonStart: Bool = true

    @IBOutlet weak var MapLabel: UILabel!
    
    @IBOutlet weak var Map: MKMapView!
    
    @IBOutlet weak var CTSButton: UILabel!
    
    var startendbuttonarray = ["startImage","endImage"]

    @IBAction func StartEndButton(_ sender: Any) {
        if ButtonStart == true {
            (sender as AnyObject).setImage(UIImage(named:"endImage"), for:UIControlState())
            ButtonStart = false
            self.MapLabel.text = "Click the button again to end your trail and start your journey back"
        }
        else if ButtonStart == false {
            (sender as AnyObject).setImage(UIImage(named:"startImage"), for:UIControlState())
            ButtonStart = true
            self.MapLabel.text = "Click the button to start your trail"

            
        }
        
        }

    
    let locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let location = locations[0]
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01,0.01)
        
        let userLocation: CLLocationCoordinate2D =
            CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, span)
        
        Map.setRegion(region,animated:true )
        
        self.Map.showsUserLocation = true
        
    }
    
func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
  
    
    
    
    
    
    
    //     guard !annotation.isKind(of: MKUserLocation.self) else{
   //         return nil
  //  }
    
    //let annotationIdentifier = "AnnotationIdentifier"
    //var annotationView = Map.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
    //if annotationView == nil {
    //    annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
   //     annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    //    annotationView!.canShowCallout = true
  //  }
  //  else {
   //     annotationView!.annotation = annotation
    
   //     }
 //   annotationView!.image = UIImage(named:"crumb")
 //       return annotationView
}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    
        self.Map.delegate = self
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

