//
//  ExtentionCategoryDetails.swift
//  ViperShoping
//
//  Created by Mahmoud on 21/07/2023.
//

import UIKit
import CoreData

extension CategoryDetailsViewController : UITableViewDelegate , UITableViewDataSource {
    
    // MARK: - Methods

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          if isSearch  {
              return presenter?.searchProduct?.count ?? 0

            } else {
                return presenter?.allProductCategoryDetails?.count ?? 0

            }
     }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryDetailsTableView.dequeueReusableCell(withIdentifier:"CategoryDetailsCell", for: indexPath) as! CategoryDetailsCell
           if isSearch  {
               cell.configure(NameModule:(presenter?.searchProduct?[indexPath.row]) ?? CategoryDataDetials())

            } else {
                cell.configure(NameModule:(presenter?.allProductCategoryDetails?[indexPath.row]) ?? CategoryDataDetials())
             }
            cell.delgate = self
              return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 580
        } else {
            return 300
         }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.present(SubCategoryWireFrame.assembleModule(id: presenter?.allProductCategoryDetails?[indexPath.row].id ?? 0), animated: true)
         }
 
 }


extension CategoryDetailsViewController :ProductTableViewDelgate  {
 
    // MARK: - Methods

    func reloadCartQuntityCell(cell: UITableViewCell, quantity: Int?, model: CategoryDataDetials?) {
        guard let index = categoryDetailsTableView.indexPath(for: cell) else {return}
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        if quantity ?? 0 > 0 {
            presenter?.allProductCategoryDetails?[index.row].quantity = quantity
            presenter?.PostupdateProductQuantityFromInvoice(productID: Int64(presenter?.allProductCategoryDetails?[index.row].id ?? 0), newQuantity: Int(Int64(Int32(presenter?.allProductCategoryDetails?[index.row].quantity ?? 0))), context: AppDelegate.shared.persistentContainer.viewContext)
           } else {
               presenter?.deletIdProductFromInvoice(productID: Int64(presenter?.allProductCategoryDetails?[index.row].id ?? 0), context: AppDelegate.shared.persistentContainer.viewContext)
           }
            self.categoryDetailsTableView.reloadRows(at: [index], with: .automatic)
     }
    
 
 
    func reloadCartCell(cell: UITableViewCell, isCart: Bool?, model: CategoryDataDetials?) {
            guard let index = categoryDetailsTableView.indexPath(for: cell) else {return}
            presenter?.allProductCategoryDetails?[index.row].isCart = isCart
            presenter?.allProductCategoryDetails?[index.row].quantity = 1
            self.categoryDetailsTableView.reloadRows(at: [index], with: .automatic)
   
             if isCart == true {
                self.viewCart.isHidden = false
                  presenter?.saveInvoiceCoreData(product: presenter?.allProductCategoryDetails?[index.row] ?? CategoryDataDetials(), context: AppDelegate.shared.persistentContainer.viewContext)
 
                  } else {
                       presenter?.deletIdProductFromInvoice(productID: Int64(presenter?.allProductCategoryDetails?[index.row].id ?? 0), context: AppDelegate.shared.persistentContainer.viewContext)
                   }
         }

    func reloadFavoriteCell(cell: UITableViewCell, isFavorite: Bool?,model: CategoryDataDetials?){
            guard let index = categoryDetailsTableView.indexPath(for: cell) else {return}
            presenter?.allProductCategoryDetails?[index.row].isFavorite = isFavorite
             self.categoryDetailsTableView.reloadRows(at: [index], with: .automatic)
 
            if isFavorite == true {
                self.presenter?.saveProduct(data: presenter?.allProductCategoryDetails?[index.row] ?? CategoryDataDetials(),kind: CoreDataManager.entityNameCoreData.favorite)
             } else {
                 presenter?.deleteIdProduct(id:presenter?.allProductCategoryDetails?[index.row].id ?? 0, entityName:.favorite)
         }
     }
}
 
