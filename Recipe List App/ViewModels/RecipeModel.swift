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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        let newUnit = ingredient.unit ?? ""

        if ingredient.num == nil {
            return newUnit
        }

        var newDen = ingredient.den ?? 1
        var newNum = ingredient.num ?? 1


        newDen = newDen * recipeServings
        newNum = newNum * targetServings


        if newNum/newDen>1 && newNum%newDen==0 {
            return "\(newNum/newDen) \(newUnit)s"
        } else if (newNum/newDen>0 && newNum%newDen>0) {
            return "\(newNum/newDen) \(newNum%newDen)/\(newDen) \(newUnit)s"
        } else if (newNum/newDen == 1) {
            return "1 \(newUnit)"
        }

        return "\(newNum%newDen)/\(newDen) \(newUnit)"
        
//        return String(recipeServings)
    }
}
