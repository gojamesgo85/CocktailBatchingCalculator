//
//  Cocktail.swift
//  BigBatch
//
//  Created by James on 11/27/22.


import UIKit

struct CocktailModel {
    
    var cocktailName = ""
    var ingredient1Name = ""
    var ingredient2Name = ""
    var ingredient3Name = ""
    var ingredient4Name = ""
    var ingredient5Name = ""
    var ingredient6Name = ""
    var ingredient7Name = ""
    var ingredient8Name = ""
    var ingredient9Name = ""
    var ingredient10Name = ""
    var ingredient11Name = ""
    var ingredient12Name = ""
    var ingredient13Name = ""
    var ingredient14Name = ""
    var ingredient15Name = ""
    var ingredient16Name = ""
    var ozAmount1 = ""
    var ozAmount2 = ""
    var ozAmount3 = ""
    var ozAmount4 = ""
    var ozAmount5 = ""
    var ozAmount6 = ""
    var ozAmount7 = ""
    var ozAmount8 = ""
    var ozAmount9 = ""
    var ozAmount10 = ""
    var ozAmount11 = ""
    var ozAmount12 = ""
    var ozAmount13 = ""
    var ozAmount14 = ""
    var ozAmount15 = ""
    var ozAmount16 = ""
    var ABV1 = ""
    var ABV2 = ""
    var ABV3 = ""
    var ABV4 = ""
    var ABV5 = ""
    var ABV6 = ""
    var ABV7 = ""
    var ABV8 = ""
    var ABV9 = ""
    var ABV10 = ""
    var ABV11 = ""
    var ABV12 = ""
    var ABV13 = ""
    var ABV14 = ""
    var ABV15 = ""
    var ABV16 = ""
    
    var dilutionPercentage = ""
    var dilutionType = ""

    var initialCocktailsNumber = ""

    var notes = ""
    
    func getNames() -> [String] {
        return [ingredient1Name, ingredient2Name,ingredient3Name,ingredient4Name, ingredient5Name,ingredient6Name,ingredient7Name,ingredient8Name,ingredient9Name,ingredient10Name,ingredient11Name,ingredient12Name,ingredient13Name,ingredient14Name,ingredient15Name,ingredient16Name]
    }
    
    func getAmounts() -> [String] {
        return [ozAmount1, ozAmount2, ozAmount3, ozAmount4, ozAmount5, ozAmount6, ozAmount7, ozAmount8, ozAmount9, ozAmount10, ozAmount11, ozAmount12, ozAmount13, ozAmount14, ozAmount15, ozAmount16]
    }
    
    func getABV() -> [String] {
        return [ABV1,ABV2,ABV3,ABV4,ABV5,ABV6,ABV7,ABV8,ABV9,ABV10,ABV11,ABV12,ABV13,ABV14,ABV15,ABV16]
    }
   
}

