//
//  Const.swift
//  SearchImageSwift
//
//  Created by Kiljunyoung on 2018. 7. 23..
//  Copyright © 2018년 jy. All rights reserved.
//
class Const {
    
    static let clientId = "23ne7l0I8NJ2UurvtSrb"
    static let clientSecret = "eGaqBYowql"
    
    static func SEARCH(_ text:String) -> String {
        return "https://openapi.naver.com/v1/search/image?query=\(text)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}

