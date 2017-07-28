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
import Foundation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    class CustomPointAnnotation: MKPointAnnotation {
        var imageName: String!
    }
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var BreadcrumbPin = CustomPointAnnotation()
    var startendbuttonarray = ["startImage","endImage"]
    var ButtonStart: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        mapView.showsUserLocation = true
        
        let lotsofcrumbsCoordinates = CLLocationCoordinate2DMake(37.468319, -122.143936)
        BreadcrumbPin.coordinate = lotsofcrumbsCoordinates
        BreadcrumbPin.title = "Stanford"
        BreadcrumbPin.imageName = "crumb.png"
        mapView.addAnnotation(BreadcrumbPin)
        
        let crumbsCoordinates = CLLocationCoordinate2DMake(37.615223, -122.389977)
        BreadcrumbPin.coordinate = crumbsCoordinates
        BreadcrumbPin.title = "San Francisco"
        BreadcrumbPin.imageName = "crumb.png"
        mapView.addAnnotation(BreadcrumbPin)
        
        let BreadCoordinates = CLLocationCoordinate2DMake(34.052235, -118.243683)
        BreadcrumbPin.coordinate = BreadCoordinates
        BreadcrumbPin.title = "LA"
        BreadcrumbPin.imageName = "crumb.png"
        mapView.addAnnotation(BreadcrumbPin)
        
        let crumbsssCoordinates = CLLocationCoordinate2DMake(37.386051, -122.083855)
        BreadcrumbPin.coordinate = crumbsssCoordinates
        BreadcrumbPin.title = "MountainView"
        BreadcrumbPin.imageName = "crumb.png"
        mapView.addAnnotation(BreadcrumbPin)
        
        let crumbssssCoordinates = CLLocationCoordinate2DMake(36.606216, -121.913986)
        BreadcrumbPin.coordinate = crumbssssCoordinates
        BreadcrumbPin.title = "Monterey"
        BreadcrumbPin.imageName = "crumb.png"
        mapView.addAnnotation(BreadcrumbPin)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.transportType = .automobile
        
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if !(annotation is MKPointAnnotation) {
            print("NOT REGISTERED AS MKPOINTANNOTATION")
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "crumbIdentitfier")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "crumbIdentitfier")
            annotationView!.canShowCallout = true
        }
            
        else {
            annotationView!.annotation = annotation
        }
        
        let cpa = annotation as! CustomPointAnnotation
        annotationView!.image = UIImage(named: cpa.imageName)
        
        return annotationView
    }
    
    
    
    func plotPolyline(route: MKRoute) {
        // 1
        mapView.add(route.polyline)
        // 2
        if mapView.overlays.count == 1 {
            mapView.setVisibleMapRect(route.polyline.boundingMapRect,
                                      edgePadding: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0),
                                      animated: false)
        }
            // 3
        else {
            let polylineBoundingRect =  MKMapRectUnion(mapView.visibleMapRect,
                                                       route.polyline.boundingMapRect)
            mapView.setVisibleMapRect(polylineBoundingRect,
                                      edgePadding: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0),
                                      animated: false)
        }
    }
    
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 7.0
        
        return renderer
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        if ButtonStart == true {
            (sender as AnyObject).setImage(UIImage(named:"endImage"), for:UIControlState())
            ButtonStart = false
            self.Label.text = "Click the button again to end your trail and start your journey back"
        }
        else if ButtonStart == false {
            (sender as AnyObject).setImage(UIImage(named:"startImage"), for:UIControlState())
            ButtonStart = true
            self.Label.text = "Click the button to start your trail"
            
        }
        mapView.isHidden = false 
        
        
    }
    
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        mapView.isHidden = true
    }
    
}

   
