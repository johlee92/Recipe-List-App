//
//  RecipeHighlightsView.swift
//  Recipe List App
//
//  Created by Johnathan Lee on 4/18/22.
//

import SwiftUI

struct RecipeHighlightsView: View {
    
    var recipeHighlights = ""
    
    init(highlights:[String]) {
        for index in 0..<highlights.count {
            if index == highlights.count-1 {
                recipeHighlights += highlights[index]
            } else {
                recipeHighlights += highlights[index] + ", "
            }
        }
    }
    
    
    var body: some View {
        Text(recipeHighlights)
    }
}

struct RecipeHighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlightsView(highlights: ["test","test2","test3"])
    }
}
