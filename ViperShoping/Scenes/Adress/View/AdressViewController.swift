//
//  AdressViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2024.
//

import UIKit
import MapKit
import CoreLocation

class CustomPointAnnotation: MKPointAnnotation {
    var pinCustomImageName: UIImage!
    
    
}

class AdressViewController: UIViewController ,AdressViewProtocol , MKMapViewDelegate, HandleMapSearch , UIGestureRecognizerDelegate {
 
    // MARK: - IBOutlets

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameCountry: UILabel!
    @IBOutlet weak var nameGovernorate: UILabel!
    @IBOutlet weak var nameCity: UILabel!
    @IBOutlet weak var adressDetals: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    var presenter: AdressPresenterProtocol?
    var resultSearchController: UISearchController? = nil
    var selectedPin:MKPlacemark? = nil
    let newPin = MKPointAnnotation()

    var locationLatitude: Double = 0.0
    var locationLongitude: Double = 0.0
 //   var locationName: String!

    // MARK: - Function
     override func viewDidLoad() {
        super.viewDidLoad()
          
         presenter?.viewDidLoad()
         tapGestureMap()
         setupLayerMap()
         mapView.delegate = self
         self.resultSearchController?.searchBar.isHidden = true
         self.navigationItem.setHidesBackButton(true, animated: true)
          setupSearchBar()
       }
    
 
    private func setupLayerMap(){
        mapView.layer.cornerRadius = 20
        mapView.layer.borderWidth = 3
        mapView.layer.borderColor = UIColor.orange.cgColor
    }
    
    private func tapGestureMap(){
        let tgr = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureHandler))
        tgr.delegate = self
        mapView.addGestureRecognizer(tgr)

    }
    
    @objc func tapGestureHandler(tgr: UITapGestureRecognizer){
        let touchPoint = tgr.location(in: mapView)
        let touchMapCoordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
    print("tapGestureHandler: touchMapCoordinate = \(touchMapCoordinate.latitude),\(touchMapCoordinate.longitude)")
        
        let geoCoder = CLGeocoder()
            let location = CLLocation(latitude: touchMapCoordinate.latitude, longitude: touchMapCoordinate.longitude)
        getLocationInfo(location: location)
        mapView.removeAnnotations(mapView.annotations)
     }
 
 
 
    func SearchDesintation(desitnation:String) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = desitnation
        let activitySearch = MKLocalSearch(request: searchRequest)
        activitySearch.start { response , errore in
            let latitude =  response?.boundingRegion.center.latitude
            let longitude  =  response?.boundingRegion.center.longitude
            let cooredante = CLLocationCoordinate2D(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0)
            let spane = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region  = MKCoordinateRegion(center: cooredante, span: spane)
            self.mapView.setRegion(region, animated: true)
           }
        }
 
    func setupSearchBar() {
 
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        
            let locationSearchTable = LocationListViewController()
            resultSearchController =
        UISearchController(searchResultsController:locationSearchTable)
            resultSearchController?.searchResultsUpdater = locationSearchTable
            let searchBar = resultSearchController!.searchBar
            searchBar.sizeToFit()
            searchBar.placeholder = "Search for places"
            searchBar.iconColor = .white.withAlphaComponent(0.5)
            searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search for places", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
         
 

        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.obscuresBackgroundDuringPresentation = true
        navigationItem.searchController = resultSearchController
        self.definesPresentationContext = true
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
    }
    // MARK: - @IBAction

    @IBAction func saveButton(_ sender: Any) {
        
        self.presenter?.postSaveAddress(name: self.nameCountry.text ?? "", city: self.nameGovernorate.text ?? "", region: self.nameCity.text ?? "", details: self.adressDetals.text ?? "", latitude:  self.locationLatitude, longitude: self.locationLongitude, notes: "Home", Content_Type: NetworkManager.shared.contentType, lang: LanguageHandler.currentLanguage().rawValue, Authorization: Component.shared.getApiToken() ?? "")
    }
}

