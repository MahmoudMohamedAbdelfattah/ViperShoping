//
//  ExtentionCartProductView.swift
//  ViperShoping
//
//  Created by Mahmoud on 03/10/2024.
//

 import UIKit
 extension CartProductViewController : UITableViewDelegate , UITableViewDataSource {
    
     // MARK: - Methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return presenter?.CartProduct?.count ?? 0
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = cartTable.dequeueReusableCell(withIdentifier:"CartCell", for: indexPath) as! CartCell
            cell.configure(with: presenter?.CartProduct?[indexPath.row])
             return cell
        }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 300
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             if let productsSet = presenter?.CartProduct?[indexPath.row].products as? Set<CartProductEntity> {
                for product in productsSet {
                     self.allData.append(product)
                }
            }
            self.presenter?.routeToView(view: DetailsInvoiceWireFrame.assembleModule(detailsInvoiceProduct: allData))
            self.allData = []
          }
 }
 
