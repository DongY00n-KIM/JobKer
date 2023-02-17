//
//  BrandFetchVM.swift
//  JobKer
//
//  Created by Roy's Saxy MacBook on 2/16/23.
// 200, 404  // time exception toll, optional 200 받으면 바로 처리, 404는 처리 해야함. URL 이 없음. 422 -> 람다 expression
// 토큰 먼저 연결. 200이면 정상 처리, exception 처리 무조건 해야함 -> 앱 올릴려면.


import Foundation
import Alamofire

struct BrandFetchResponse : Decodable{
    var name : String
    var domain : String
    var claimed : Bool
    var description : String
    var links : [LinkElement]
    var logos : LogoElement
    var colors : [ColorElement]
    var fonts : [FontElement]
    var images : [ImageElement]
}

struct LinkElement : Codable{
    var name : String
    var url : String
}

struct LogoElement : Codable{
    var type : String
    var theme : String?
    var format : [FormatElement]
}

struct ColorElement : Codable{
    var hex : String
    var type : String
    var brightness : Int
}

struct FontElement : Codable{
    var name : String
    var type : String
    var origin : String
    var originId : Int
    var wieghts : [Int]
}

struct ImageElement : Codable {
    var type : String
    var formats : [FormatElement]
}

struct FormatElement : Codable {
    var src : String
    var background : String?
    var format : String
    var height : Int
    var width : Int
    var size : Int
}

class BrandFetchVM : ObservableObject{
    let baseURL : String = "https://api.brandfetch.io/v2/brands/"
    let com : String = ".com"
}
