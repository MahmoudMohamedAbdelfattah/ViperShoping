//
//  SlidMenuViewRemoteDataManger.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/09/2024.
//

import Foundation
 
class SlidMenuRemoteDataManager: SlidMenuViewRemoteDataManagerInputProtocol{
 
// MARK: - Properties
    var remoteRequestHandler: SlidMenuViewRemoteDataManagerOutputProtocol?

// MARK: - Methods
    func postInfoRequest(token: String) {
         NetworkManager.shared.fetchData(T: .profile(Content_Type:  NetworkManager.shared.contentType , lang: LanguageHandler.currentLanguage().rawValue , Authorization: token ), showIndectore: true, responseClass: InformationPersonal.self) { data, error in
             if data?.status == true {
                self.remoteRequestHandler?.signInSucess(data: data ?? InformationPersonal())
             
            } else {
                self.remoteRequestHandler?.messageError(message: data?.message ?? "")

            }
        }
    }
  }
