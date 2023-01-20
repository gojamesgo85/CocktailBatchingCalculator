//
//  BatchedVC1.swift
//  BigBatch
//
//  Created by James on 12/14/22.
//

import UIKit

class BatchedVC1: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var batchedCellData = BatchedCellData()
    var batchedCellDataArray: [BatchedCellData] = []
    
    var batchedCocktailName = ""
    
    var batchedIngredient1 = ""
    var batchedIngredient2 = ""
    var batchedIngredient3 = ""
    var batchedIngredient4 = ""
    var batchedIngredient5 = ""
    var batchedIngredient6 = ""
    var batchedIngredient7 = ""
    var batchedIngredient8 = ""
    var batchedIngredient9 = ""
    var batchedIngredient10 = ""
    var batchedIngredient11 = ""
    var batchedIngredient12 = ""
    var batchedIngredient13 = ""
    var batchedIngredient14 = ""
    var batchedIngredient15 = ""
    var batchedIngredient16 = ""
    var batchedOzAmount1 = ""
    var batchedOzAmount2 = ""
    var batchedOzAmount3 = ""
    var batchedOzAmount4 = ""
    var batchedOzAmount5 = ""
    var batchedOzAmount6 = ""
    var batchedOzAmount7 = ""
    var batchedOzAmount8 = ""
    var batchedOzAmount9 = ""
    var batchedOzAmount10 = ""
    var batchedOzAmount11 = ""
    var batchedOzAmount12 = ""
    var batchedOzAmount13 = ""
    var batchedOzAmount14 = ""
    var batchedOzAmount15 = ""
    var batchedOzAmount16 = ""
    
    var batchedDilutionPercentage = ""
    var batchedDilutionType = ""

    var batchedInitialCocktailsNumber = 0.0
    
    var mlAmount1 = 0.0
    var mlAmount2 = 0.0
    var mlAmount3 = 0.0
    var mlAmount4 = 0.0
    var mlAmount5 = 0.0
    var mlAmount6 = 0.0
    var mlAmount7 = 0.0
    var mlAmount8 = 0.0
    var mlAmount9 = 0.0
    var mlAmount10 = 0.0
    var mlAmount11 = 0.0
    var mlAmount12 = 0.0
    var mlAmount13 = 0.0
    var mlAmount14 = 0.0
    var mlAmount15 = 0.0
    var mlAmount16 = 0.0

    let cocktail = CocktailModel()
    let colorPalette = ColorPalette()
    var cocktailCountTextField = CocktailIngredientAmountTF()
    var cocktailCountLabel = TypeLabel()
    var totalDilutionTextField = TypeLabel()
    var totalDilutionLabel = TypeLabel()
    var totalVolumeTextField = TypeLabel()
    var totalVolumeLabel = TypeLabel()
    var batchIngredientsTableView = UITableView()
    
    var splitBatchButton = BatchButton()
    var tableViewLabel = TypeLabel()
    
    var literDilutionAmount = 0.0
    var mlDilutionAmouunt = 0.0
    
    var batchedTotalVolume = 0
    
    var singleCocktailVolume = 0
    var singleCoctailDilutionMls = 0.0
    
    var actualDilutionPercentageNumber = 0.0
    
    var labelHeight = CGFloat(40)
    init(cocktail: CocktailModel) {
        batchedCocktailName = cocktail.savedCocktailName
        batchedIngredient1 = cocktail.modelIngredient1Name
        batchedIngredient2 = cocktail.modelIngredient2Name
        batchedIngredient3 = cocktail.modelIngredient3Name
        batchedIngredient4 = cocktail.modelIngredient4Name
        batchedIngredient5 = cocktail.modelIngredient5Name
        batchedIngredient6 = cocktail.modelIngredient6Name
        batchedIngredient7 = cocktail.modelIngredient7Name
        batchedIngredient8 = cocktail.modelIngredient8Name
        batchedIngredient9 = cocktail.modelIngredient9Name
        batchedIngredient10 = cocktail.modelIngredient10Name
        batchedIngredient11 = cocktail.modelIngredient11Name
        batchedIngredient12 = cocktail.modelIngredient12Name
        batchedIngredient13 = cocktail.modelIngredient13Name
        batchedIngredient14 = cocktail.modelIngredient14Name
        batchedIngredient15 = cocktail.modelIngredient15Name
        batchedIngredient16 = cocktail.modelIngredient16Name
        batchedOzAmount1 = cocktail.modelOzAmount1
        batchedOzAmount2 = cocktail.modelOzAmount2
        batchedOzAmount3 = cocktail.modelOzAmount3
        batchedOzAmount4 = cocktail.modelOzAmount4
        batchedOzAmount5 = cocktail.modelOzAmount5
        batchedOzAmount6 = cocktail.modelOzAmount6
        batchedOzAmount7 = cocktail.modelOzAmount7
        batchedOzAmount8 = cocktail.modelOzAmount8
        batchedOzAmount9 = cocktail.modelOzAmount9
        batchedOzAmount10 = cocktail.modelOzAmount10
        batchedOzAmount11 = cocktail.modelOzAmount11
        batchedOzAmount12 = cocktail.modelOzAmount12
        batchedOzAmount13 = cocktail.modelOzAmount13
        batchedOzAmount14 = cocktail.modelOzAmount14
        batchedOzAmount15 = cocktail.modelOzAmount15
        batchedOzAmount16 = cocktail.modelOzAmount16
        batchedDilutionPercentage = cocktail.modelDilutionPercentage
        batchedDilutionType = cocktail.modelDilutionType
        batchedInitialCocktailsNumber = Double(cocktail.modelInitialCocktailsNumber) ?? 0.0
        
        let batchedIngredientArray = [batchedIngredient1,batchedIngredient2,batchedIngredient3,batchedIngredient4,batchedIngredient5, batchedIngredient6,batchedIngredient7,batchedIngredient8,batchedIngredient9,batchedIngredient10,batchedIngredient11,batchedIngredient12,batchedIngredient13,batchedIngredient14,batchedIngredient15, batchedIngredient16]
        let batchedAmountArray = [batchedOzAmount1,batchedOzAmount2,batchedOzAmount3,batchedOzAmount4,batchedOzAmount5,batchedOzAmount6,batchedOzAmount7,batchedOzAmount8,batchedOzAmount9,batchedOzAmount10,batchedOzAmount11,batchedOzAmount12,batchedOzAmount13,batchedOzAmount14,batchedOzAmount15,batchedOzAmount16]
        
          
        
        for i in 0..<batchedAmountArray.count{
            if batchedAmountArray[i] == "" && batchedIngredientArray[i] == "" {
                break
            } else {
                
                if batchedAmountArray[i] != "" {
                    batchedCellData.ingredientName = batchedIngredientArray[i]
                    batchedCellData.initialOzAmount = batchedAmountArray[i]
                    batchedCellDataArray.append(batchedCellData)
                }
            }
        }

        super.init(nibName: nil, bundle: nil)
    }
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Total Batch: \(batchedCocktailName)"
        setupKeyboardHiding()
        configureTopAnchorFields()
        configureTableView()
        configureSplitBatchButton()
        doBatchMath()
        getSingleCocktailSizeInMls()
        batchIngredientsTableView.register(TotalBatchTableViewCell.self, forCellReuseIdentifier: TotalBatchTableViewCell.batchCellIdentifier)
        batchIngredientsTableView.dataSource = self
        batchIngredientsTableView.delegate = self
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20)]
        navigationItem.standardAppearance = appearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: SFSymbols.export), style: .plain, target: self, action: #selector(exportCSVFile))
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        refreshBackground()
        super.viewWillAppear(animated)
    }
    
    @objc func exportCSVFile() {
        for i in 0..<batchedCellDataArray.count {
            
            batchedCellDataArray[i].segmentedControlSelectedIndex = 0
        }
        doBatchMath()
        
        
        let fileName = "Total Batch \(batchedCocktailName).csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvHead = "\(batchedCocktailName), Ingredients, Whole Liters, Remaining ml. \n"
        
        for i in 0..<batchedCellDataArray.count {
            
            csvHead.append(", \(batchedCellDataArray[i].ingredientName), \(batchedCellDataArray[i].wholeBottles), \(batchedCellDataArray[i].remainingMls) \n")
            
        }
        csvHead.append(", \n, Dilution (\(batchedDilutionType)) , \(literDilutionAmount.truncate(places: 3))Liters")
        csvHead.append(" \n , TOTAL COCKTAIL COUNT = \(batchedInitialCocktailsNumber.truncate(places: 2))")
        
        
        
        do {
            try csvHead.write(to: path!, atomically: true, encoding: .utf8)
            let exportSheet = UIActivityViewController(activityItems: [path as Any], applicationActivities: nil)
            self.present(exportSheet, animated: true, completion: nil)
            print("exported")
        } catch {
            print("Error")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return batchedCellDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = batchIngredientsTableView.dequeueReusableCell(withIdentifier: TotalBatchTableViewCell.batchCellIdentifier, for: indexPath) as! TotalBatchTableViewCell
        let colorArray = [colorPalette.blue,
                          colorPalette.red,
                          colorPalette.orange,
                          colorPalette.lightOrange,
                          colorPalette.forestGreen,
                          colorPalette.blue,
                          colorPalette.red,
                          colorPalette.orange,
                          colorPalette.lightOrange,
                          colorPalette.forestGreen,
                          colorPalette.blue,
                          colorPalette.red,
                          colorPalette.orange,
                          colorPalette.lightOrange,
                          colorPalette.forestGreen,
                          colorPalette.blue ]
        
        cell.segmentedControlDelegate = self
        cell.textFieldDelegate = self
        
        cell.bottleNumberTextField.tag = indexPath.row
        
        cell.backgroundColor = colorArray[indexPath.row]
       
        cell.segmentedControl.tag = indexPath.row
        
        cell.bottleNumberTextField.text = String(batchedCellDataArray[indexPath.row].wholeBottles)
        cell.remainingMlsTextField.text = String(batchedCellDataArray[indexPath.row].remainingMls)
        cell.totalBatchIngredientNameLabel.text = batchedCellDataArray[indexPath.row].ingredientName
        cell.segmentedControl.selectedSegmentIndex = batchedCellDataArray[indexPath.row].segmentedControlSelectedIndex
        
        return cell
    }
    
    func doBatchMath() {
        
        cocktailCountTextField.text = String(batchedInitialCocktailsNumber.truncate(places: 2))
  
        mlAmount1 = (Double(batchedOzAmount1) ?? 0.0) * 29.5735
        mlAmount2 = (Double(batchedOzAmount2) ?? 0.0) * 29.5735
        mlAmount3 = (Double(batchedOzAmount3) ?? 0.0) * 29.5735
        mlAmount4 = (Double(batchedOzAmount4) ?? 0.0) * 29.5735
        mlAmount5 = (Double(batchedOzAmount5) ?? 0.0) * 29.5735
        mlAmount6 = (Double(batchedOzAmount6) ?? 0.0) * 29.5735
        mlAmount7 = (Double(batchedOzAmount7) ?? 0.0) * 29.5735
        mlAmount8 = (Double(batchedOzAmount8) ?? 0.0) * 29.5735
        mlAmount9 = (Double(batchedOzAmount9) ?? 0.0) * 29.5735
        mlAmount10 = (Double(batchedOzAmount10) ?? 0.0) * 29.5735
        mlAmount11 = (Double(batchedOzAmount11) ?? 0.0) * 29.5735
        mlAmount12 = (Double(batchedOzAmount12) ?? 0.0) * 29.5735
        mlAmount13 = (Double(batchedOzAmount13) ?? 0.0) * 29.5735
        mlAmount14 = (Double(batchedOzAmount14) ?? 0.0) * 29.5735
        mlAmount15 = (Double(batchedOzAmount15) ?? 0.0) * 29.5735
        mlAmount16 = (Double(batchedOzAmount16) ?? 0.0) * 29.5735
        
        var mlAmountArray = [mlAmount1, mlAmount2, mlAmount3, mlAmount4, mlAmount5, mlAmount6, mlAmount7, mlAmount8, mlAmount9, mlAmount10, mlAmount11, mlAmount12, mlAmount13, mlAmount14, mlAmount15, mlAmount16]
        for i in 0..<batchedCellDataArray.count {
            batchedCellDataArray[i].mlAmount = mlAmountArray[i]
        }

        
        for i in 0..<batchedCellDataArray.count {
            
            mlAmountArray[i] = batchedCellDataArray[i].mlAmount * batchedInitialCocktailsNumber
           
            if batchedCellDataArray[i].segmentedControlSelectedIndex == 1 {
                
                let mathfor750s = mlLiterMath(mlsIngredientVolume: Int(ceil(mlAmountArray[i])))
                batchedCellDataArray[i].wholeBottles = mathfor750s.whole750sCount
                batchedCellDataArray[i].remainingMls = mathfor750s.remaining750Mls
                
            } else {
                
                let literMath = oneLiterMath(mlsIngredientVolume: Int(ceil(mlAmountArray[i])))
                batchedCellDataArray[i].wholeBottles = literMath.oneLiterCount
                batchedCellDataArray[i].remainingMls = literMath.remainingLiterMls
            }
            
        }
        
        func oneLiterMath(mlsIngredientVolume: Int ) -> (oneLiterCount: Int, remainingLiterMls: Int) {
            var oneLiterCount = 0
            var remainingLiterMls = mlsIngredientVolume
            
            while remainingLiterMls > 999 {
                oneLiterCount += 1
                remainingLiterMls -= 1000
            }
        return (oneLiterCount, remainingLiterMls)
    }

    func mlLiterMath(mlsIngredientVolume: Int ) -> (whole750sCount: Int, remaining750Mls: Int) {
        var whole750sCount = 0
        var remaining750Mls = mlsIngredientVolume

        while remaining750Mls > 749 {
            whole750sCount += 1
            remaining750Mls -= 750
        }
        return (whole750sCount, remaining750Mls)
    }

        var totalVolumePreDilution = 0

        for i in 0..<batchedCellDataArray.count {
            if batchedCellDataArray[i].segmentedControlSelectedIndex == 1 {
                totalVolumePreDilution += batchedCellDataArray[i].wholeBottles * 750
                totalVolumePreDilution += batchedCellDataArray[i].remainingMls
            } else {
                totalVolumePreDilution += batchedCellDataArray[i].wholeBottles * 1000
                totalVolumePreDilution += batchedCellDataArray[i].remainingMls
            }
        }
        
      
        let conformedDilutionPercentage = Double(batchedDilutionPercentage) ?? 0.0
        actualDilutionPercentageNumber = conformedDilutionPercentage / 100.0
        mlDilutionAmouunt = Double(totalVolumePreDilution) * actualDilutionPercentageNumber
        literDilutionAmount = mlDilutionAmouunt / 1000
        
        totalDilutionTextField.text = "\(Int(mlDilutionAmouunt))mls"
       
        let totalVolumeInMls = totalVolumePreDilution + Int(ceil(mlDilutionAmouunt))
        let totalVolumeInLiters = Double(totalVolumeInMls) / 1000.0
        
        totalVolumeLabel.text = "Total Volume = \(totalVolumeInMls)mls (\(totalVolumeInLiters)Liters)"
        
        batchedTotalVolume = totalVolumeInMls
        batchIngredientsTableView.reloadData()
        
        
    }
    @objc func pushChooseContainerView() {
        

        let totalMlsForIngredient1 = 0
        let totalMlsForIngredient2 = 0
        let totalMlsForIngredient3 = 0
        let totalMlsForIngredient4 = 0
        let totalMlsForIngredient5 = 0
        let totalMlsForIngredient6 = 0
        let totalMlsForIngredient7 = 0
        let totalMlsForIngredient8 = 0
        let totalMlsForIngredient9 = 0
        let totalMlsForIngredient10 = 0
        let totalMlsForIngredient11 = 0
        let totalMlsForIngredient12 = 0
        let totalMlsForIngredient13 = 0
        let totalMlsForIngredient14 = 0
        let totalMlsForIngredient15 = 0
        let totalMlsForIngredient16 = 0
        

        
        var totalMlsArray = [totalMlsForIngredient1, totalMlsForIngredient2, totalMlsForIngredient3, totalMlsForIngredient4, totalMlsForIngredient5, totalMlsForIngredient6, totalMlsForIngredient7, totalMlsForIngredient8, totalMlsForIngredient9, totalMlsForIngredient10, totalMlsForIngredient11, totalMlsForIngredient12, totalMlsForIngredient13, totalMlsForIngredient14, totalMlsForIngredient15, totalMlsForIngredient16]
        
        for i in 0..<batchedCellDataArray.count{
            if batchedCellDataArray[i].segmentedControlSelectedIndex == 0{
                totalMlsArray[i] = batchedCellDataArray[i].wholeBottles * 1000
                totalMlsArray[i] += batchedCellDataArray[i].remainingMls
            } else {
                totalMlsArray[i] = batchedCellDataArray[i].wholeBottles * 750
                totalMlsArray[i] += batchedCellDataArray[i].remainingMls
            }
        }
        
        navigationController?.pushViewController(ChooseContainerVC(ingredient1Name: batchedIngredient1,
                                                                   ingredient2Name: batchedIngredient2,
                                                                   ingredient3Name: batchedIngredient3,
                                                                   ingredient4Name: batchedIngredient4,
                                                                   ingredient5Name: batchedIngredient5,
                                                                   ingredient6Name: batchedIngredient6,
                                                                   ingredient7Name: batchedIngredient7,
                                                                   ingredient8Name: batchedIngredient8,
                                                                   ingredient9Name: batchedIngredient9,
                                                                   ingredient10Name: batchedIngredient10,
                                                                   ingredient11Name: batchedIngredient11,
                                                                   ingredient12Name: batchedIngredient12,
                                                                   ingredient13Name: batchedIngredient13,
                                                                   ingredient14Name: batchedIngredient14,
                                                                   ingredient15Name: batchedIngredient15,
                                                                   ingredient16Name: batchedIngredient16,
                                                                   ingredient1Amount: totalMlsArray[0],
                                                                   ingredient2Amount: totalMlsArray[1],
                                                                   ingredient3Amount: totalMlsArray[2],
                                                                   ingredient4Amount: totalMlsArray[3],
                                                                   ingredient5Amount: totalMlsArray[4],
                                                                   ingredient6Amount: totalMlsArray[5],
                                                                   ingredient7Amount: totalMlsArray[6],
                                                                   ingredient8Amount: totalMlsArray[7],
                                                                   ingredient9Amount: totalMlsArray[8],
                                                                   ingredient10Amount: totalMlsArray[9],
                                                                   ingredient11Amount: totalMlsArray[10],
                                                                   ingredient12Amount: totalMlsArray[11],
                                                                   ingredient13Amount: totalMlsArray[12],
                                                                   ingredient14Amount: totalMlsArray[13],
                                                                   ingredient15Amount: totalMlsArray[14],
                                                                   ingredient16Amount: totalMlsArray[15],
                                                                   singleIngredientAmount1: mlAmount1,
                                                                   singleIngredientAmount2: mlAmount2,
                                                                   singleIngredientAmount3: mlAmount3,
                                                                   singleIngredientAmount4: mlAmount4,
                                                                   singleIngredientAmount5: mlAmount5,
                                                                   singleIngredientAmount6: mlAmount6,
                                                                   singleIngredientAmount7: mlAmount7,
                                                                   singleIngredientAmount8: mlAmount8,
                                                                   singleIngredientAmount9: mlAmount9,
                                                                   singleIngredientAmount10: mlAmount10,
                                                                   singleIngredientAmount11: mlAmount11,
                                                                   singleIngredientAmount12: mlAmount12,
                                                                   singleIngredientAmount13: mlAmount13,
                                                                   singleIngredientAmount14: mlAmount14,
                                                                   singleIngredientAmount15: mlAmount15,
                                                                   singleIngredientAmount16: mlAmount16,
                                                                   singleDilutionAmount: singleCoctailDilutionMls,
                                                                   dilutionAmount: mlDilutionAmouunt,
                                                                   dilutionName: batchedDilutionType,
                                                                   totalVolume: batchedTotalVolume,
                                                                   singleCocktailAmount: singleCocktailVolume,
                                                                   cocktailCount: batchedInitialCocktailsNumber,
                                                                   cocktailName: batchedCocktailName), animated: true)
        
    }
    
    func configureTopAnchorFields() {
        view.addSubview(cocktailCountLabel)
        view.addSubview(cocktailCountTextField)
        view.addSubview(totalDilutionTextField)
        view.addSubview(totalDilutionLabel)
        view.addSubview(totalVolumeLabel)
        view.addSubview(tableViewLabel)
        tableViewLabel.text = "Ingredient Name:        Btl. Size:      # of btls/remaining mls: "
        cocktailCountLabel.text = "Cocktail Count:"
        totalDilutionLabel.text = "Total Dilution (\(batchedDilutionType)) = "
        totalVolumeLabel.text = "Total Volume in Liters:"
        totalVolumeLabel.textAlignment = .center
        totalDilutionTextField.textAlignment = .left
        totalDilutionLabel.textAlignment = .right
        cocktailCountTextField.text = String(batchedInitialCocktailsNumber)
        
        cocktailCountTextField.addTarget(self, action: #selector(cocktailCountChanged), for: .editingDidEnd)
        
        cocktailCountTextField.inputAccessoryView = toolBar()
        NSLayoutConstraint.activate([
            
            cocktailCountLabel.trailingAnchor.constraint(equalTo: cocktailCountTextField.leadingAnchor, constant: -5),
            cocktailCountLabel.topAnchor.constraint(equalTo: cocktailCountTextField.topAnchor),
            cocktailCountLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            cocktailCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cocktailCountTextField.leadingAnchor.constraint(equalTo: cocktailCountLabel.trailingAnchor, constant: 5),
            cocktailCountTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            cocktailCountTextField.heightAnchor.constraint(equalToConstant: labelHeight),
            cocktailCountTextField.widthAnchor.constraint(equalToConstant: 80),
      
            totalDilutionLabel.trailingAnchor.constraint(equalTo: totalDilutionTextField.leadingAnchor, constant: -5),
            totalDilutionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            totalDilutionLabel.bottomAnchor.constraint(equalTo: totalDilutionTextField.bottomAnchor),
            totalDilutionLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            
            totalDilutionTextField.widthAnchor.constraint(equalToConstant: 125),
            totalDilutionTextField.bottomAnchor.constraint(equalTo: totalVolumeLabel.topAnchor, constant: -5),
            totalDilutionTextField.heightAnchor.constraint(equalToConstant: labelHeight),
            totalDilutionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),

            totalVolumeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            totalVolumeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            totalVolumeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
            totalVolumeLabel.heightAnchor.constraint(equalToConstant: labelHeight),
        
            tableViewLabel.topAnchor.constraint(equalTo: cocktailCountTextField.bottomAnchor),
            tableViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            tableViewLabel.heightAnchor.constraint(equalToConstant: 30)
        
        ])
    }
    
    @objc func cocktailCountChanged() {
        guard let newCocktailCount = cocktailCountTextField.text else { return }
        batchedInitialCocktailsNumber = Double(newCocktailCount) ?? 0.0
        doBatchMath()
        batchIngredientsTableView.reloadData()
        
    }
    
    func configureTableView() {
        view.addSubview(batchIngredientsTableView)
        batchIngredientsTableView.layer.borderWidth = 1
        batchIngredientsTableView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        batchIngredientsTableView.layer.cornerRadius = 10
        batchIngredientsTableView.translatesAutoresizingMaskIntoConstraints = false
        batchIngredientsTableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.0)

        NSLayoutConstraint.activate([
            batchIngredientsTableView.topAnchor.constraint(equalTo: tableViewLabel.bottomAnchor, constant: 5),
            batchIngredientsTableView.bottomAnchor.constraint(equalTo: totalDilutionTextField.topAnchor, constant: -5),
            batchIngredientsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            batchIngredientsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
            ])
    }
    func configureSplitBatchButton() {
        view.addSubview(splitBatchButton)
        splitBatchButton.setTitle("Split Batch", for: .normal)
        
        splitBatchButton.addTarget(self, action: #selector(pushChooseContainerView), for: .touchUpInside)
        NSLayoutConstraint.activate([
            splitBatchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            splitBatchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splitBatchButton.widthAnchor.constraint(equalToConstant: 125),
            splitBatchButton.heightAnchor.constraint(equalToConstant: labelHeight)


        ])
        
        
    }
    

    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
        
    }
    
    func getSingleCocktailSizeInMls() {
        let currentCocktailCount = batchedInitialCocktailsNumber
        batchedInitialCocktailsNumber = 1
        doBatchMath()
        singleCocktailVolume = batchedTotalVolume
        singleCoctailDilutionMls = Double(singleCocktailVolume) * actualDilutionPercentageNumber
        batchedInitialCocktailsNumber = currentCocktailCount
        doBatchMath()

    }
    
    func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }
        

        // check if the top of the keyboard is above the bottom of the currently focused textbox
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        // if text field bottom is below keyboard bottom = bump the frame up
        
        if textFieldBottomY > keyboardTopY {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 2) * -1
            let dialedInFrame = newFrameY + 100
            view.frame.origin.y = dialedInFrame
        }
        
        
    }
    
    func refreshBackground() {
        let gradientLayer = CAGradientLayer.gradientLayer(for: .savedBatches, in: view.frame)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
   
    }

}

//MARK: BatchTableViewCellDelegate

extension BatchedVC1: BatchTableViewCellDelegate, SegmentedControlChangedDelegate {
    
    func didEditBathcCellTextField(indexPath: Int, changedField: String) {
        
        let stringIntoDouble = Double(changedField) ?? 0.0
        
        if batchedCellDataArray[indexPath].segmentedControlSelectedIndex == 0 {
            let bottleIntoMls = stringIntoDouble * 1000
            batchedInitialCocktailsNumber = bottleIntoMls / batchedCellDataArray[indexPath].mlAmount
        } else {
            let bottleIntoMls = stringIntoDouble * 750
            batchedInitialCocktailsNumber = bottleIntoMls / batchedCellDataArray[indexPath].mlAmount
    
        }
        
        doBatchMath()
        
    }
    
    func didChangeSegmentedControl(selectedIndex: Int, indexPath: Int) {
        
        batchedCellDataArray[indexPath].segmentedControlSelectedIndex = selectedIndex
        doBatchMath()
        
    }
    
}

