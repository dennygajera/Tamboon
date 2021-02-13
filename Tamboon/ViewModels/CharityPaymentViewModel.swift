//
//  CharitiesViewModel.swift
//  Tamboon
//
//  Created by Darshan Gajera on 12/02/21.
//



import UIKit

class CharityPaymentViewModel {
    var objOmiseCardToken: OmiseCardToken?
    func apiGenerateTokenCode(dicParam: [String: Any], completion :@escaping (_ isSuccess : Bool?) -> Void) {
        ServiceManager.shared.request(httpMethod: HttpMethod.post, parameterDict: dicParam, URL: API.omiseGenerateToken.rawValue) { (dicResponse, error) in
            do {
                if dicResponse != nil {
                    self.objOmiseCardToken = try JSONDecoder().decode(OmiseCardToken.self, from: (dicResponse!.dataReturn(isParseDirect: false))!)
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
    
    func apiCreateCharge(dicParam: [String: Any], completion :@escaping (_ isSuccess : Bool?) -> Void) {
        ServiceManager.shared.request(httpMethod: .post, parameterDict: dicParam, URL: API.donation.URL) { (dicResponse, err) in
            if dicResponse != nil {
                if ((dicResponse?.value(forKey: "data") as! NSDictionary).value(forKey: "success") as! Bool) == true {
                    completion(true)
                } else {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }
    }
}



