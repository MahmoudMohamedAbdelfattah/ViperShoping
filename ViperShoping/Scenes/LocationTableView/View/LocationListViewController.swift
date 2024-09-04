//
//  LocationListViewController.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 14/7/2024.
//

import UIKit
import MapKit

class LocationListViewController: UIViewController , LocationViewProtocol {
    
    // MARK: - IBOutlets
    @IBOutlet weak var locationTableView: UITableView!{
        didSet {
            locationTableView.delegate = self
            locationTableView.dataSource = self
            locationTableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "LocationTableViewCell")
         }
     }
    
    // MARK: - Properties
    var presenter: LocationPresenterProtocol?
    var matchingItems:[MKMapItem] = []
    var mapView: MKMapView? = nil
    var handleMapSearchDelegate:HandleMapSearch? = nil

    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    func parseAddress(selectedItem:MKPlacemark) -> String {
         let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
         let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
         let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        let addressLine = String(
            format:"%@%@%@%@%@%@%@",
            // street number
            selectedItem.subThoroughfare ?? "",
            firstSpace,
            // street name
            selectedItem.thoroughfare ?? "",
            comma,
            // city
            selectedItem.locality ?? "",
            secondSpace,
            // state
            selectedItem.administrativeArea ?? ""
        )
        return addressLine
    }

}
