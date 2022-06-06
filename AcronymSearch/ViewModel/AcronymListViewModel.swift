//
//  AcronymListViewModel.swift
//  AcronymSearch
//
//  Created by Suvidha Nakhawa on 6/6/22.
//

import Foundation

class AcronymListViewModel{
    
    var acronyms:Observable<[Acronym]> = Observable([])
    
    let network = NetworkService("")
    
    
    
    func fetchData(abb:String){
        network.urlStr = abb
        
        network.getResponse { data in
            
            self.acronyms.value = data

        }
    }
   
}
