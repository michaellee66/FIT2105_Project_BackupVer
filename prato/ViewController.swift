//
//  ViewController.swift
//  prato
//
//  Created by ZEYU_Michael_Li on 11/07/2016.
//  Copyright © 2016 ZEYU_Michael_Li. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate {

    
    
    @IBOutlet weak var Mapview: MKMapView!

    let locationManager=CLLocationManager()
    
    var manager: CLLocationManager?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager?.delegate = self;
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()
        
        manager?.requestAlwaysAuthorization()
        let radius: CLLocationDistance = CLLocationDistance(20)
        let currRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 43.769258, longitude: 11.255574), radius: radius,identifier: "Home")
        manager?.startMonitoringForRegion(currRegion)
        
        
        //let initialLocation = CLLocation(latitude: 43.769596, longitude:  11.255637)
        //let initialLocation = CLLocation(latitude: 43.769596, longitude:  11.255637)
        //centerMapOnLocation(initialLocation)
        //Mapview.camera.pitch = 0.0
        //Mapview.camera.altitude = 300.0
        //Mapview.mapType = .Satellite
        
    }
    func update() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        let location = locations[0] as CLLocation
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (data, error) -> Void in
            let placeMarks = data! as [CLPlacemark]
            let loc: CLPlacemark = placeMarks[0]
            
            var initialLocation = CLLocation(latitude: 43.769600, longitude: 11.256093)
            initialLocation = CLLocation(latitude: 43.769258, longitude: 11.255574)
            
            
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate,150, 150)
            self.Mapview.setRegion(coordinateRegion, animated: true)
            
            
            
            //self.Mapview.centerCoordinate = location.coordinate
            //let addr = loc.locality
            //let reg = MKCoordinateRegionMakeWithDistance(location.coordinate, 1500, 1500)
            //self.Mapview.setRegion(reg, animated: true)
            self.Mapview.showsUserLocation = true
            
        })
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        NSLog("Entering region")
        
        
        var refreshAlert = UIAlertController(title: "Medusa", message: "I found you ! ", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Approach statue", style: .Default, handler: { (action: UIAlertAction!) in
            self.performSegueWithIdentifier("showAudio", sender: self)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Walk away", style: .Cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
        
        
        //let alertController = UIAlertController(title: "Hey", message:"I found you ! ", preferredStyle: UIAlertControllerStyle.Alert)
        //alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        //self.presentViewController(alertController, animated: true, completion: nil)
        //sleep(3)
        
        
        
    }
    
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        NSLog("Exit region")
        print("232131231")
    }
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "push" {
            
        }
    }
    
}


