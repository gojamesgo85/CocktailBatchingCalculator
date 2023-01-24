//
//  SavedBatches.swift
//  BigBatch
//
//  Created by James on 11/22/22.

import UIKit
import CoreData

class SavedBatches: UITableViewController  {
    var cocktailList: [CocktailEntity] = []
    let cellID = "CellID"
    var cocktail = CocktailModel()
    let colorPalette = ColorPalette()
    var colorNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20) ]
        navigationItem.standardAppearance = appearance
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
    }
    init(persistantStorage: StorageProvider) {
        StorageProvider.sharedStorageProvider = persistantStorage
        cocktailList = StorageProvider.sharedStorageProvider.getAllCocktails()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // reloadData() is only for tableviews collectionViews
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        colorNumber = 0
        super.viewWillAppear(animated)
        refreshBackground()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return StorageProvider.sharedStorageProvider.getAllCocktails().count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let colorArray = colorPalette.getSavedTableViewColors()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let cocktailCell = StorageProvider.sharedStorageProvider.getAllCocktails()[indexPath.row]
        cell.textLabel?.text = cocktailCell.cocktailName
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        colorNumber += 1
        if colorNumber > 5 {
            colorNumber = 0
        }
        cell.backgroundColor = colorArray[colorNumber]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listCocktail = StorageProvider.sharedStorageProvider.getAllCocktails()[indexPath.row]
        
        cocktail.cocktailName = listCocktail.cocktailName ?? ""
        cocktail.notes = listCocktail.notes ?? ""
        cocktail.ingredient1Name = listCocktail.ingredient1Name ?? ""
        cocktail.ingredient2Name = listCocktail.ingredient2Name ?? ""
        cocktail.ingredient3Name = listCocktail.ingredient3Name ?? ""
        cocktail.ingredient4Name = listCocktail.ingredient4Name ?? ""
        cocktail.ingredient5Name = listCocktail.ingredient5Name ?? ""
        cocktail.ingredient6Name = listCocktail.ingredient6Name ?? ""
        cocktail.ingredient7Name = listCocktail.ingredient7Name ?? ""
        cocktail.ingredient8Name = listCocktail.ingredient8Name ?? ""
        cocktail.ingredient9Name = listCocktail.ingredient9Name ?? ""
        cocktail.ingredient10Name = listCocktail.ingredient10Name ?? ""
        cocktail.ingredient11Name = listCocktail.ingredient11Name ?? ""
        cocktail.ingredient12Name = listCocktail.ingredient12Name ?? ""
        cocktail.ingredient13Name = listCocktail.ingredient13Name ?? ""
        cocktail.ingredient14Name = listCocktail.ingredient14Name ?? ""
        cocktail.ingredient15Name = listCocktail.ingredient15Name ?? ""
        cocktail.ingredient16Name = listCocktail.ingredient16Name ?? ""
        cocktail.ozAmount1 = listCocktail.ingredient1Amount ?? ""
        cocktail.ozAmount2 = listCocktail.ingredient2Amount ?? ""
        cocktail.ozAmount3 = listCocktail.ingredient3Amount ?? ""
        cocktail.ozAmount4 = listCocktail.ingredient4Amount ?? ""
        cocktail.ozAmount5 = listCocktail.ingredient5Amount ?? ""
        cocktail.ozAmount6 = listCocktail.ingredient6Amount ?? ""
        cocktail.ozAmount7 = listCocktail.ingredient7Amount ?? ""
        cocktail.ozAmount8 = listCocktail.ingredient8Amount ?? ""
        cocktail.ozAmount9 = listCocktail.ingredient9Amount ?? ""
        cocktail.ozAmount10 = listCocktail.ingredient10Amount ?? ""
        cocktail.ozAmount11 = listCocktail.ingredient11Amount ?? ""
        cocktail.ozAmount12 = listCocktail.ingredient12Amount ?? ""
        cocktail.ozAmount13 = listCocktail.ingredient13Amount ?? ""
        cocktail.ozAmount14 = listCocktail.ingredient14Amount ?? ""
        cocktail.ozAmount15 = listCocktail.ingredient15Amount ?? ""
        cocktail.ozAmount16 = listCocktail.ingredient16Amount ?? ""
        cocktail.dilutionType = listCocktail.dilutionType ?? ""
        cocktail.dilutionPercentage = listCocktail.dilutionPercentage ?? ""
        cocktail.ABV1 = listCocktail.aBV1 ?? ""
        cocktail.ABV2 = listCocktail.aBV2 ?? ""
        cocktail.ABV3 = listCocktail.aBV3 ?? ""
        cocktail.ABV4 = listCocktail.aBV4 ?? ""
        cocktail.ABV5 = listCocktail.aBV5 ?? ""
        cocktail.ABV6 = listCocktail.aBV6 ?? ""
        cocktail.ABV7 = listCocktail.aBV7 ?? ""
        cocktail.ABV8 = listCocktail.aBV8 ?? ""
        cocktail.ABV9 = listCocktail.aBV9 ?? ""
        cocktail.ABV10 = listCocktail.aBV10 ?? ""
        cocktail.ABV11 = listCocktail.aBV11 ?? ""
        cocktail.ABV12 = listCocktail.aBV12 ?? ""
        cocktail.ABV13 = listCocktail.aBV13 ?? ""
        cocktail.ABV14 = listCocktail.aBV14 ?? ""
        cocktail.ABV15 = listCocktail.aBV15 ?? ""
        cocktail.ABV16 = listCocktail.aBV16 ?? ""

        navigationController?.pushViewController(CocktailSpecsVC(cocktailModel: cocktail), animated: true)
        

    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            let cocktailName = cocktailList[indexPath.row]
            StorageProvider.sharedStorageProvider.deleteCocktail(cocktailName)
            StorageProvider.sharedStorageProvider.updateCocktails()
            tableView.endUpdates()
        }
    }
    
    func refreshBackground() {
        tableView.backgroundView = nil
        let backgroundView = UIView()
        let gradientLayer = CAGradientLayer.gradientLayer(for: .savedBatches, in: view.frame)
        backgroundView.layer.addSublayer(gradientLayer)
        tableView.backgroundView = backgroundView
        
    }
}
