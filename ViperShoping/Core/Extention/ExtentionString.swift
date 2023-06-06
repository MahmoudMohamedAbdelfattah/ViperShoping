//
//  ExtentionString.swift
//  ViperShoping
//
//  Created by Mahmoud on 05/09/2023.
//

import Foundation

extension String {
    var trimmend : String {
        return self.trimmingCharacters(in: .whitespaces)
        
    }
 
    var isPhoneNumber:Bool{
        do{let detctor=try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let match = detctor.matches(in: self, options: [], range: NSMakeRange(0, self.count))
              if let res=match.first{return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && (self.count >= 8 && self.count <= 15)}else{return false}
            }catch{
                return false
                
                }
            }
 }
