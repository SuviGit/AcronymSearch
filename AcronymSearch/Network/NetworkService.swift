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
    
    func sendRequest(abbreviation abb:String) -> String{
        let urlString = self.baseUrl + abb
        return urlString
    }
    
    func getResponse(completion completionhandler:@escaping([Acronym]) -> Void){
        
        let url = self.sendRequest(abbreviation: "ABB")
    
        
        AF.request(url).responseDecodable(of:[Acronym].self) { data in
            guard let response = data.value else{return}
           // print(response.count)
            
            completionhandler(response)
            
            
//            guard let responseData = response[0].longForm[0].lf else{return}
//            
//            print(responseData)
        }
        
    }
}
