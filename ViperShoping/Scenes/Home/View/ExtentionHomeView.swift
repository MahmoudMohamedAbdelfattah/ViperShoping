//
//  ExtentionHomeView.swift
//  ViperShoping
//
//  Created by Mahmoud on 16/07/2023.
//

import UIKit

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return presenter?.allBanner?.count ?? 0
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cellBanner", for:   indexPath) as! HomeBannerCell
             cell.configure(with:presenter?.allBanner?[indexPath.row])
                return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = bannerHomeCollection.frame.size.width
        let hight = bannerHomeCollection.frame.size.height
        return CGSize(width: width, height: hight)
     }
    
      func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageController.currentPage = Int( x / view.frame.width)

    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        coordinator.animate(alongsideTransition: { (_) in
         //   self.collectionViewLayout.invalidateLayout()
            if self.pageController.currentPage ==  0 {
                self.bannerHomeCollection.contentOffset = .zero
            }else {
                let indexpath = IndexPath(item: self.pageController.currentPage, section: 0)
                self.bannerHomeCollection.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            }
         }) { (_) in

        }
    }
}
