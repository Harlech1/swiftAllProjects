import UIKit

var myFavMovies = ["Oldboy","Hey","Hay"] as [Any]
//arraylere her şeyi koyabilirsin any ile
//any değişkeni olduğu için birinci stringe uppercased methodu uygulanamaz
myFavMovies[2]

var myStringArray = ["test1","test2","test3"]

myStringArray[0].uppercased()
myStringArray.append("he")
myStringArray.count
myStringArray[myStringArray.count-1]

myStringArray.last
//alfabetik dizer
myStringArray.sort()

//kümeler gibi set'ler her eleman unique'dır ve sıralı değiller

var mySet : Set = [1,2,3,4,5]

var myInternetArray = [1,2,3,4,5,1,2]
var myInternetSET = Set(myInternetArray)
//print(myInternetSET)


var mySet1 : Set = [1,2,3]
var mySet2 : Set = [3,4,5]

var mySet3 : Set = mySet.union(mySet2)

var myFavDirectors = ["Pulpfiction": "Tarantino", "Lock,stock": "Guy Ritchie", "The dark knight": "Christopher Nolan"]

myFavDirectors["Pulpfiction"]

myFavDirectors["The dark knight"]

myFavDirectors["Pulpfiction"] = "Quentin Tarantino"

print(myFavDirectors)
//dictionarylerde order yok
myFavDirectors["Seven Samurai"] = "Akira"

print(myFavDirectors)


