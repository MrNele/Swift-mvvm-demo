//
//  Recipe.swift
//  mvvm-demo
//
//  Created by xc51b8 on 2021-09-14.
//

import Foundation

/*struct*/ class Recipe: Identifiable, Decodable { //Decodable protokol koji treba nasim model klasama i strukturama da se prilagode
    
    var id:UUID?
    var name = ""
    var cuisine = ""
    
    
}
