//
//  RequestService.swift
//  client
//
//  Created by Quân on 11/22/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import Foundation
import Alamofire

typealias CompletionHandler = (_ isSuccess: Bool)->Void
typealias CompletionHandlerJSON = (_ isSuccess: Bool, _ json: Any?, _ error: Error?)->Void

struct RequestService {
    
    static let shared = RequestService()
    
    func requestWith<T: Codable> (_ url: String, _ method: HTTPMethod, _ param: [String:Any]?, _ encode: ParameterEncoding, _ header: [String:String]?, _ objectType: T.Type, _ complete:@escaping CompletionHandlerJSON){
        Alamofire.request(url,
                          method: method,
                          parameters: param,
                          encoding: encode,
                          headers: header).responseJSON { (response) in
                            switch response.result {
                            case .success:
                                do {
                                    let model = try JSONDecoder.init().decode(objectType, from: response.data!)
                                    complete(true,model,nil)
                                }catch let err {
                                    print(err.localizedDescription)
                                    complete(false,nil,err)
                                }
                            case .failure(let error):
                                print(error.localizedDescription)
                                complete(false,response,nil)
                            }
        }
    }
    
    func upload<T: Codable> (_ url: String, _ objectType: T.Type, _ dataImages: [Dictionary<String,Any>]?, _ complete:@escaping CompletionHandlerJSON ) {
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            if let dataImages = dataImages {
                for dict in dataImages {
                    guard let key:String = dict["key"] as? String,
                        let value:Data = dict["value"] as? Data else {return}
                    multipartFormData.append(value, withName: key, fileName: "image-\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpeg")
                }
            }
        
        }, to: url) { (encodingResult) in
            switch encodingResult {
            case .success(let upload,_,_):
                //
                print(upload)
                upload.responseJSON { (response) in
                    switch response.result {
                    case .success:
                        print("JSON")
                        do {
                            let json = try JSONDecoder.init().decode(objectType, from: response.data!)
                            complete(true,json,nil)
                        }catch let err {
                            print(err.localizedDescription)
                            complete(false,response.data,err)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
