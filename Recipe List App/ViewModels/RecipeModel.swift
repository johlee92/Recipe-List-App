//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Johnathan Lee on 4/4/22.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // create an instance of data service and get the data
        
//        let service = DataService()
//        self.recipes = service.getLocalData()
        
        self.recipes = DataService.getLocalData()
        
    }
}
