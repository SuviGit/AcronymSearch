//
//  AcronymListViewModel.swift
//  AcronymSearch
//
//  Created by Suvidha Nakhawa on 6/6/22.
//

import Foundation

class AcronymViewModel{
    
    var acronyms:Observable<[Acronym]> = Observable([])
    let network = NetworkService()
    
    func fetchData(abb:String){
        network.getResponse(abb: abb) { data in
            self.acronyms.value = data
        }   
    }   
}
