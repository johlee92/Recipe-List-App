//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Johnathan Lee on 4/6/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
            VStack (alignment:.leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                // MARK: Serving Size Picker
                VStack(alignment:.leading) {
                    Text("Select your serving size:")
                        .padding(.top, 1)
                        .padding(.leading)
                    
                    Picker("", selection:$selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(.segmented)
                    .frame(width:160)
                    .padding(.leading)
                }
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .leading, .bottom], 5)
                    
                    ForEach (recipe.ingredients) {
                        it in
                        Text("- " + RecipeModel.getPortion(ingredient: it, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + it.name)
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
//        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy for preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
