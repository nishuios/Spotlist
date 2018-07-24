//
//  Detail_Mapview_ViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 15/06/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class Detail_Mapview_ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapcatseg: UISegmentedControl!
    
    var incominglat = String()
    var incominglng = String()
    var incomingtitle = String()
    var incomingdesc = String()
    @IBOutlet weak var mapview: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        setupmapviewwithcordinates()
        
    }
    
    @IBAction func segments(_ sender: UISegmentedControl) {
        
        if self.mapcatseg.selectedSegmentIndex == 0{
            
            self.mapview.mapType = .standard
        }else
            if self.mapcatseg.selectedSegmentIndex == 1{
                self.mapview.mapType = .satellite
            }else if self.mapcatseg.selectedSegmentIndex == 2{
                
                self.mapview.mapType = .hybrid
        }
        
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        
    dismiss(animated: true, completion: nil)
    
    }

}
//setting up map with incoming data
extension Detail_Mapview_ViewController{
    func setupmapviewwithcordinates(){
        
        
        let lt = Double.init(self.incominglat)
        let ln = Double.init(self.incominglng)
        
        if let lats = lt{
            
            
            if let lngs = ln {
                let location = CLLocationCoordinate2DMake(lats, lngs)
                let span = MKCoordinateSpanMake(0.004, 0.004)
                let region = MKCoordinateRegionMake(location, span)
                self.mapview.setRegion(region, animated: true)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = location
                annotation.title = self.incomingtitle
                annotation.subtitle = self.incomingdesc
            
                self.mapview.addAnnotation(annotation)
                
            }
        }
        
        
    }

}
extension Detail_Mapview_ViewController {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?
    {
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
            annotationView?.image = UIImage(named: "pin.png")
        }
        else {
            annotationView!.annotation = annotation
        }
        
        let pinImage = UIImage(named: "child.png")
        annotationView!.image = pinImage
        
        return annotationView
    }
}



