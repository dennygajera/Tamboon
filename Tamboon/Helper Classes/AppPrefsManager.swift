//
//  AppPrefsManager.swift
//
//  Created by Darshan Gajera on 2/12/21.
//

import UIKit
import CoreLocation
class AppPrefsManager: NSObject {
    
    static let sharedInstance = AppPrefsManager()
    let TOKEN = "token"
    let APNSTOKEN = "APNSToken"
    let JWTTOKEN = "jwttoken"
    let CURRENTLAT = "CURRENTLAT"
    let CURRENTLONG = "CURRENTLONG"
    
    func setDataToPreference(data: AnyObject, forKey key: String) {
        do {
            var archivedData = Data()
            if #available(iOS 11.0, *) {
                archivedData = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: true)
            } else {
                archivedData = NSKeyedArchiver.archivedData(withRootObject: data)
            }
            UserDefaults.standard.set(archivedData, forKey: key)
            UserDefaults.standard.synchronize()
        }
        catch {
            print("Unexpected error: \(error).")
        }
    }
    
    func getDataFromPreference(key: String) -> AnyObject? {
        let archivedData = UserDefaults.standard.object(forKey: key)
        if(archivedData != nil) {
            do {
                var unArchivedData: Any?
                if #available(iOS 11.0, *) {
                    unArchivedData =  try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(archivedData as! Data) as AnyObject
                } else {
                    unArchivedData = NSKeyedUnarchiver.unarchiveObject(with: archivedData as! Data) as AnyObject
                }
                return unArchivedData as AnyObject
            } catch {
                print("Unexpected error: \(error).")
            }
        }
        return nil
    }
    
    func removeDataFromPreference(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func isKeyExistInPreference(key: String) -> Bool {
        if(UserDefaults.standard.object(forKey: key) == nil) {
            return false
        }
        return true
    }
    
    func setAPNsToken(obj: AnyObject) {
        setDataToPreference(data: obj as AnyObject, forKey: APNSTOKEN)
    }
    
    func getAPNsToken() -> String? {
        let strToken = getDataFromPreference(key: APNSTOKEN)
        return strToken as? String
    }
    
    func setToken(obj: AnyObject) {
        setDataToPreference(data: obj as AnyObject, forKey: TOKEN)
    }
    
    func getToken() -> String? {
        let strToken = getDataFromPreference(key: TOKEN)
        return strToken as? String
    }
    
    func setCurrentLat(obj: String) {
        setDataToPreference(data: obj as AnyObject, forKey: CURRENTLAT)
    }
    
    func getCurrentLat() -> String? {
        let strToken = getDataFromPreference(key: CURRENTLAT)
        return strToken as? String
    }
    
    func setCurrentLong(obj: String) {
        setDataToPreference(data: obj as AnyObject, forKey: CURRENTLONG)
    }
    
    func getCurrentLong() -> String? {
        let strToken = getDataFromPreference(key: CURRENTLONG)
        return strToken as? String
    }
    
    // JWT Token
    func setJWTToken(obj: AnyObject) {
        setDataToPreference(data: obj as AnyObject, forKey: JWTTOKEN)
    }
    
    func getJWTToken() -> String? {
        let strToken = getDataFromPreference(key: JWTTOKEN)
        return strToken as? String
    }
}
