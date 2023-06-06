//
//  LocationManger.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 9/7/2024.
//

import UIKit
import MapKit
import CoreLocation



protocol LocationDelegate : AnyObject {
    func userLocationUpdated(location: CLLocation)
 
}

class LocationManger : NSObject , CLLocationManagerDelegate , MKMapViewDelegate{
    
    public static let shared = LocationManger()
    
    var locationManager = CLLocationManager()
    var currentLocation : CLLocationCoordinate2D?
    var userLocationDelegate: LocationDelegate?

    var loctiones = [CLLocation]()
    var previosloction:CLLocation?
    
    private override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        checkAuth()
     }
    
    func starttrackinguserlocation(){
        //mapView.showsUserLocation = true
        centerviewonuser()
        locationManager.startUpdatingLocation()
 //       previosloction = genrateloction(for: mapView)
       
    }
    
    func centerviewonuser(){
            if let loction = locationManager.location?.coordinate{
               
                let region = MKCoordinateRegion.init(center: loction, latitudinalMeters: 500, longitudinalMeters: 500)
               //  userLocationDelegate?.region(region: region)
             }
        }
    
    func genrateloction(for mapview:MKMapView)->CLLocation{
        
        let lat = mapview.centerCoordinate.latitude
        let long = mapview.centerCoordinate.longitude
        return CLLocation(latitude: lat, longitude: long)
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        locationManager.stopUpdatingLocation()
//
//        currentLocation = manager.location?.coordinate
//        if userLocationDelegate != nil {
//            userLocationDelegate?.userLocationUpdated(location: locations.first ?? CLLocation())
//        }
//    }
    
    
//    func checkLocationStatus(){
//        if LocationServices.shared.locationManager.authorizationStatus == .authorizedWhenInUse {
// 
//        } else {
//            LocationServices.shared.locationManager.requestWhenInUseAuthorization()
//        }
//    }
    
    func checkAuth(){
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
              //  starttrackinguserlocation()
                break
            case .denied:
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                break
            case .restricted:
                break
            case .authorizedAlways:
                break
           
             default:
            break
            }
        }
}


extension LocationManger {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
 
        currentLocation = manager.location?.coordinate
        if userLocationDelegate != nil {
            userLocationDelegate?.userLocationUpdated(location: locations.first ?? CLLocation())
        }
        
        loctiones=locations
         locationManager.stopUpdatingLocation()
 
      }
 
      func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
          checkAuth()
      }
    
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
 
        let newLocation = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
              getLocationInfo(location: newLocation)
      }
    
    
    func getLocationInfo(location:CLLocation) {
        
        let gecoder = CLGeocoder()
     //   preveseLocation = location
        gecoder.reverseGeocodeLocation(location) { places, error in
            
            guard let place = places?.first , error == nil else {return}
            print("place location \(String(describing: place.location))")
            print("place Name \(String(describing: place.name))")
           // self.city.text = place.locality
            print("place Country \(String(describing: place.country))")
           // self.country.text = place.country
            print("place Country Code \(String(describing: place.isoCountryCode))")
            print("place AdministrativeArea \(String(describing: place.administrativeArea))")
            print("place locality \(String(describing: place.locality))")
            print("place Postal Code \(String(describing: place.postalCode))")



        }
    }
}
