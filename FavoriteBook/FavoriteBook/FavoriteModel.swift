//
//  FavoriteModel.swift
//  FavoriteBook
//
//  Created by Turker Kizilcik on 10.08.2023.
//

import Foundation

struct FavoriteModel : Identifiable {
    var id = UUID()
    var title : String
    var elements : [FavoriteElements]
}

struct FavoriteElements : Identifiable {
    var id = UUID()
    var name : String
    var imagename : String
    var description : String
}

let metallica = FavoriteElements(name: "Metallica", imagename: "metallica" , description: "No 1 Music Band")
let megadeth = FavoriteElements(name: "Megadeth", imagename: "megadeth" , description: "No 2 Music Band")
let ironmaiden = FavoriteElements(name: "Iron Maiden", imagename: "ironmaiden" , description: "No 3 Music Band")

let favoriteBands = FavoriteModel(title: "Favorite Bands", elements: [metallica,megadeth,ironmaiden])

let pulpfiction = FavoriteElements(name: "Pulp Fiction", imagename: "pulpfiction" , description: "No 1 Movie")
let thedarkknight = FavoriteElements(name: "The Dark Knight", imagename: "thedarkknight" , description: "No 2 Movie")
let killbill = FavoriteElements(name: "Kill Bill", imagename: "killbill" , description: "No 3 Movie")

let favoriteMovies = FavoriteModel(title: "Favorite Movies", elements: [pulpfiction,thedarkknight,killbill])

let myFavorites = [favoriteBands, favoriteMovies]
