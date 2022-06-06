//
//  Acronym.swift
//  AcronymSearch
//
//  Created by Suvidha Nakhawa on 6/5/22.
//

import Foundation

struct Acronym:Decodable{
    
    var shortForm:String?
    var longForms:[LongForms]

    
    enum CodingKeys:String, CodingKey{
        case shortForm = "sf"
        case longForms = "lfs"

    }
}


struct LongForms: Decodable{
    var lf:String?
    var frequency:Int?
    var since:Int?
    
    
    enum CodingKeys:String, CodingKey{
        case lf = "lf"
        case frequency = "freq"
        case since = "since"
    }
}
