//
//  ContentView.swift
//  Recipe List App
//
//  Created by Johnathan Lee on 4/4/22.
//

import SwiftUI

struct ContentView: View {
    
//    @ObservedObject var model = RecipeModel()
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
            NavigationView {
                
                VStack (alignment: .leading) {
                    
                    Text("All Recipes")
                        .bold()
                        .padding(.leading)
                        .font(.largeTitle)
                
                    ScrollView {
                        LazyVStack (alignment: .leading) {
                            ForEach(model.recipes) {
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
                                                .cornerRadius(5)
                                            VStack (alignment: .leading) {
                                                Text(r.name)
                                                    .foregroundColor(.black)
                                                    .bold()
                                                RecipeHighlightsView(highlights:r.highlights)
                                                    .foregroundColor(.black)
                                            }
                                            
                                        }
                                    }
                                )
                            }
                        }.padding(.leading)
                    }
                }
//                .navigationBarTitle("All Recipes")
                .navigationBarHidden(true)
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeModel())
            .previewInterfaceOrientation(.portrait)
    }
}
