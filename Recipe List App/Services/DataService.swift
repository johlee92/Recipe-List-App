//
//  DataService.swift
//  Recipe List App
//
//  Created by Johnathan Lee on 4/4/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if pathSTring is not nil, otherwise does something...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //create data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                
                for r in recipeData {
                    r.id = UUID()
                    
                    //add unique IDs to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // return the recipes
                return recipeData
            } catch {
                
                print(error)
                
            }
        } catch {
            print(error)
        }
        
        //return an empty array of recipes
        return [Recipe]()
    }
}
