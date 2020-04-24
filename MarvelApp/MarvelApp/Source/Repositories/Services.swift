//
//  Services.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 16/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit
import Alamofire
import CommonCrypto

class Services {
    
    private let publicKey: String = "8985078ece7a68ca10e6535f6466363e"
    private let privateKey: String = "785226774eff1379794c0d74cc321af518b69c23"
    
    fileprivate var baseUrl = ""
    
    init (baseUrl: String){
        self.baseUrl = baseUrl
    }

    func getNameCharactersFrom(endPoint:String, callback: @escaping (_ listCharactersView: DataCharacter?, _ status: Bool, _ message:String) -> Void) {
        
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash =  md5("\(timestamp)\(privateKey)\(publicKey)") ?? ""
       
        let parameters = ["hash": hash,
                          "apikey": publicKey,
                          "ts": timestamp] as [String : Any]
        
        
        Alamofire.request(self.baseUrl + endPoint, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response {
            (responseData) in
            guard let data = responseData.data else {
                return
            }
            do {
                
                if let json = try JSONSerialization.jsonObject(with:data, options: []) as? [String:Any] {
                    if let jsonResult = json["data"]  as? [String: Any] {
                        let p = DataCharacter.init(json: jsonResult)
                        callback(p, true, "")
                    }
                } else {
                    callback(nil, false, "Error en el json")
                }
                
            } catch {
                callback(nil, false, error.localizedDescription)
            }
        }

    }
    
    func getCharacterFrom(endPoint:String, callback: @escaping (_ listCharactersView: ListCharacter?, _ status: Bool, _ message:String) -> Void){
        
         let timestamp = "\(Date().timeIntervalSince1970)"
         let hash =  md5("\(timestamp)\(privateKey)\(publicKey)") ?? ""
               
        let parameters = ["hash": hash,
                          "apikey": publicKey,
                          "ts": timestamp] as [String : Any]
                
                
        Alamofire.request(self.baseUrl + endPoint, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response {
            (responseData) in
            print ("We got the response of character")
            guard let data = responseData.data else {
                    return
            }
            do {
                        
                if let json = try JSONSerialization.jsonObject(with:data, options: []) as? [String:Any] {
                    if let jsonResult = json["data"]  as? [String: Any] {
                        if let jsonCharacters = jsonResult["results"] as? [[String: Any]]  {
                            jsonCharacters.forEach { (list) in
                                let i = ListCharacter.init(json: list)
                                callback(i, true, "")
                                }
                            } else {
                                callback(nil, false, "Error en los datos de results")
                            }
                        }
                    } else {
                        callback(nil, false, "Error en los datos")
                    }
                        
                } catch {
                        print ("Error decoding == \(error)")
                        callback(nil, false, error.localizedDescription)
                }
            }
    }
}
    
private extension Services {
    
    func md5(_ string: String) -> String? {
        
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)
        if let d = string.data(using: String.Encoding.utf8) {
            _ = d.withUnsafeBytes { (body: UnsafePointer<UInt8>) in
                CC_MD5(body, CC_LONG(d.count), &digest)
            }
        }
        return (0..<length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }
}

