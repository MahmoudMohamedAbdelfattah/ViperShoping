//
//  ExtentionLocationList.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 14/7/2024.
//

import UIKit
import MapKit
extension  LocationListViewController : UITableViewDelegate , UITableViewDataSource {
    
    // MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationTableView.dequeueReusableCell(withIdentifier:"LocationTableViewCell", for: indexPath) as! LocationTableViewCell
        let selectedItem = matchingItems[indexPath.row].placemark
         cell.placeName?.text = selectedItem.name
        cell.placeDeatial?.text = parseAddress(selectedItem: selectedItem)
        return cell
    }
    
    
    
}
extension LocationListViewController {

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
         handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
         dismiss(animated: true, completion: nil)
    }
}


extension LocationListViewController : UISearchResultsUpdating {
    
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
                self.locationTableView.reloadData()
           }
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")

    }
}
