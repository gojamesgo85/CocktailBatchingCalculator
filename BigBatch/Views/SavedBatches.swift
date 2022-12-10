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
    let col1 = UIColor(red: 0.5059, green: 0.9098, blue: 0.8, alpha: 1.0)
    let col2 = UIColor(red: 0.5137, green: 0.6353, blue: 0.9176, alpha: 1.0)
    let col3 = UIColor(red: 0.9176, green: 0.5137, blue: 0.5529, alpha: 1.0)
    let col4 = UIColor(red: 0.8941, green: 0.9098, blue: 0.5059, alpha: 1.0)
    
    var colorNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //view.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.5)
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20) ]
        appearance.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.4)
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
        super.viewWillAppear(animated)
        refreshBackground()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return StorageProvider.sharedStorageProvider.getAllCocktails().count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let colorArray = [col1, col2, col3, col4]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let cocktailCell = StorageProvider.sharedStorageProvider.getAllCocktails()[indexPath.row]
        cell.textLabel?.text = cocktailCell.cocktailName
        
        colorNumber += 1
        if colorNumber > 3 {
            colorNumber = 0
        }
        cell.backgroundColor = colorArray[colorNumber]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listCocktail = StorageProvider.sharedStorageProvider.getAllCocktails()[indexPath.row]
        navigationController?.pushViewController(ViewController(cocktailName: listCocktail.cocktailName ?? "",
                                                                oz1Name: listCocktail.ingredient1Name ?? "",
                                                                oz2Name: listCocktail.ingredient2Name ?? "",
                                                                oz3Name: listCocktail.ingredient3Name ?? "",
                                                                oz4Name: listCocktail.ingredient4Name ?? "",
                                                                oz5Name: listCocktail.ingredient5Name ?? "",
                                                                oz6Name: listCocktail.ingredient6Name ?? "",
                                                                oz7Name: listCocktail.ingredient7Name ?? "",
                                                                oz1Amount: listCocktail.ingredient1Amount ?? "",
                                                                oz2Amount: listCocktail.ingredient2Amount ?? "",
                                                                oz3Amount: listCocktail.ingredient3Amount ?? "",
                                                                oz4Amount: listCocktail.ingredient4Amount ?? "",
                                                                oz5Amount: listCocktail.ingredient5Amount ?? "",
                                                                oz6Amount: listCocktail.ingredient6Amount ?? "",
                                                                oz7Amount: listCocktail.ingredient7Amount ?? "",
                                                                dilutionPercentage: listCocktail.ingredient8Amount ?? "",
                                                                dilutionName: listCocktail.ingredient8Name ?? "",
                                                                ABV1: listCocktail.aBV1 ?? "",
                                                                ABV2: listCocktail.aBV2 ?? "",
                                                                ABV3: listCocktail.aBV3 ?? "",
                                                                ABV4: listCocktail.aBV4 ?? "",
                                                                ABV5: listCocktail.aBV5 ?? "",
                                                                ABV6: listCocktail.aBV6 ?? "",
                                                                ABV7: listCocktail.aBV7 ?? "",
                                                                ABV8: listCocktail.aBV8 ?? ""), animated: true)
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
