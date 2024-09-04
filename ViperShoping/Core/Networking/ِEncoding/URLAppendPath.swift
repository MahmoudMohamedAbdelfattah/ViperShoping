//
//  URLAppendPath.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/06/2024.
//

import Foundation


public struct URLappendPath {
    
    
    public func appendIDToURL(urlRequest: inout URLRequest, id: Int) throws{
          guard let url = urlRequest.url else { return }

          // تحويل الـ URL إلى URLComponents
          var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)

          // الحصول على المسار الحالي من الـ URL
          var path = urlComponents?.path ?? ""

          // إضافة الـ ID كجزء من المسار
          path = path.trimmingCharacters(in: .whitespacesAndNewlines) + "/\(id)"

          // تحديث المسار الجديد في URLComponents
          urlComponents?.path = path

          // تعيين الـ URL الجديد إلى الـ URLRequest
          urlRequest.url = urlComponents?.url

          // تعيين رأس Content-Type إذا لم يكن موجودًا بالفعل
          if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
              urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
          }
      }
    
    
}
