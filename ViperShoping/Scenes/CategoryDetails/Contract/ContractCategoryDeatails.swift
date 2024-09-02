//
//  ContractCategoryDeatails.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/07/2023.
//

 
import UIKit
import CoreData
     protocol CategoryDetailsViewProtocol :AnyObject {
        // MARK: - Variables
               var presenter : CategoryDeatailsPresenterProtocol? {get set}
        // MARK: - Functions
               func totalQuntityAndPrice(totalQuntity:Int?,totalPrice:Double?)
               func reloadView()
         }
     protocol CategoryDeatailsPresenterProtocol : AnyObject{
       // MARK: - Variables
               var view : CategoryDetailsViewProtocol? {get set}
               var wireframe : CategoryDetailsWireFrameProtocol? {get set}
               var interactor : CategoryDetailsInteractorInputProtocol?{get set}
               var allProductCategoryDetails : [CategoryDataDetials]? {get set}
               var chooseFavoriteID :[Int]? { get  }
               var purchasedProducts : [CategoryDataDetials]? {get set}
               var searchProduct : [CategoryDataDetials]? {get set}
      // MARK: - Functions
               func routDataById(id:Int)
               func searchProduct(text:String?)
                func saveProduct(data:   CategoryDataDetials,kind:CoreDataManager.entityNameCoreData)
                func saveInvoiceCoreData(product: CategoryDataDetials, context: NSManagedObjectContext)
                func deletIdProductFromInvoice(productID: Int64, context: NSManagedObjectContext)
                func PostupdateProductQuantityFromInvoice(productID: Int64, newQuantity: Int, context: NSManagedObjectContext)
               func favoriteIdCoreData()
                func deleteIdProduct(id:Int,entityName:CoreDataManager.entityNameCoreData)
               func routeToCartScreen()
               func postClearCurrentInvoice()
         }

    protocol CategoryDetailsInteractorInputProtocol : AnyObject {
        // MARK: - Variables
            var outPut: CategoryDeatailsInteractorOutputProtocol? { get set }
            var remoteDataManager: CategoryDetailsViewRemoteDataManagerInputProtocol?{ get set }
            var localDataManger : CategoryDetailsViewLocaleDataManagerInputProtocol?{ get set }
       // MARK: - Functions
            func getData(id : Int)
            func searchProduct(text:String)
            func getIdFavorite()
            func postSaveProductCoreData(data: CategoryDataDetials,type:CoreDataManager.entityNameCoreData )
            func deleteIdProduct(id:Int,entityName:CoreDataManager.entityNameCoreData)
            func postSaveInvoiceCoreData(product: CategoryDataDetials, context: NSManagedObjectContext)
            func getOrCreateInvoice(context:NSManagedObjectContext)
            func PostdeletIdProductFromInvoice(productID: Int64, context: NSManagedObjectContext)
            func updateProductQuantityFromInvoice(productID: Int64, newQuantity: Int, context: NSManagedObjectContext)
            func clearCurrentInvoice()
        }
    
    protocol CategoryDetailsViewRemoteDataManagerInputProtocol: AnyObject{
         // MARK: - Variables
                var remoteRequestHandler:  CategoryDetailsViewRemoteDataManagerOutputProtocol? { get set }
        // MARK: - Functions
                func postIDProduct(id : Int)
                func postSearch(text:String)
                func postSaveProductCoreData(data: CategoryDataDetials , type: CoreDataManager.entityNameCoreData )
                func deleteIdProduct(id:Int,entityName:CoreDataManager.entityNameCoreData)
        }

    protocol  CategoryDetailsViewRemoteDataManagerOutputProtocol: AnyObject{
         // MARK: - Functions
                func getDataSuccessfully(loginModel: CategoriesDeatial?)
                func sucessfullSearch(loginModel: CategoriesDeatial?)
                func getFetchingFailed(message: String)
        }

    protocol  CategoryDetailsViewLocaleDataManagerInputProtocol: AnyObject{
        // MARK: - Variables
                 var localRequestHandler:  CategoryDetailsViewLocaleDataManagerOutputProtocol? { get set }
                var currentInvoiceID: String?{get set}
                var  currentInvoiceIDKey : String?{get set}
        
        // MARK: - Functions
                func favoriteIdCoreData()
                func SaveInvoiceCoreData(product: CategoryDataDetials, context: NSManagedObjectContext)
                func PostgetOrCreateInvoice(context: NSManagedObjectContext) -> Invoice
                func PostfetchInvoice(byID id: String, context: NSManagedObjectContext) -> Invoice?
                func deletIdProductFromInvoiceCoreData(productID: Int64, context: NSManagedObjectContext)
                func updateProductQuantityFromInvoice(productID: Int64, newQuantity: Int, context: NSManagedObjectContext)
                func clearCurrentInvoice()
        }

protocol  CategoryDetailsViewLocaleDataManagerOutputProtocol: AnyObject{
                // MARK: - Functions
                func favoriteId(id:[Int]?)
                func deleteIdProduct(id:Int,entityName:CoreDataManager.entityNameCoreData)
                func SuccessfullyCartProduct(data: [CategoryDataDetials])
                func updateInvoiceTotal(context: NSManagedObjectContext)
                func deleteCurrentInvoice(context: NSManagedObjectContext)
    
}
 
   protocol CategoryDeatailsInteractorOutputProtocol: AnyObject {
        // MARK: - Functions
                func didLoginCompleted(data : CategoriesDeatial?)
                func searchCompleted(data : CategoriesDeatial?)
                func usersFetchingFailed(withError error: String)
                func getFavoriteId(favoriteId : [Int]?)
                func getCartProduct(productCart : [CategoryDataDetials])
                func favoriteIdIsSelected()
                func shoppingCart()
                func getTotalQuntityAndPrice(totalQuntity: Int, totalPrice: Double)
            
         }

    protocol CategoryDetailsWireFrameProtocol: AnyObject {
        // MARK: - Variables
                var viewController : UIViewController?{get set}
        // MARK: - Functions
                static func assembleModule(id:Int) -> UIViewController
                func presentToCart()
        }

    protocol ProductTableViewDelgate: AnyObject {
        // MARK: - Functions
            func reloadFavoriteCell(cell: UITableViewCell , isFavorite: Bool?, model :CategoryDataDetials? )
            func reloadCartCell(cell: UITableViewCell,isCart: Bool?, model:CategoryDataDetials? )
            func reloadCartQuntityCell(cell: UITableViewCell,quantity:Int? ,model:CategoryDataDetials?)
        }


