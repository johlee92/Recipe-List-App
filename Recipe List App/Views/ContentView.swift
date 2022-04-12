//
//  ContentView.swift
//  Recipe List App
//
//  Created by Johnathan Lee on 4/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) {
                r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe:r),
                    label: {
                        HStack {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                            Text(r.name)
                        }
                    }
                )
                .navigationBarTitle("All Recipes")
                
            }
        }
        .navigationBarTitle("All Recipes")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
