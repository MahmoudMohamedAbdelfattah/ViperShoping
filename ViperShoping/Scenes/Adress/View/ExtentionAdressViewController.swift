//
//  ExtentionAdressViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 07/08/2023.
//

import UIKit
import MapKit
import CoreLocation


extension AdressViewController {

    func addNotation() {
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 24.693719, longitude: 46.723596)
        pin.title = "My Title"
        pin.subtitle = "Descrption"
        mapView.addAnnotation(pin)
    }
    
    func locationFetched(location: CLLocation) {
        let coordinat = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: coordinat, span: span)
        mapView?.setRegion(region, animated: true)
        getLocationInfo(location: location)
    }
    
 
 
    
    func getLocationInfo(location:CLLocation) {
        
        let gecoder = CLGeocoder()
    
        mapView.removeAnnotations(mapView.annotations)

        gecoder.reverseGeocodeLocation(location) { places, error in
            
            guard let place = places?.first , error == nil else {return}
            print("place location \(String(describing: place.location))")
            self.newPin.coordinate = location.coordinate
          // addressDeatial   = (String(describing: place.name))
            if let addressDeatial = place.name {
                self.adressDetals.text = addressDeatial
                self.newPin.title = addressDeatial
            }
            self.nameCountry.text = place.country
            if let administrativeArea = place.administrativeArea {
                self.nameGovernorate.text = administrativeArea
            }

            self.nameCity.text = place.locality  ?? "Unknown City"
            if let city = place.name,
            let state = place.administrativeArea {
                self.newPin.subtitle = "\(city) \(state)"
            }
            self.mapView.addAnnotation(self.newPin)
            self.locationLatitude = location.coordinate.latitude
            self.locationLongitude = location.coordinate.longitude
     
        }
    }
    
    func dropPinZoomIn(placemark: MKPlacemark) {
        
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
        let state = placemark.administrativeArea {
            annotation.subtitle = "(city) (state)"
        }
        self.nameCity.text = placemark.locality ?? "Unknown City"
        self.adressDetals.text = placemark.name
        self.nameCountry.text = placemark.country
        self.nameGovernorate.text = placemark.administrativeArea
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta:0.05,longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center:placemark.coordinate,span: span)
        mapView.setRegion(region, animated: true)
        print("Secounddddddddddddd")
    

    }
}

 
