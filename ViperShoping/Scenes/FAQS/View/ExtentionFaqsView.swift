//
//  ExtentionFaqsView.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2024.
//

import UIKit

extension FaqsViewController : UITableViewDelegate , UITableViewDataSource {
  
        // MARK: - Methods UITableViewDataSource
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                     return presenter?.allQuestion?.count ?? 0
             }
    
             func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                     let cell = faqsTableView.dequeueReusableCell(withIdentifier:"faqsCell", for: indexPath) as! faqsCell
                    cell.configure(with:presenter?.allQuestion?[indexPath.row])
                 
             
                    return cell
            }
            
             func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                    return 200
            }
 }
