//
//  Extensions.swift
//  BigBatch
//
//  Created by James on 12/6/22.
//

import UIKit
import CoreData


extension Double {
    func truncate(places : Int) -> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}


extension StorageProvider {
    func saveCocktail(named name: String,
                      notes: String,
                      ingredient1Name: String,
                      ingredient2Name: String,
                      ingredient3Name: String,
                      ingredient4Name: String,
                      ingredient5Name: String,
                      ingredient6Name: String,
                      ingredient7Name: String,
                      ingredient8Name: String,
                      ingredient9Name: String,
                      ingredient10Name: String,
                      ingredient11Name: String,
                      ingredient12Name: String,
                      ingredient13Name: String,
                      ingredient14Name: String,
                      ingredient15Name: String,
                      ingredient16Name: String,
                      ingredient1Amount: String,
                      ingredient2Amount: String,
                      ingredient3Amount: String,
                      ingredient4Amount: String,
                      ingredient5Amount: String,
                      ingredient6Amount: String,
                      ingredient7Amount: String,
                      ingredient8Amount: String,
                      ingredient9Amount: String,
                      ingredient10Amount: String,
                      ingredient11Amount: String,
                      ingredient12Amount: String,
                      ingredient13Amount: String,
                      ingredient14Amount: String,
                      ingredient15Amount: String,
                      ingredient16Amount: String,
                      dilutionTypeName: String,
                      dilutionPecentage: String,
                      ABV1: String,
                      ABV2: String,
                      ABV3: String,
                      ABV4: String,
                      ABV5: String,
                      ABV6: String,
                      ABV7: String,
                      ABV8: String,
                      ABV9: String,
                      ABV10: String,
                      ABV11: String,
                      ABV12: String,
                      ABV13: String,
                      ABV14: String,
                      ABV15: String,
                      ABV16: String) {
        let cocktail = CocktailEntity(context: persistentContainer.viewContext)
        cocktail.cocktailName = name
        cocktail.notes = notes
        cocktail.ingredient1Amount = ingredient1Amount
        cocktail.ingredient1Name = ingredient1Name
        cocktail.ingredient2Amount = ingredient2Amount
        cocktail.ingredient2Name = ingredient2Name
        cocktail.ingredient3Amount = ingredient3Amount
        cocktail.ingredient3Name = ingredient3Name
        cocktail.ingredient4Amount = ingredient4Amount
        cocktail.ingredient4Name = ingredient4Name
        cocktail.ingredient5Amount = ingredient5Amount
        cocktail.ingredient5Name = ingredient5Name
        cocktail.ingredient6Amount = ingredient6Amount
        cocktail.ingredient6Name = ingredient6Name
        cocktail.ingredient7Amount = ingredient7Amount
        cocktail.ingredient7Name = ingredient7Name
        cocktail.ingredient8Amount = ingredient8Amount
        cocktail.ingredient8Name = ingredient8Name
        cocktail.ingredient9Amount = ingredient9Amount
        cocktail.ingredient9Name = ingredient9Name
        cocktail.ingredient10Amount = ingredient10Amount
        cocktail.ingredient10Name = ingredient10Name
        cocktail.ingredient11Amount = ingredient11Amount
        cocktail.ingredient11Name = ingredient11Name
        cocktail.ingredient12Amount = ingredient12Amount
        cocktail.ingredient12Name = ingredient12Name
        cocktail.ingredient13Amount = ingredient13Amount
        cocktail.ingredient13Name = ingredient13Name
        cocktail.ingredient14Amount = ingredient14Amount
        cocktail.ingredient14Name = ingredient14Name
        cocktail.ingredient15Amount = ingredient15Amount
        cocktail.ingredient15Name = ingredient15Name
        cocktail.ingredient16Amount = ingredient16Amount
        cocktail.ingredient16Name = ingredient16Name
        cocktail.aBV1 = ABV1
        cocktail.aBV2 = ABV2
        cocktail.aBV3 = ABV3
        cocktail.aBV4 = ABV4
        cocktail.aBV5 = ABV5
        cocktail.aBV6 = ABV6
        cocktail.aBV7 = ABV7
        cocktail.aBV8 = ABV8
        cocktail.aBV9 = ABV9
        cocktail.aBV10 = ABV10
        cocktail.aBV11 = ABV11
        cocktail.aBV12 = ABV12
        cocktail.aBV13 = ABV13
        cocktail.aBV14 = ABV14
        cocktail.aBV15 = ABV15
        cocktail.aBV16 = ABV16
        cocktail.dilutionType = dilutionTypeName
        cocktail.dilutionPercentage = dilutionPecentage
        
        do {
            try persistentContainer.viewContext.save()
            print("Cocktail saved succesfully")
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save cocktail: \(error)")
        }
        
    }
    func getAllCocktails() -> [CocktailEntity] {
        let fetchRequest: NSFetchRequest<CocktailEntity> = CocktailEntity.fetchRequest()
        do {
            
            return try persistentContainer.viewContext.fetch(fetchRequest)
            
            
        } catch {
            print("Failed to fetch cocktails: \(error)")
            return []
        }
    }
}

extension StorageProvider {
    func deleteCocktail(_ cocktail: CocktailEntity) {
        persistentContainer.viewContext.delete(cocktail)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context: \(error)")
        }
    }
    func updateCocktails() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context: \(error)")
        }
    }
}

extension UIResponder {
    
    private struct Static {
        static weak var responder: UIResponder?
    }
    
    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }
    
    @objc private func _trap() {
        Static.responder = self
    }
}
