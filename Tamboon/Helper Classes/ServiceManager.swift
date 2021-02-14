
//  Created by Darshan Gajera on 2/12/21.
//

import UIKit
import Alamofire

enum API : String {
    static let baseURL = "http://127.0.0.1:8080/"
    case omiseGenerateToken = "https://vault.omise.co/tokens"
    case charities = "charities"
    case donation = "donations"
    var URL : String {
        get{
            return API.baseURL + self.rawValue
        }
    }
}

enum HttpMethod {
    case get
    case post
}

class ServiceManager: NSObject {
    
    static let shared : ServiceManager = {
        let instance = ServiceManager()
        return instance
    }()
    
    func request(httpMethod: HttpMethod, parameterDict:[String : Any]?, URL aUrl: String, isLoader: Bool = true, isSuccessAlert: Bool = true , isFailureAlert: Bool = true, block: @escaping (NSDictionary?, NSError?) -> Void) {
        if Reachability.Connection.self != .none {
            if isLoader {
                LoadingView.startLoading()
            }
            #if DEBUG
                print("URL: \(aUrl)")
                print("Param: \(parameterDict ?? [:])")
            #endif
            // HEADER
            var header: [String: String]?
            var user = ""
            var password = ""
            if aUrl == API.omiseGenerateToken.rawValue {
                user = OmiseKeys.publicKey
                password = OmiseKeys.publicKey
            } else {
                header = ["Content-Type": "application/json"]
            }
            if user != "" {
                let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
                let base64Credentials = credentialData.base64EncodedString(options: [])
                    header = ["Authorization": "Basic \(base64Credentials)"]
            }
            
            // ENCODING
            let encoding: ParameterEncoding?
            if aUrl == API.omiseGenerateToken.rawValue {
                encoding = URLEncoding.default
            } else {
                encoding = JSONEncoding.default
            }
            
            // REQUEST
            Alamofire.request(aUrl, method: httpMethod == HttpMethod.get ? .get : .post , parameters: parameterDict == nil ? nil : parameterDict!, encoding: encoding!, headers: header).responseJSON {
                response in
                switch response.result {
                case .success:
                    do {
                        if isLoader {
                            LoadingView.stopLoading()
                        }
                        let statusCode = response.response?.statusCode
                        if statusCode == 200 {
                          if let result = response.result.value {
                            #if DEBUG
                                print(result)
                            #endif
                               
                            if result is NSArray {
                                block((["data": result] as NSDictionary), nil)
                            } else {
                                block((["data": result] as NSDictionary), nil)
                            }
                          }
                        } else if statusCode == 400 {
                            let result = response.result.value as! NSDictionary
                            let object = (result.value(forKey: "object") as? String) ?? ""
                            let errMsg = (result.value(forKey: "message") as? String)
                            if object == "error" {
                                SnackBar.show(strMessage: errMsg!, type: .negative)
                            }
                            block(nil, nil)
                        } else if statusCode == 404 {
                            
                        } else if statusCode == 403 || statusCode == 401 {
                            
                        } else if statusCode == 500 {
                            
                        }
                    }
                    break
                case .failure(let error):
                    #if DEBUG
                        print("Error : ",error)
                    #endif
                    block(nil, nil)
                    if isLoader {
                     LoadingView.stopLoading()
                    }
                }
            }
        }
    }
    
}

extension URL {
    /// Creates an NSURL with url-encoded parameters.
    init?(string : String, parameters : [String : String]) {
        guard var components = URLComponents(string: string) else { return nil }
        components.queryItems = parameters.map { return URLQueryItem(name: $0, value: $1) }
        guard let url = components.url else { return nil }
        // Kinda redundant, but we need to call init.
        self.init(string: url.absoluteString)
    }
}
   
