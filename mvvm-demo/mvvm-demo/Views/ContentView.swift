//
//  ContentView.swift
//  mvvm-demo
//
//  Created by xc51b8 on 2021-09-14.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = RecipeModel() //kada se kreira ova instanca, ona automatski poziva init() {...} iz fajla RecipeModel.swift
    
    var body: some View {
        
        VStack {
        List(model.recipes) { r in
            
            VStack(alignment: .leading){
                Text(r.name)
                    .font(.title)
                Text(r.cuisine)
                
                }
            }
            Button("Add Recipe") {
                model.addRecipe()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
