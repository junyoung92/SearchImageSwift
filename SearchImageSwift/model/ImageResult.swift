//
//  ImageResult.swift
//  SearchImageSwift
//
//  Created by Kiljunyoung on 2018. 7. 23..
//  Copyright © 2018년 jy. All rights reserved.
//

import Foundation
import ObjectMapper

class ImageResult:Mappable {
    var link:String?
    var sizeheight:Int?
    var sizewidth:Int?
    var thumbnail:String?
    var title:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        link <- map["link"]
        sizeheight <- map["sizeheight"]
        sizewidth <- map["sizewidth"]
        thumbnail <- map["thumbnail"]
        title <- map["title"]
    }
    
    
}
