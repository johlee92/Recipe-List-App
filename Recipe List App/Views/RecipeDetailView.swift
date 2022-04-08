//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Johnathan Lee on 4/6/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack (alignment:.leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .leading, .bottom], 5)
                    
                    ForEach (recipe.ingredients, id:\.self) {
                        it in
                        Text("- " + it)
    //                        .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                    
                // MARK: Divider
                Divider()
                            
                // MARK: Directions
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach (0..<recipe.directions.count, id:\.self) {
                        indexDirection in
                        Text(String(indexDirection + 1) + " - " + recipe.directions[indexDirection])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy for preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
