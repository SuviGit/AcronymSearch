//
//  NetworkService.swift
//  AcronymSearch
//
//  Created by Suvidha Nakhawa on 6/5/22.
//

import Foundation
import Alamofire

class NetworkService{
    
    fileprivate var baseUrl:String = "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf="
    
    var urlStr :String{
        didSet{
            self.urlStr = self.baseUrl.appending(self.urlStr)
        }
    }

    init(_ url:String){
        self.urlStr = url
    }
    
    
    
    func sendRequest(abbreviation abb:String) -> String{
        let urlString = self.baseUrl + abb
        return urlString
    }
    
    
    func getResponse(completion completionhandler:@escaping([Acronym]) -> Void){
        
        AF.request(self.urlStr).responseDecodable(of:[Acronym].self) { data in
            guard let response = data.value else{return}
            
            completionhandler(response)
 
        }
        
    }
}
