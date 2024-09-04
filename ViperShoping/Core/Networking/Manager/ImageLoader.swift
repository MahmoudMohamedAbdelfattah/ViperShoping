//
//  ImageLoader.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/06/2024.
//

import UIKit
 
class ImageLoader {
    static let shared = ImageLoader()
    
    private let cache = NSCache<NSString, UIImage>()
    private let session = URLSession.shared
    
    private init() {
         cache.totalCostLimit = 10 * 1024 * 1024 // Limit the cache size to 50 MB
    }
    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
            return
        }
        
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  error == nil,
                  let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self?.cache.setObject(image, forKey: url.absoluteString as NSString, cost: data.count)
            completion(image)
        }
        task.resume()
    }
}

//
//class ImageCache {
//    static let shared = ImageCache()
//    private let cache = NSCache<NSString, UIImage>()
//
//    private init() {
//        cache.totalCostLimit = 10 * 1024 * 1024 // Limit the cache size to 50 MB
//    }
//
//    func getImage(for url: URL, completion: @escaping (UIImage?) -> Void) {
//        if let image = cache.object(forKey: url.absoluteString as NSString) {
//            completion(image)
//        } else {
//            DispatchQueue.global().async { [weak self] in
//                if let data = try? Data(contentsOf: url),
//                   let image = UIImage(data: data) {
//                    self?.cache.setObject(image, forKey: url.absoluteString as NSString, cost: data.count)
//                    completion(image)
//                } else {
//                    completion(nil)
//                }
//            }
//        }
//    }
//}
