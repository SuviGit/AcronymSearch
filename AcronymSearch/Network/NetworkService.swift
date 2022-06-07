//
//  NetworkService.swift
//  AcronymSearch
//
//  Created by Suvidha Nakhawa on 6/5/22.
//

import Foundation
import Alamofire

class NetworkService{
    
    fileprivate var baseUrl:String = ConfigValues.get().acronym_endpoint
    
    func getResponse(abb abbreviation:String, completion completionhandler:@escaping([Acronym]) -> Void){
        let endpoint = self.baseUrl.appending(abbreviation)
        
        AF.request(endpoint).responseDecodable(of:[Acronym].self) { data in
            guard let response = data.value else{return}
            completionhandler(response)
        }
    }
}
