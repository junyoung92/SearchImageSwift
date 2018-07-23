//
//  Image.swift
//  SearchImageSwift
//
//  Created by Kiljunyoung on 2018. 7. 23..
//  Copyright © 2018년 jy. All rights reserved.
//

import Foundation
import ObjectMapper

class Image:Mappable {
    
    var items:[ImageResult]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
    
    
}
