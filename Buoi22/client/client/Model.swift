//
//  Model.swift
//  client
//
//  Created by Quân on 11/22/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import Foundation

struct BaseResponse: Codable {
    var result: Bool
    var message: String
    var code:Int
}

struct BaseUpload: Codable {
    var result: Bool
    var message: String
    var code:Int
    var data:[Image]
}

public struct Image: Codable {

        public var destination : String?
        public var encoding : String?
        public var fieldname : String?
        public var filename : String?
        public var mimetype : String?
        public var originalname : String?
        public var path : String?
        public var size : Int?
        
}

struct UploadResponse: Codable {
    var result: Bool
}
