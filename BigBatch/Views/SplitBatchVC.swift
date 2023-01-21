//
//  SplitBatchVC.swift
//  BigBatch
//
//  Created by James on 12/15/22.
//

import UIKit

class SplitBatchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    let cellIdentifier = "cell1"

    var splitBatchCellData = SplitBatchCellData()
    var splitBatchCellDataArray: [SplitBatchCellData] = []
    var batchedCocktailName = ""

    let cocktail = CocktailModel()
    let colorPalette = ColorPalette()

    
    var cocktailCountLabel = TypeLabel()
    var containerTypeAndCountLabel = TypeLabel()
    var wholeContainerLabel = TypeLabel()
    var wholeContainerBatchTableView = UITableView()
    var remainderContainerLabel = TypeLabel()
    var remainderContainerBatchTableView = UITableView()
   
    
    var labelHeight = CGFloat(40)

    var totalContainerCount = 0.0

    var actualBatchedContainerSize = 0.0
    var singleCocktailAmountInMls = 0.0
    var numberOfCocktailsPerFullContainer = 0.0
    var numberOfCocktailsPerRemainderContainer = 0.0
    var remainderBatch = 0
    
    var wholeContainerIntAmount = 0
    var splitBatchVCModelData = SplitBatchCocktailModel()
    init(splitBatchDataModel: SplitBatchCocktailModel){
       
        self.splitBatchVCModelData = splitBatchDataModel
        let batchedIngredientArray = [splitBatchVCModelData.ingredient1Name, splitBatchVCModelData.ingredient2Name, splitBatchVCModelData.ingredient3Name, splitBatchVCModelData.ingredient4Name, splitBatchVCModelData.ingredient5Name, splitBatchVCModelData.ingredient6Name, splitBatchVCModelData.ingredient7Name, splitBatchVCModelData.ingredient8Name, splitBatchVCModelData.ingredient9Name, splitBatchVCModelData.ingredient10Name, splitBatchVCModelData.ingredient11Name, splitBatchVCModelData.ingredient12Name, splitBatchVCModelData.ingredient13Name, splitBatchVCModelData.ingredient14Name, splitBatchVCModelData.ingredient15Name, splitBatchVCModelData.ingredient16Name]
        let batchedTotalAmountArray = [splitBatchVCModelData.ingredient1Amount, splitBatchVCModelData.ingredient2Amount, splitBatchVCModelData.ingredient3Amount, splitBatchVCModelData.ingredient4Amount, splitBatchVCModelData.ingredient5Amount, splitBatchVCModelData.ingredient6Amount, splitBatchVCModelData.ingredient7Amount, splitBatchVCModelData.ingredient8Amount, splitBatchVCModelData.ingredient9Amount, splitBatchVCModelData.ingredient10Amount, splitBatchVCModelData.ingredient11Amount, splitBatchVCModelData.ingredient12Amount, splitBatchVCModelData.ingredient13Amount, splitBatchVCModelData.ingredient14Amount, splitBatchVCModelData.ingredient15Amount, splitBatchVCModelData.ingredient16Amount]
        let singleIngredientAmountArray = [splitBatchVCModelData.singleIngredientAmount1, splitBatchVCModelData.singleIngredientAmount2, splitBatchVCModelData.singleIngredientAmount3, splitBatchVCModelData.singleIngredientAmount4, splitBatchVCModelData.singleIngredientAmount5, splitBatchVCModelData.singleIngredientAmount6, splitBatchVCModelData.singleIngredientAmount7, splitBatchVCModelData.singleIngredientAmount8, splitBatchVCModelData.singleIngredientAmount9, splitBatchVCModelData.singleIngredientAmount10, splitBatchVCModelData.singleIngredientAmount11, splitBatchVCModelData.singleIngredientAmount12, splitBatchVCModelData.singleIngredientAmount13, splitBatchVCModelData.singleIngredientAmount14, splitBatchVCModelData.singleIngredientAmount15, splitBatchVCModelData.singleIngredientAmount16]
        singleCocktailAmountInMls = singleIngredientAmountArray.reduce(0, +)

        for i in 0..<batchedIngredientArray.count{
            if batchedIngredientArray[i] != ""{
                splitBatchCellData.ingredientName = batchedIngredientArray[i]
                splitBatchCellData.totalVolumeInBatchamount = batchedTotalAmountArray[i]
                splitBatchCellData.singleCocktailIngredientAmount = singleIngredientAmountArray[i]
                splitBatchCellDataArray.append(splitBatchCellData)
            }
        }
        if splitBatchVCModelData.dilutionName != ""{
            splitBatchCellData.ingredientName = splitBatchVCModelData.dilutionName
            splitBatchCellData.singleCocktailIngredientAmount = splitBatchVCModelData.singleDilutionAmount
            splitBatchCellDataArray.append(splitBatchCellData)
        }
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSplitBatchMath()
        
        configureLabelsAndTableViews()
        
        wholeContainerBatchTableView.register(SplitBatchTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        wholeContainerBatchTableView.dataSource = self
        wholeContainerBatchTableView.delegate = self
        
        remainderContainerBatchTableView.register(SplitBatchTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        remainderContainerBatchTableView.dataSource = self
        remainderContainerBatchTableView.delegate = self
        
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20)]
        navigationItem.standardAppearance = appearance
        title = "Split Batch: \(splitBatchVCModelData.cocktailName)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: SFSymbols.export), style: .plain, target: self, action: #selector(exportCSVFile))
    }
    

    override func viewWillAppear(_ animated: Bool) {
        refreshBackground()
        
        super.viewWillAppear(animated)
    }
    
    @objc func exportCSVFile() {
        
        let wholeContainerAmount1 = 0
        let wholeContainerAmount2 = 0
        let wholeContainerAmount3 = 0
        let wholeContainerAmount4 = 0
        let wholeContainerAmount5 = 0
        let wholeContainerAmount6 = 0
        let wholeContainerAmount7 = 0
        let wholeContainerAmount8 = 0
        let wholeContainerAmount9 = 0
        let wholeContainerAmount10 = 0
        let wholeContainerAmount11 = 0
        let wholeContainerAmount12 = 0
        let wholeContainerAmount13 = 0
        let wholeContainerAmount14 = 0
        let wholeContainerAmount15 = 0
        let wholeContainerAmount16 = 0
        
        let remainderContainerAmount1 = 0
        let remainderContainerAmount2 = 0
        let remainderContainerAmount3 = 0
        let remainderContainerAmount4 = 0
        let remainderContainerAmount5 = 0
        let remainderContainerAmount6 = 0
        let remainderContainerAmount7 = 0
        let remainderContainerAmount8 = 0
        let remainderContainerAmount9 = 0
        let remainderContainerAmount10 = 0
        let remainderContainerAmount11 = 0
        let remainderContainerAmount12 = 0
        let remainderContainerAmount13 = 0
        let remainderContainerAmount14 = 0
        let remainderContainerAmount15 = 0
        let remainderContainerAmount16 = 0
        
        var wholeContainerArray = [wholeContainerAmount1, wholeContainerAmount2, wholeContainerAmount3, wholeContainerAmount4, wholeContainerAmount5, wholeContainerAmount6, wholeContainerAmount7, wholeContainerAmount8, wholeContainerAmount9, wholeContainerAmount10, wholeContainerAmount11, wholeContainerAmount12, wholeContainerAmount13, wholeContainerAmount14, wholeContainerAmount15, wholeContainerAmount16]
        
        var remainderContainerArray = [remainderContainerAmount1, remainderContainerAmount2, remainderContainerAmount3, remainderContainerAmount4, remainderContainerAmount5, remainderContainerAmount6, remainderContainerAmount7, remainderContainerAmount8, remainderContainerAmount9, remainderContainerAmount10, remainderContainerAmount11, remainderContainerAmount12, remainderContainerAmount13, remainderContainerAmount14, remainderContainerAmount15, remainderContainerAmount16]
        
        
        
        let fileName = "Split Batch \(batchedCocktailName).csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvHead = "\(batchedCocktailName), Ingredients, Amount in milliliters \n,"
        
        
        for i in 0..<splitBatchCellDataArray.count {
            csvHead.append("\(splitBatchCellDataArray[i].ingredientName), \(splitBatchCellDataArray[i].totalVolumeInBatchamount) \n,")
        }
        
        csvHead.append(" \n \n ,       Total \(splitBatchVCModelData.containerName) containers needed =,\(totalContainerCount) \n,  Remaining ml. in last container =, \(remainderBatch)")
        
        if totalContainerCount > 1.0 {
            
            csvHead.append(" \n \n, RECIPE FOR A \(splitBatchVCModelData.containerName.capitalized) CONTAINER \n, ")
            csvHead.append("  Ingredints , total mLs \n,")
            for i in 0..<splitBatchCellDataArray.count {
                wholeContainerArray[i] = Int(splitBatchCellDataArray[i].singleCocktailIngredientAmount * numberOfCocktailsPerFullContainer)
                
                csvHead.append("  \(splitBatchCellDataArray[i].ingredientName), \(wholeContainerArray[i]) \n, ")
            }
            
        }
        
        
        csvHead.append(" \n  \n, REMEAINDER RECIPE FOR A PARTIAL CONTAINER \n")
        csvHead.append("    , Ingredints , total mLs \n,")
        
        for i in 0..<splitBatchCellDataArray.count {
            remainderContainerArray[i] = Int(splitBatchCellDataArray[i].singleCocktailIngredientAmount * numberOfCocktailsPerRemainderContainer)
            csvHead.append("  \(splitBatchCellDataArray[i].ingredientName), \(remainderContainerArray[i]) \n, ")
        }
        
        csvHead.append(" \n , TOTAL COCKTAIL COUNT = \(splitBatchVCModelData.cocktailCount)")
        
        do {
            try csvHead.write(to: path!, atomically: true, encoding: .utf8)
            let exportSheet = UIActivityViewController(activityItems: [path as Any], applicationActivities: nil)
            self.present(exportSheet, animated: true, completion: nil)
            print("exported")
        } catch {
            print("Error")
        }
    }
    
    func configureLabelsAndTableViews() {
        
        view.addSubview(containerTypeAndCountLabel)
        view.addSubview(wholeContainerLabel)
        view.addSubview(wholeContainerBatchTableView)
        view.addSubview(remainderContainerLabel)
        view.addSubview(remainderContainerBatchTableView)
       

        wholeContainerBatchTableView.layer.borderWidth = 1
        wholeContainerBatchTableView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        wholeContainerBatchTableView.layer.cornerRadius = 10
        
        remainderContainerBatchTableView.layer.borderWidth = 1
        remainderContainerBatchTableView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        remainderContainerBatchTableView.layer.cornerRadius = 10
    
        containerTypeAndCountLabel.text = "Container Size: \(splitBatchVCModelData.containerName) || Count: \(totalContainerCount)"
        containerTypeAndCountLabel.textAlignment = .center
        
     
        
        wholeContainerLabel.text = "Whole containter batch recipe:"
        wholeContainerLabel.textColor = .white
        wholeContainerLabel.backgroundColor = .clear
        wholeContainerLabel.textAlignment = .center
        wholeContainerLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        remainderContainerLabel.text = "Remaininder batch recipe:"
        remainderContainerLabel.textColor = .white
        remainderContainerLabel.backgroundColor = .clear
        remainderContainerLabel.textAlignment = .center
        remainderContainerLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        wholeContainerBatchTableView.translatesAutoresizingMaskIntoConstraints = false
        wholeContainerBatchTableView.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 0.0)
        
        remainderContainerBatchTableView.translatesAutoresizingMaskIntoConstraints = false
        remainderContainerBatchTableView.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 0.0)
        NSLayoutConstraint.activate([
            containerTypeAndCountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 85),
            containerTypeAndCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerTypeAndCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerTypeAndCountLabel.heightAnchor.constraint(equalToConstant: labelHeight),
   
            wholeContainerLabel.topAnchor.constraint(equalTo: containerTypeAndCountLabel.bottomAnchor),
            wholeContainerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            wholeContainerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            wholeContainerLabel.heightAnchor.constraint(equalToConstant: 25),
            
            wholeContainerBatchTableView.topAnchor.constraint(equalTo: wholeContainerLabel.bottomAnchor),
            wholeContainerBatchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wholeContainerBatchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wholeContainerBatchTableView.bottomAnchor.constraint(equalTo: remainderContainerLabel.topAnchor),
            
            remainderContainerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60),
            remainderContainerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            remainderContainerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            remainderContainerLabel.heightAnchor.constraint(equalToConstant: 25),
            
            remainderContainerBatchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            remainderContainerBatchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            remainderContainerBatchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            remainderContainerBatchTableView.topAnchor.constraint(equalTo: remainderContainerLabel.bottomAnchor),

        
        ])
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return splitBatchCellDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SplitBatchTableViewCell
        let colorArray = colorPalette.getTableViewColors()
        switch tableView {
        case wholeContainerBatchTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SplitBatchTableViewCell
            cell.ingredientNameField.text = splitBatchCellDataArray[indexPath.row].ingredientName
           
            cell.backgroundColor = colorArray[indexPath.row]
            if indexPath.row == splitBatchCellDataArray.count - 1 {
                cell.backgroundColor = colorPalette.teal
            }
            if totalContainerCount < 1.0 {
                cell.amountLabel.text = "Insufficient Volume"
            } else {
                let wholeContainerIntAmount = Int(splitBatchCellDataArray[indexPath.row].singleCocktailIngredientAmount * numberOfCocktailsPerFullContainer)
                cell.amountLabel.text = String(wholeContainerIntAmount)+"ml."
            }

        case remainderContainerBatchTableView:
            
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SplitBatchTableViewCell
            cell.ingredientNameField.text = splitBatchCellDataArray[indexPath.row].ingredientName
            let remainderContainerIntAmount = Int(splitBatchCellDataArray[indexPath.row].singleCocktailIngredientAmount * numberOfCocktailsPerRemainderContainer)
            cell.amountLabel.text = String(remainderContainerIntAmount)+"ml."
            
            
            cell.backgroundColor = colorArray[indexPath.row]
            if indexPath.row == splitBatchCellDataArray.count - 1 {
                cell.backgroundColor = colorPalette.teal
            }
        default:
            print("oops! Something Went Wrong!")
        }
  
        return cell

    }
    func doSplitBatchMath() {
        
        let twentyPercentBatchSize = Double(splitBatchVCModelData.containerSize) * 0.2
        actualBatchedContainerSize = Double(splitBatchVCModelData.containerSize) - twentyPercentBatchSize
        let containerCount = Double(splitBatchVCModelData.totalVolume) / actualBatchedContainerSize
        totalContainerCount = containerCount.truncate(places: 2)
        numberOfCocktailsPerFullContainer = actualBatchedContainerSize / Double(splitBatchVCModelData.singleCocktailAmount)
        remainderBatch = splitBatchVCModelData.totalVolume % Int(actualBatchedContainerSize)
        numberOfCocktailsPerRemainderContainer = Double(remainderBatch) / Double(splitBatchVCModelData.singleCocktailAmount)
    }
    func refreshBackground() {
        let gradientLayer = CAGradientLayer.gradientLayer(for: .savedBatches, in: view.frame)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
