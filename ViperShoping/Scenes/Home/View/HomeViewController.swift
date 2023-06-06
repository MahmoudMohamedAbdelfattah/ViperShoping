//
//  HomeViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 04/07/2023.
//

import UIKit

class HomeViewController: UIViewController , HomeViewProtocol {
  
 // MARK: - IBOutlets
    @IBOutlet weak var slidMenuImage: UIImageView!
    @IBOutlet weak var stackCollectionBanner: UIStackView!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var productHomeTableView: UITableView!{
        didSet {
            productHomeTableView.delegate = self
            productHomeTableView.dataSource = self
            productHomeTableView.register(UINib(nibName: "ProductHomeCell", bundle: nil), forCellReuseIdentifier: "ProductHomeCell")
        }
    }
    @IBOutlet weak var bannerHomeCollection: UICollectionView!{
        didSet {
            bannerHomeCollection.delegate = self
            bannerHomeCollection.dataSource = self
            bannerHomeCollection?.register(UINib(nibName: "HomeBannerCell", bundle: nil), forCellWithReuseIdentifier: "cellBanner")
        }
    }
    
     // MARK: - Properties
    var presenter: HomePresenterProtocol?
    private var timer = Timer()
    private var counter = 0
 
 // MARK: - Methods
     override func viewDidLoad() {
        super.viewDidLoad()
 
           uiTapGesture()
        presenter?.viewDidLoad()
        stackCollectionBanner.addViewBorder(borderColor: UIColor.orange.cgColor, borderWith: 3, borderCornerRadius: 10)
        productHomeTableView.addViewBorder(borderColor: UIColor.orange.cgColor, borderWith: 3, borderCornerRadius: 10)
      }
    
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)

         DispatchQueue.main.async {
            Component.shared.basicAnimations(Image: self.imageLogo)
         }
     }
    
     func updatePageControl(count: Int) {
            self.pageController?.currentPage = 0
            self.pageController?.numberOfPages = count
            self.pageController.currentPageIndicatorTintColor = .orange
            self.pageController.backgroundColor = .clear
            self.pageController.pageIndicatorTintColor = .gray
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.ChangAutoCollectionCell), userInfo: nil, repeats: true)
     }
     
     @objc func ChangAutoCollectionCell ()
     {
         if counter < presenter?.allBanner?.count ?? 0 {
             let index = IndexPath.init(item: counter, section: 0)
             self.bannerHomeCollection?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
             pageController?.currentPage = counter
             counter += 1
         } else {
             counter = 0
             let index = IndexPath.init(item: counter, section: 0)
             self.bannerHomeCollection?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
             pageController?.currentPage = counter
         }
      }

    func reloadView() {
         DispatchQueue.main.async {
            self.bannerHomeCollection.reloadData()
            self.productHomeTableView.reloadData()
       }
    }
    
    func  uiTapGesture() {
        let tapGesturDecreser = UITapGestureRecognizer(target: self, action: #selector(imageTappedDecrese))
        slidMenuImage.isUserInteractionEnabled = true
        slidMenuImage.addGestureRecognizer(tapGesturDecreser)
    }
    
    @objc func imageTappedDecrese() {
 
        presenter?.routeToView(view: SlidMenuWireFrame.assembleModule(token: Component.shared.getApiToken() ?? ""))
               }
         }
 
 
extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return presenter?.allProductHome?.count ?? 0
     }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = productHomeTableView.dequeueReusableCell(withIdentifier:"ProductHomeCell", for: indexPath) as! ProductHomeCell
            cell.configure(with:presenter?.allProductHome?[indexPath.row])
            return cell
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 400
    }
 }
