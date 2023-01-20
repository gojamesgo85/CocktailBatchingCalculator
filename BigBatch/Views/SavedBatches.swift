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
    let cocktail = CocktailModel()
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
        
        
        let colorArray = [colorPalette.teal,
                          colorPalette.blue,
                          colorPalette.red,
                          colorPalette.orange,
                          colorPalette.lightOrange,
                          colorPalette.forestGreen]
        
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
        navigationController?.pushViewController(CocktailSpecsVC(name: listCocktail.cocktailName ?? "",
                                                                 notes: listCocktail.notes ?? "",
                                                                 ingredient1Name: listCocktail.ingredient1Name ?? "",
                                                                 ingredient2Name: listCocktail.ingredient2Name ?? "",
                                                                 ingredient3Name: listCocktail.ingredient3Name ?? "",
                                                                 ingredient4Name: listCocktail.ingredient4Name ?? "",
                                                                 ingredient5Name: listCocktail.ingredient5Name ?? "",
                                                                 ingredient6Name: listCocktail.ingredient6Name ?? "",
                                                                 ingredient7Name: listCocktail.ingredient7Name ?? "",
                                                                 ingredient8Name: listCocktail.ingredient8Name ?? "",
                                                                 ingredient9Name: listCocktail.ingredient9Name ?? "",
                                                                 ingredient10Name: listCocktail.ingredient10Name ?? "",
                                                                 ingredient11Name: listCocktail.ingredient11Name ?? "",
                                                                 ingredient12Name: listCocktail.ingredient12Name ?? "",
                                                                 ingredient13Name: listCocktail.ingredient13Name ?? "",
                                                                 ingredient14Name: listCocktail.ingredient14Name ?? "",
                                                                 ingredient15Name: listCocktail.ingredient15Name ?? "",
                                                                 ingredient16Name: listCocktail.ingredient16Name ?? "",
                                                                 ingredient1Amount: listCocktail.ingredient1Amount ?? "",
                                                                 ingredient2Amount: listCocktail.ingredient2Amount ?? "",
                                                                 ingredient3Amount: listCocktail.ingredient3Amount ?? "",
                                                                 ingredient4Amount: listCocktail.ingredient4Amount ?? "",
                                                                 ingredient5Amount: listCocktail.ingredient5Amount ?? "",
                                                                 ingredient6Amount: listCocktail.ingredient6Amount ?? "",
                                                                 ingredient7Amount: listCocktail.ingredient7Amount ?? "",
                                                                 ingredient8Amount: listCocktail.ingredient8Amount ?? "",
                                                                 ingredient9Amount: listCocktail.ingredient9Amount ?? "",
                                                                 ingredient10Amount: listCocktail.ingredient10Amount ?? "",
                                                                 ingredient11Amount: listCocktail.ingredient11Amount ?? "",
                                                                 ingredient12Amount: listCocktail.ingredient12Amount ?? "",
                                                                 ingredient13Amount: listCocktail.ingredient13Amount ?? "",
                                                                 ingredient14Amount: listCocktail.ingredient14Amount ?? "",
                                                                 ingredient15Amount: listCocktail.ingredient15Amount ?? "",
                                                                 ingredient16Amount: listCocktail.ingredient16Amount ?? "",
                                                                 dilutionTypeName: listCocktail.dilutionType ?? "",
                                                                 dilutionPecentage: listCocktail.dilutionPercentage ?? "",
                                                                 ABV1: listCocktail.aBV1 ?? "",
                                                                 ABV2: listCocktail.aBV2 ?? "",
                                                                 ABV3: listCocktail.aBV3 ?? "",
                                                                 ABV4: listCocktail.aBV4 ?? "",
                                                                 ABV5: listCocktail.aBV5 ?? "",
                                                                 ABV6: listCocktail.aBV6 ?? "",
                                                                 ABV7: listCocktail.aBV7 ?? "",
                                                                 ABV8: listCocktail.aBV8 ?? "",
                                                                 ABV9: listCocktail.aBV9 ?? "",
                                                                 ABV10: listCocktail.aBV10 ?? "",
                                                                 ABV11: listCocktail.aBV11 ?? "",
                                                                 ABV12: listCocktail.aBV12 ?? "",
                                                                 ABV13: listCocktail.aBV13 ?? "",
                                                                 ABV14: listCocktail.aBV14 ?? "",
                                                                 ABV15: listCocktail.aBV15 ?? "",
                                                                 ABV16: listCocktail.aBV16 ?? ""), animated: true)
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
