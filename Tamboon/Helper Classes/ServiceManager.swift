
//  Created by Darshan Gajera on 2/12/21.
//

import UIKit
import RxAlamofire
import RxSwift
import RxCocoa
import Reachability

enum API : String {
    static let BaseURL = "http://127.0.0.1:8080/"
    
    case charities = "charities"
    case donation = "donations"
    
    var URL : String {
        get{
            return API.BaseURL + self.rawValue
        }
    }
}

class ServiceManager: NSObject {
    let disposeBag = DisposeBag()
    static let sharedInstance : ServiceManager = {
        let instance = ServiceManager()
        return instance
    }()
    
    func postRequest(parameterDict: [String: Any], URL aUrl: String, isLoader: Bool = true, isSuccessAlert: Bool = false, isFailureAlert: Bool = true, block: @escaping (NSDictionary?, NSError?) -> Void) {
            print("URL: \(aUrl)")
            print("Param: \(parameterDict)")

            if Reachability.Connection.self != .none {
                if isLoader {
                    LoadingView.startLoading()
                }
                var header: [String: String]?
                header = ["Content-Type": "application/x-www-form-urlencoded"]
               
                RxAlamofire.requestJSON(.post,aUrl, parameters: parameterDict, headers:header)
                    .debug()
                    .subscribe(onNext: { (r, json) in
                        do {
                            if isLoader {
                                LoadingView.stopLoading()
                            }
                            if r.statusCode == 200 {
                                let dicData = json as! NSDictionary
                                print("response:\(dicData)")
                                if let error = dicData.value(forKey: "errors") as? NSArray {
                                    if error.count > 0 {
                                        let msg = (error.firstObject as! NSDictionary).value(forKey: "msg") as! String
                                        SnackBar.show(strMessage: msg, type: .negative)
                                    }
                                } else {
                                    let status: Bool = dicData.value(forKey: "status") as! Bool
                                    if status {
                                        if isSuccessAlert {
                                            if dicData.value(forKey: "msg") != nil {
                                                SnackBar.show(strMessage: dicData.value(forKey: "msg") as! String, type: .positive)
                                            }
                                        }
                                        block(dicData, nil)
                                    } else {
                                        if isFailureAlert {
                                            SnackBar.show(strMessage: dicData.value(forKey: "msg") as! String, type: .negative)
                                        } else {
                                            block(nil, nil)
                                        }
                                    }
                                }
                            } else if r.statusCode == 404 {
                                
                            } else if r.statusCode == 403 || r.statusCode == 401 {
                                
                            } else if r.statusCode == 500 {
                                
                            }
                        }
                    }, onError: {(error) in
                        LoadingView.stopLoading()
                        SnackBar.show(strMessage: error.localizedDescription, type: .negative)
                    })
                    .disposed(by: disposeBag)
            }
        }
    
    func getRequest(parameterDict:[String : Any], URL aUrl: String, isLoader: Bool = true, isSuccessAlert: Bool = true , isFailureAlert: Bool = true, block: @escaping (NSDictionary?, NSError?) -> Void) {
        if Reachability.Connection.self != .none {
             print("URL: \(aUrl)")
             print("Param: \(parameterDict)")
            if Reachability.Connection.self != .none {
                if isLoader {
                    LoadingView.startLoading()
                }
                RxAlamofire.requestJSON(.get,aUrl, headers:nil)
                    .debug()
                    .subscribe(onNext: { (r, json) in
                        do {
                            LoadingView.stopLoading()
                            if r.statusCode == 200 {
                                let dicData = json as! NSDictionary
                                block(dicData, nil)
                            } else if r.statusCode == 404 {
                                
                            } else if r.statusCode == 403 || r.statusCode == 401 {
                                
                            } else if r.statusCode == 500 {
                                
                            } else {
                                
                            }
                        }
                    }, onError: {(error) in
                        LoadingView.stopLoading()
                    })
                    .disposed(by: disposeBag)
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
   
