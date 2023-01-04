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
    
    var labelHeight = CGFloat(40)
    init(cocktail: Cocktail) {
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
                    print(batchedIngredientArray[i])
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
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return batchedCellDataArray.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = batchIngredientsTableView.dequeueReusableCell(withIdentifier: TotalBatchTableViewCell.batchCellIdentifier, for: indexPath) as! TotalBatchTableViewCell
        cell.segmentedControlDelegate = self
        cell.textFieldDelegate = self
        
        cell.bottleNumberTextField.tag = indexPath.row
        
        cell.backgroundColor = UIColor.clear
        cell.segmentedControl.tag = indexPath.row
        
        cell.bottleNumberTextField.text = String(batchedCellDataArray[indexPath.row].wholeBottles)
        cell.remainingMlsTextField.text = String(batchedCellDataArray[indexPath.row].remainingMls)
        cell.totalBatchIngredientNameLabel.text = batchedCellDataArray[indexPath.row].ingredientName
        cell.segmentedControl.selectedSegmentIndex = batchedCellDataArray[indexPath.row].segmentedControlSelectedIndex
        
        return cell
    }
    
    func doBatchMath() {
        
        cocktailCountTextField.text = String(batchedInitialCocktailsNumber.truncate(places: 2))
        
        let stringToNumberOzAmount1 = Double(batchedOzAmount1) ?? 0.0
        let stringToNumberOzAmount2 = Double(batchedOzAmount2) ?? 0.0
        let stringToNumberOzAmount3 = Double(batchedOzAmount3) ?? 0.0
        let stringToNumberOzAmount4 = Double(batchedOzAmount4) ?? 0.0
        let stringToNumberOzAmount5 = Double(batchedOzAmount5) ?? 0.0
        let stringToNumberOzAmount6 = Double(batchedOzAmount6) ?? 0.0
        let stringToNumberOzAmount7 = Double(batchedOzAmount7) ?? 0.0
        let stringToNumberOzAmount8 = Double(batchedOzAmount8) ?? 0.0
        let stringToNumberOzAmount9 = Double(batchedOzAmount9) ?? 0.0
        let stringToNumberOzAmount10 = Double(batchedOzAmount10) ?? 0.0
        let stringToNumberOzAmount11 = Double(batchedOzAmount11) ?? 0.0
        let stringToNumberOzAmount12 = Double(batchedOzAmount12) ?? 0.0
        let stringToNumberOzAmount13 = Double(batchedOzAmount13) ?? 0.0
        let stringToNumberOzAmount14 = Double(batchedOzAmount14) ?? 0.0
        let stringToNumberOzAmount15 = Double(batchedOzAmount15) ?? 0.0
        let stringToNumberOzAmount16 = Double(batchedOzAmount16) ?? 0.0
        
        
        mlAmount1 = stringToNumberOzAmount1 * 29.5735
        mlAmount2 = stringToNumberOzAmount2 * 29.5735
        mlAmount3 = stringToNumberOzAmount3 * 29.5735
        mlAmount4 = stringToNumberOzAmount4 * 29.5735
        mlAmount5 = stringToNumberOzAmount5 * 29.5735
        mlAmount6 = stringToNumberOzAmount6 * 29.5735
        mlAmount7 = stringToNumberOzAmount7 * 29.5735
        mlAmount8 = stringToNumberOzAmount8 * 29.5735
        mlAmount9 = stringToNumberOzAmount9 * 29.5735
        mlAmount10 = stringToNumberOzAmount10 * 29.5735
        mlAmount11 = stringToNumberOzAmount11 * 29.5735
        mlAmount12 = stringToNumberOzAmount12 * 29.5735
        mlAmount13 = stringToNumberOzAmount13 * 29.5735
        mlAmount14 = stringToNumberOzAmount14 * 29.5735
        mlAmount15 = stringToNumberOzAmount15 * 29.5735
        mlAmount16 = stringToNumberOzAmount16 * 29.5735
        let mlAmountArray = [mlAmount1, mlAmount2, mlAmount3, mlAmount4, mlAmount5, mlAmount6, mlAmount7, mlAmount8, mlAmount9, mlAmount10, mlAmount11, mlAmount12, mlAmount13, mlAmount14, mlAmount15, mlAmount16]
        for i in 0..<batchedCellDataArray.count {
            batchedCellDataArray[i].mlAmount = mlAmountArray[i]
        }

       

        let doubleToInt1 = 0.0
        let doubleToInt2 = 0.0
        let doubleToInt3 = 0.0
        let doubleToInt4 = 0.0
        let doubleToInt5 = 0.0
        let doubleToInt6 = 0.0
        let doubleToInt7 = 0.0
        let doubleToInt8 = 0.0
        let doubleToInt9 = 0.0
        let doubleToInt10 = 0.0
        let doubleToInt11 = 0.0
        let doubleToInt12 = 0.0
        let doubleToInt13 = 0.0
        let doubleToInt14 = 0.0
        let doubleToInt15 = 0.0
        let doubleToInt16 = 0.0
        
        let wholeBottles1 = 0
        let wholeBottles2 = 0
        let wholeBottles3 = 0
        let wholeBottles4 = 0
        let wholeBottles5 = 0
        let wholeBottles6 = 0
        let wholeBottles7 = 0
        let wholeBottles8 = 0
        let wholeBottles9 = 0
        let wholeBottles10 = 0
        let wholeBottles11 = 0
        let wholeBottles12 = 0
        let wholeBottles13 = 0
        let wholeBottles14 = 0
        let wholeBottles15 = 0
        let wholeBottles16 = 0



        let litersArray = [wholeBottles1, wholeBottles2, wholeBottles3, wholeBottles4, wholeBottles5, wholeBottles6, wholeBottles7, wholeBottles8, wholeBottles9, wholeBottles10, wholeBottles11, wholeBottles12, wholeBottles13, wholeBottles14, wholeBottles15, wholeBottles16]
        
       
        var wholeMlPerIngredientAmount = [doubleToInt1 ,doubleToInt2 ,doubleToInt3 , doubleToInt4, doubleToInt5, doubleToInt6, doubleToInt7, doubleToInt8 ,doubleToInt9 ,doubleToInt10 , doubleToInt11, doubleToInt12, doubleToInt13, doubleToInt14,doubleToInt15, doubleToInt16]
      

        

        
        for i in 0..<batchedCellDataArray.count {
            
            wholeMlPerIngredientAmount[i] = batchedCellDataArray[i].mlAmount * batchedInitialCocktailsNumber
            //print("\(batchedCellDataArray[i].ingredientName) is multiplied by \(batchedInitialCocktailsNumber) with it's initial value \(batchedCellDataArray[i].mlAmount) to get \(wholeMlPerIngredientAmount[i]) ")
            if batchedCellDataArray[i].segmentedControlSelectedIndex == 1 {
                
                let mathfor750s = mlLiterMath(mlsIngredientVolume: Int(wholeMlPerIngredientAmount[i]))
                batchedCellDataArray[i].wholeBottles = mathfor750s.whole750sCount
                batchedCellDataArray[i].remainingMls = mathfor750s.remaining750Mls
                
            } else {
                
                let literMath = oneLiterMath(mlsIngredientVolume: Int(wholeMlPerIngredientAmount[i]))
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
        let actualDilutionPercentageNumber = conformedDilutionPercentage / 100.0
        let mathMlDilutionAmount = Double(totalVolumePreDilution) * actualDilutionPercentageNumber
        let mathLiterDilutionAmount = mathMlDilutionAmount / 1000
        
        
        literDilutionAmount = mathLiterDilutionAmount
        mlDilutionAmouunt = mathMlDilutionAmount
        totalDilutionTextField.text = "\(Int(mlDilutionAmouunt))mls"
       
        var totalVolumeInMls = totalVolumePreDilution + Int(mlDilutionAmouunt)
        var totalVolumeInLiters = Double(totalVolumeInMls) / 1000.0
        
        totalVolumeLabel.text = "Total Volume = \(totalVolumeInMls)mls (\(totalVolumeInLiters)Liters)"
        
        batchedTotalVolume = totalVolumeInMls
        batchIngredientsTableView.reloadData()
    }
    
    func configureTopAnchorFields() {
        view.addSubview(cocktailCountLabel)
        view.addSubview(cocktailCountTextField)
        view.addSubview(totalDilutionTextField)
        view.addSubview(totalDilutionLabel)
        view.addSubview(totalVolumeLabel)
        view.addSubview(tableViewLabel)
        tableViewLabel.text = "   Ingredient Name:        Btl. Size:      # of btls/remaining mls: "
        cocktailCountLabel.text = "Total Number of Cocktails:"
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
            cocktailCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            cocktailCountLabel.topAnchor.constraint(equalTo: cocktailCountTextField.topAnchor),
            cocktailCountLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            
            cocktailCountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            cocktailCountTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            cocktailCountTextField.heightAnchor.constraint(equalToConstant: labelHeight),
            cocktailCountTextField.widthAnchor.constraint(equalToConstant: 70),
      
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
                                                                   ingredient1Amount: totalMlsForIngredient1,
                                                                   ingredient2Amount: totalMlsForIngredient2,
                                                                   ingredient3Amount: totalMlsForIngredient3,
                                                                   ingredient4Amount: totalMlsForIngredient4,
                                                                   ingredient5Amount: totalMlsForIngredient5,
                                                                   ingredient6Amount: totalMlsForIngredient6,
                                                                   ingredient7Amount: totalMlsForIngredient7,
                                                                   ingredient8Amount: totalMlsForIngredient8,
                                                                   ingredient9Amount: totalMlsForIngredient9,
                                                                   ingredient10Amount: totalMlsForIngredient10,
                                                                   ingredient11Amount: totalMlsForIngredient11,
                                                                   ingredient12Amount: totalMlsForIngredient12,
                                                                   ingredient13Amount: totalMlsForIngredient13,
                                                                   ingredient14Amount: totalMlsForIngredient14,
                                                                   ingredient15Amount: totalMlsForIngredient15,
                                                                   ingredient16Amount: totalMlsForIngredient16,
                                                                   dilutionAmount: mlDilutionAmouunt,
                                                                   dilutionName: batchedDilutionType,
                                                                   totalVolume: batchedTotalVolume), animated: true)
        
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
        
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
            print(" bottle into mls = \(bottleIntoMls) and the ingredient mlsAmount = \(batchedCellDataArray[indexPath].mlAmount)")
            print("the index path = \(indexPath)")
        } else {
            let bottleIntoMls = stringIntoDouble * 750
            batchedInitialCocktailsNumber = bottleIntoMls / batchedCellDataArray[indexPath].mlAmount
            print(" bottle into mls = \(bottleIntoMls) and the ingredient mlsAmount = \(batchedCellDataArray[indexPath].mlAmount)")
            print("the index path = \(indexPath)")
        }
        
        doBatchMath()
        
    }
    
    func didChangeSegmentedControl(selectedIndex: Int, indexPath: Int) {
        
        batchedCellDataArray[indexPath].segmentedControlSelectedIndex = selectedIndex
        doBatchMath()
        
    }
    
}
