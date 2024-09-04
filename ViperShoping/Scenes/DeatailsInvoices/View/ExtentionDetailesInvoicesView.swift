//
//  ExtentionDetailesInvoicesView.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 9/8/2024.
//

import UIKit

extension DetailesInvoicesViewController : UITableViewDelegate , UITableViewDataSource {
   
    // MARK: - Methods
      func numberOfSectionsInTableView(tableView: UITableView) -> Int {
          return presenter?.DetailsInvoice.count ?? 0
      }
   
       func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return presenter?.DetailsInvoice.count ?? 0
       }
 
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return presenter?.DetailsInvoice.count ?? 0
       }
   
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = DetailesInvoiceTableView.dequeueReusableCell(withIdentifier:"DetailesInvoicesCell", for: indexPath) as! DetailesInvoicesCell
           cell.configure(with: presenter?.DetailsInvoice[indexPath.row])
            return cell
        }
}
