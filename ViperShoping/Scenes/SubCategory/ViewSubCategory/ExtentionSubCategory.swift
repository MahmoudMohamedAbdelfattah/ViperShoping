//
//  ExtentionSubCategory.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/09/2024.
//

import UIKit
 
extension SubCategoryViewController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.allProductCategoryDetails?.images?.count ?? 0
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"SubCategoryViewCell", for: indexPath) as! SubCategoryViewCell
         cell.configure(with: presenter?.allProductCategoryDetails?.images?[indexPath.row] ?? "")
            return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = subCategoryImageCollection.frame.size.width
        let hight = subCategoryImageCollection.frame.size.height
        return CGSize(width: width, height: hight)
     } 
}
