//
//  RecipeModel.swift
//  mvvm-demo
//
//  Created by xc51b8 on 2021-09-14.
//

import Foundation

class RecipeModel: ObservableObject {
    
   @Published var recipes = [Recipe]()
    
    init() { 
        //kreiranje dummy recipe podataka
       /* 999
         var recipe = Recipe()
        recipe.name="Spagete"
        recipe.cuisine = "Italijanske"
        */
       // var recipe = Recipe(name: <#T##String#>, cuisine: <#T##String#>) //ovo je inicijalizacija recipe strukture koju nam daj xcode za dz i stedi se mnogo kodiranja pa umesto 999 :)
        
        /* var recipe = Recipe(name: "Spagete", cuisine: "Italijanske")
        
        recipes.append(recipe) */
        // a ovo iznad moze skraceno da se otkuca ovako:
       // recipes.append(Recipe(name: "Spagete", cuisine: "Italijanske"))
        
       // recipes.append(Recipe(name: "Sarme", cuisine: "Srpske"))
       
        // dobijanje putanje fajla do json fajla sa app bundle
       let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        if let path  = pathString {
            
            //kreiranje url objekta
            let url = URL(fileURLWithPath: path)
            
            //upravljanje greskom
            do {
                //stavljanje koda koji potencijalno baca gresku
                 //kreiranje data objekta sa data url-om
            /*ovo potencijalno moze baciti gresku*/
                let data = try Data(contentsOf: url)
                
                //parse data
                let decoder = JSONDecoder()
                
                do {
                    let recipeData = try decoder.decode([Recipe].self, from: data)
                    
                    //postavljanje jedinstvenog id-ja za svaku instancu
                    for r in recipeData {
                        //setovanje jedinstvenog ID-ja za svaku instancu
                        r.id = UUID()
                    }
                    //dodeljivanje data publikovanim svojstvima
                    self.recipes = recipeData
                }
                catch { //bolje da ostane ovaj catch da bi se znalo koja greska je uhvacena
                    // ako ne moze da se dekodira json
                    print(error)
                }
                
            }
            catch{
                //izvrsavanje ce doci ovde ako se baca greska
                print(error)
            }
        }
                
    }
    
    func addRecipe(){
     //   rcipes.append(Recipe(name: "Pljeska", cuisine: "Blokovska"))
    }

}
