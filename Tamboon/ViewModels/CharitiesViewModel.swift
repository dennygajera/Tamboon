//
//  CharitiesViewModel.swift
//  Tamboon
//
//  Created by Darshan Gajera on 12/02/21.
//



import UIKit

class CharitiesViewModel {
    var charities: [Charity]!
    func apiGetAllCharity(completion :@escaping (_ isSuccess : Bool?) -> Void) {
        ServiceManager.shared.request(httpMethod: .get, parameterDict: nil, URL: API.charities.URL) { (dicResponse, error) in
            do {
                if dicResponse != nil {
                    self.charities = try JSONDecoder().decode([Charity].self, from: (dicResponse!.dataReturn(isParseDirect: false))!)
                    completion(true)
                } else {
                    completion(false)
                }
            } catch let err {
                print("Err", err)
                completion(false)
            }
        }
    }
}



