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
    
    
    
    func fetchData(){
     
        network.getResponse { data in
            
            self.acronyms.value = data

        }
    }
   
}
