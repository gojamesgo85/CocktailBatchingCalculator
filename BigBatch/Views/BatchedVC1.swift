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
    var batchedInitialCocktailsNumber = 0.0
    var splitBatchModelData = SplitBatchCocktailModel()
    var cocktail = CocktailModel()
    let colorPalette = ColorPalette()
    var cocktailCountTextField = CocktailIngredientAmountTF()
    var cocktailCountLabel = TypeLabel()
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
    var mlAmountsArray: [Double] = []
    var batchedAmountArray: [String] = []
    var labelHeight = CGFloat(40)
    init(cocktail: CocktailModel) {
        self.cocktail = cocktail
        batchedInitialCocktailsNumber = Double(cocktail.initialCocktailsNumber) ?? 0.0
        let batchedIngredientArray = cocktail.getNames()
        self.batchedAmountArray = cocktail.getAmounts()
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
        title = "Total Batch: \(cocktail.cocktailName)"
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
        
        
        let fileName = "Total Batch \(cocktail.cocktailName).csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvHead = "\(cocktail.cocktailName), Ingredients, Whole Liters, Remaining ml. \n"
        
        for i in 0..<batchedCellDataArray.count {
            
            csvHead.append(", \(batchedCellDataArray[i].ingredientName), \(batchedCellDataArray[i].wholeBottles), \(batchedCellDataArray[i].remainingMls) \n")
            
        }
        csvHead.append(", \n, Dilution (\(cocktail.dilutionType)) , \(literDilutionAmount.truncate(places: 3))Liters")
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
        let colorArray = colorPalette.getTableViewColors()
        
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
  
        

        mlAmountsArray = batchedAmountArray.map({ return (Double($0) ?? 00) * 29.5735 })
        for i in 0..<batchedCellDataArray.count {
            batchedCellDataArray[i].mlAmount = mlAmountsArray[i]
        }

        var mlAmountsForMath = mlAmountsArray
        for i in 0..<batchedCellDataArray.count {
            
            mlAmountsForMath[i] = batchedCellDataArray[i].mlAmount * batchedInitialCocktailsNumber
           
            if batchedCellDataArray[i].segmentedControlSelectedIndex == 1 {
                
                let mathfor750s = mlLiterMath(mlsIngredientVolume: Int(ceil(mlAmountsForMath[i])))
                batchedCellDataArray[i].wholeBottles = mathfor750s.whole750sCount
                batchedCellDataArray[i].remainingMls = mathfor750s.remaining750Mls
                
            } else {
                
                let literMath = oneLiterMath(mlsIngredientVolume: Int(ceil(mlAmountsForMath[i])))
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
        
      
        let conformedDilutionPercentage = Double(cocktail.dilutionPercentage) ?? 0.0
        actualDilutionPercentageNumber = conformedDilutionPercentage / 100.0
        mlDilutionAmouunt = Double(totalVolumePreDilution) * actualDilutionPercentageNumber
        literDilutionAmount = mlDilutionAmouunt / 1000
        
        totalDilutionLabel.text = "Total Dilution (\(cocktail.dilutionType)) = \(Int(mlDilutionAmouunt))ml"
        totalDilutionLabel.textColor = .white
       
        let totalVolumeInMls = totalVolumePreDilution + Int(ceil(mlDilutionAmouunt))
        let totalVolumeInLiters = Double(totalVolumeInMls) / 1000.0
        
        totalVolumeLabel.text = "Total Volume = \(totalVolumeInMls)ml (\(totalVolumeInLiters)Liters)"
        
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
        
        splitBatchModelData.cocktailName = cocktail.cocktailName
        splitBatchModelData.ingredient1Name  = cocktail.ingredient1Name
        splitBatchModelData.ingredient2Name  = cocktail.ingredient2Name
        splitBatchModelData.ingredient3Name  = cocktail.ingredient3Name
        splitBatchModelData.ingredient4Name  = cocktail.ingredient4Name
        splitBatchModelData.ingredient5Name  = cocktail.ingredient5Name
        splitBatchModelData.ingredient6Name  = cocktail.ingredient6Name
        splitBatchModelData.ingredient7Name  = cocktail.ingredient7Name
        splitBatchModelData.ingredient8Name  = cocktail.ingredient8Name
        splitBatchModelData.ingredient9Name  = cocktail.ingredient9Name
        splitBatchModelData.ingredient10Name = cocktail.ingredient10Name
        splitBatchModelData.ingredient11Name = cocktail.ingredient11Name
        splitBatchModelData.ingredient12Name = cocktail.ingredient12Name
        splitBatchModelData.ingredient13Name = cocktail.ingredient13Name
        splitBatchModelData.ingredient14Name = cocktail.ingredient14Name
        splitBatchModelData.ingredient15Name = cocktail.ingredient15Name
        splitBatchModelData.ingredient16Name = cocktail.ingredient16Name
        splitBatchModelData.ingredient1Amount = totalMlsArray[0]
        splitBatchModelData.ingredient2Amount = totalMlsArray[1]
        splitBatchModelData.ingredient3Amount = totalMlsArray[2]
        splitBatchModelData.ingredient4Amount = totalMlsArray[3]
        splitBatchModelData.ingredient5Amount = totalMlsArray[4]
        splitBatchModelData.ingredient6Amount = totalMlsArray[5]
        splitBatchModelData.ingredient7Amount = totalMlsArray[6]
        splitBatchModelData.ingredient8Amount = totalMlsArray[7]
        splitBatchModelData.ingredient9Amount = totalMlsArray[8]
        splitBatchModelData.ingredient10Amount = totalMlsArray[9]
        splitBatchModelData.ingredient11Amount = totalMlsArray[10]
        splitBatchModelData.ingredient12Amount = totalMlsArray[11]
        splitBatchModelData.ingredient13Amount = totalMlsArray[12]
        splitBatchModelData.ingredient14Amount = totalMlsArray[13]
        splitBatchModelData.ingredient15Amount = totalMlsArray[14]
        splitBatchModelData.ingredient16Amount = totalMlsArray[15]
        splitBatchModelData.dilutionAmount = mlDilutionAmouunt
        splitBatchModelData.dilutionName = cocktail.dilutionType
        splitBatchModelData.totalVolume = batchedTotalVolume
        splitBatchModelData.singleIngredientAmount1 = mlAmountsArray[0]
        splitBatchModelData.singleIngredientAmount2 = mlAmountsArray[1]
        splitBatchModelData.singleIngredientAmount3 = mlAmountsArray[2]
        splitBatchModelData.singleIngredientAmount4 = mlAmountsArray[3]
        splitBatchModelData.singleIngredientAmount5 = mlAmountsArray[4]
        splitBatchModelData.singleIngredientAmount6 = mlAmountsArray[5]
        splitBatchModelData.singleIngredientAmount7 = mlAmountsArray[6]
        splitBatchModelData.singleIngredientAmount8 = mlAmountsArray[7]
        splitBatchModelData.singleIngredientAmount9 = mlAmountsArray[8]
        splitBatchModelData.singleIngredientAmount10 = mlAmountsArray[9]
        splitBatchModelData.singleIngredientAmount11 = mlAmountsArray[10]
        splitBatchModelData.singleIngredientAmount12 = mlAmountsArray[11]
        splitBatchModelData.singleIngredientAmount13 = mlAmountsArray[12]
        splitBatchModelData.singleIngredientAmount14 = mlAmountsArray[13]
        splitBatchModelData.singleIngredientAmount15 = mlAmountsArray[14]
        splitBatchModelData.singleIngredientAmount16 = mlAmountsArray[15]
        splitBatchModelData.singleDilutionAmount = singleCoctailDilutionMls
        splitBatchModelData.singleCocktailAmount = singleCocktailVolume
        splitBatchModelData.cocktailCount = batchedInitialCocktailsNumber
        
        
        
        navigationController?.pushViewController(ChooseContainerVC(cocktailDataModel: splitBatchModelData), animated: true)
        
    }
    
    func configureTopAnchorFields() {
        view.addSubview(cocktailCountLabel)
        view.addSubview(cocktailCountTextField)
        view.addSubview(totalDilutionLabel)
        view.addSubview(totalVolumeLabel)
        view.addSubview(tableViewLabel)
        tableViewLabel.text = "Ingredient Name:        Btl. Size:      # of btls/remaining mls: "
        tableViewLabel.textColor = .white
        cocktailCountLabel.text = "Cocktail Count:"
        cocktailCountLabel.textColor = .white
        
        totalDilutionLabel.textAlignment = .center
        totalVolumeLabel.text = "Total Volume in Liters:"
        totalVolumeLabel.textColor = .white
        totalVolumeLabel.textAlignment = .center
        
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
      
            totalDilutionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            totalDilutionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            totalDilutionLabel.bottomAnchor.constraint(equalTo: totalVolumeLabel.topAnchor, constant: -5),
            totalDilutionLabel.heightAnchor.constraint(equalToConstant: labelHeight),

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
            batchIngredientsTableView.bottomAnchor.constraint(equalTo: totalDilutionLabel.topAnchor, constant: -5),
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

