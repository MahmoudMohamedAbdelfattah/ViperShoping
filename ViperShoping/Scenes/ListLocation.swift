//
//  ListLocation.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 13/7/2024.
//


import UIKit
import MapKit

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class LocationSearch : UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var matchingItems:[MKMapItem] = []
    var mapView: MKMapView? = nil
    var handleMapSearchDelegate:HandleMapSearch? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   self.tableView.reloadData()
        self.navigationController?.isNavigationBarHidden = true
//        print("matchingItems")
//        print(matchingItems)

    }
    
    func parseAddress(selectedItem:MKPlacemark) -> String {
        // put a space between "4" and "Melrose Place"
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
        // put a comma between street and city/state
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
        // put a space between "Washington" and "DC"
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

extension LocationSearch : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let mapView = mapView,
            let searchBarText = searchController.searchBar.text else { return }
        ////
      
//        let searchRequest = MKLocalSearch.Request()
//        searchRequest.naturalLanguageQuery = searchBarText
//        let activitySearch = MKLocalSearch(request: searchRequest)
//        activitySearch.start { response , errore in
//            let latitude =  response?.boundingRegion.center.latitude
//            let longitude  =  response?.boundingRegion.center.longitude
//            let cooredante = CLLocationCoordinate2D(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0)
//            let spane = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//            let region  = MKCoordinateRegion(center: cooredante, span: spane)
//            self.mapView?.setRegion(region, animated: true)
//            self.matchingItems = response?.mapItems ?? [MKMapItem]()
//        }
//        DispatchQueue.main.async {
//                self.tableView.reloadData()
//           }
        
        //
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let activitySearch = MKLocalSearch(request: request)
        activitySearch.start { response, _ in
            guard let response = response else {
                return
            }
            self.matchingItems = response.mapItems
        DispatchQueue.main.async {
                self.table.reloadData()
           }
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")

    }
}

extension LocationSearch {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
//     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//         let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
//        let selectedItem = matchingItems[indexPath.row].placemark
//        cell.textLabel?.text = selectedItem.name
//        cell.detailTextLabel?.text = parseAddress(selectedItem: selectedItem)
//        return cell
//    }
//
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
       let selectedItem = matchingItems[indexPath.row].placemark
       cell.textLabel?.text = selectedItem.name
       cell.detailTextLabel?.text = parseAddress(selectedItem: selectedItem)
       return cell
    }
    
    
}
extension LocationSearch {

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
         handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
         dismiss(animated: true, completion: nil)
    }
}
