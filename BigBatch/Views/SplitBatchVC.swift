//
//  SplitBatchVC.swift
//  BigBatch
//
//  Created by James on 12/15/22.
//

import UIKit

class SplitBatchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableViewLabel = TypeLabel()
    let cellIdentifier = "cell1"

    var splitBatchCellData = SplitBatchCellData()
    var splitBatchCellDataArray: [SplitBatchCellData] = []
    var batchedCocktailName = ""

    let cocktail = Cocktail()

    
    var cocktailCountLabel = TypeLabel()
    var containerTypeLabel = TypeLabel()
    var wholeContainerLabel = TypeLabel()
    var wholeContainerBatchTableView = UITableView()
    var remainderContainerLabel = TypeLabel()
    var remainderContainerBatchTableView = UITableView()
    var totalVolumeLabel = TypeLabel()
    
    var labelHeight = CGFloat(40)
  
    
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
    var batchedTotalAmount1 = 0
    var batchedTotalAmount2 = 0
    var batchedTotalAmount3 = 0
    var batchedTotalAmount4 = 0
    var batchedTotalAmount5 = 0
    var batchedTotalAmount6 = 0
    var batchedTotalAmount7 = 0
    var batchedTotalAmount8 = 0
    var batchedTotalAmount9 = 0
    var batchedTotalAmount10 = 0
    var batchedTotalAmount11 = 0
    var batchedTotalAmount12 = 0
    var batchedTotalAmount13 = 0
    var batchedTotalAmount14 = 0
    var batchedTotalAmount15 = 0
    var batchedTotalAmount16 = 0
    
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
    var singleDilution = 0.0
    
    var totalDilution = 0.0
    var totalDilutionName = ""
    var totalContainerCount = 0.0
    var batchedTotalVolume = 0
    var containerSize = 0
    var containerName = ""
    
    var actualBatchedContainerSize = 0.0
    var singleCocktailAmountInMls = 0.0
    var numberOfCocktailsPerFullContainer = 0.0
    var numberOfCocktailsPerRemainderContainer = 0.0
    var remainderBatch = 0
    
    var wholeContainerIntAmount = 0
    var totalCocktailCount = 0.0
    
    init(ingredient1Name: String,
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
         ingredient1Amount: Int,
         ingredient2Amount: Int,
         ingredient3Amount: Int,
         ingredient4Amount: Int,
         ingredient5Amount: Int,
         ingredient6Amount: Int,
         ingredient7Amount: Int,
         ingredient8Amount: Int,
         ingredient9Amount: Int,
         ingredient10Amount: Int,
         ingredient11Amount: Int,
         ingredient12Amount: Int,
         ingredient13Amount: Int,
         ingredient14Amount: Int,
         ingredient15Amount: Int,
         ingredient16Amount: Int,
         singleIngredientAmount1: Double,
         singleIngredientAmount2: Double,
         singleIngredientAmount3: Double,
         singleIngredientAmount4: Double,
         singleIngredientAmount5: Double,
         singleIngredientAmount6: Double,
         singleIngredientAmount7: Double,
         singleIngredientAmount8: Double,
         singleIngredientAmount9: Double,
         singleIngredientAmount10: Double,
         singleIngredientAmount11: Double,
         singleIngredientAmount12: Double,
         singleIngredientAmount13: Double,
         singleIngredientAmount14: Double,
         singleIngredientAmount15: Double,
         singleIngredientAmount16: Double,
         singleDilutionAmount: Double,
         dilutionAmount: Double,
         dilutionName: String,
         batchContainerSize: Int,
         containerSizeName: String,
         totalVolume: Int,
         singleCocktailAmount: Int,
         cocktailCount: Double,
         cocktailName: String){
        
        batchedIngredient1 = ingredient1Name
        batchedIngredient2 = ingredient2Name
        batchedIngredient3 = ingredient3Name
        batchedIngredient4 = ingredient4Name
        batchedIngredient5 = ingredient5Name
        batchedIngredient6 = ingredient6Name
        batchedIngredient7 = ingredient7Name
        batchedIngredient8 = ingredient8Name
        batchedIngredient9 = ingredient9Name
        batchedIngredient10 = ingredient10Name
        batchedIngredient11 = ingredient11Name
        batchedIngredient12 = ingredient12Name
        batchedIngredient13 = ingredient13Name
        batchedIngredient14 = ingredient14Name
        batchedIngredient15 = ingredient15Name
        batchedIngredient16 = ingredient16Name
        batchedTotalAmount1 = ingredient1Amount
        batchedTotalAmount2 = ingredient2Amount
        batchedTotalAmount3 = ingredient3Amount
        batchedTotalAmount4 = ingredient4Amount
        batchedTotalAmount5 = ingredient5Amount
        batchedTotalAmount6 = ingredient6Amount
        batchedTotalAmount7 = ingredient7Amount
        batchedTotalAmount8 = ingredient8Amount
        batchedTotalAmount9 = ingredient9Amount
        batchedTotalAmount10 = ingredient10Amount
        batchedTotalAmount11 = ingredient11Amount
        batchedTotalAmount12 = ingredient12Amount
        batchedTotalAmount13 = ingredient13Amount
        batchedTotalAmount14 = ingredient14Amount
        batchedTotalAmount15 = ingredient15Amount
        batchedTotalAmount16 = ingredient16Amount
        totalDilution = dilutionAmount
        totalDilutionName = dilutionName
        containerSize = batchContainerSize
        containerName = containerSizeName
        batchedTotalVolume = totalVolume
        singleCocktailAmountInMls = Double(singleCocktailAmount)
        mlAmount1 = singleIngredientAmount1
        mlAmount2 = singleIngredientAmount2
        mlAmount3 = singleIngredientAmount3
        mlAmount4 = singleIngredientAmount4
        mlAmount5 = singleIngredientAmount5
        mlAmount6 = singleIngredientAmount6
        mlAmount7 = singleIngredientAmount7
        mlAmount8 = singleIngredientAmount8
        mlAmount9 = singleIngredientAmount9
        mlAmount10 = singleIngredientAmount10
        mlAmount11 = singleIngredientAmount11
        mlAmount12 = singleIngredientAmount12
        mlAmount13 = singleIngredientAmount13
        mlAmount14 = singleIngredientAmount14
        mlAmount15 = singleIngredientAmount15
        mlAmount16 = singleIngredientAmount16
        singleDilution = singleDilutionAmount
        totalCocktailCount = cocktailCount
        batchedCocktailName = cocktailName
        let batchedIngredientArray = [batchedIngredient1,batchedIngredient2,batchedIngredient3,batchedIngredient4,batchedIngredient5, batchedIngredient6,batchedIngredient7,batchedIngredient8,batchedIngredient9,batchedIngredient10,batchedIngredient11,batchedIngredient12,batchedIngredient13,batchedIngredient14,batchedIngredient15, batchedIngredient16]
        let batchedTotalAmountArray = [batchedTotalAmount1, batchedTotalAmount2, batchedTotalAmount3, batchedTotalAmount4, batchedTotalAmount5, batchedTotalAmount6, batchedTotalAmount7, batchedTotalAmount8, batchedTotalAmount9, batchedTotalAmount10, batchedTotalAmount11, batchedTotalAmount12, batchedTotalAmount13, batchedTotalAmount14, batchedTotalAmount15, batchedTotalAmount16]
        let mlAmountArray = [mlAmount1, mlAmount2, mlAmount3, mlAmount4, mlAmount5, mlAmount6, mlAmount7, mlAmount8, mlAmount9, mlAmount10, mlAmount11, mlAmount12, mlAmount13, mlAmount14, mlAmount15, mlAmount16]

        for i in 0..<batchedIngredientArray.count{
            if batchedIngredientArray[i] != ""{
                splitBatchCellData.ingredientName = batchedIngredientArray[i]
                print("ig name is \(splitBatchCellData.ingredientName)")
                splitBatchCellData.totalVolumeInBatchamount = batchedTotalAmountArray[i]
                print("Amount is \(splitBatchCellData.totalVolumeInBatchamount)")
                splitBatchCellData.singleCocktailIngredientAmount = mlAmountArray[i]
                splitBatchCellDataArray.append(splitBatchCellData)
                print(splitBatchCellDataArray.count)
            }
        }
        if totalDilutionName != ""{
            splitBatchCellData.ingredientName = totalDilutionName
            splitBatchCellData.singleCocktailIngredientAmount = singleDilution
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
        title = "Split Batch: \(batchedCocktailName)"
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
        
        csvHead.append(" \n \n ,       Total \(containerName) containers needed =,\(totalContainerCount) \n,  Remaining ml. in last container =, \(remainderBatch)")
        
        if totalContainerCount > 1.0 {
            
            csvHead.append(" \n \n, RECIPE FOR A \(containerName.capitalized) CONTAINER \n, ")
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
        
        csvHead.append(" \n , TOTAL COCKTAIL COUNT = \(totalCocktailCount)")
        
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
        view.addSubview(cocktailCountLabel)
        view.addSubview(containerTypeLabel)
        view.addSubview(wholeContainerLabel)
        view.addSubview(wholeContainerBatchTableView)
        view.addSubview(remainderContainerLabel)
        view.addSubview(remainderContainerBatchTableView)
        view.addSubview(totalVolumeLabel)

        wholeContainerBatchTableView.layer.borderWidth = 1
        wholeContainerBatchTableView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        wholeContainerBatchTableView.layer.cornerRadius = 10
        
        remainderContainerBatchTableView.layer.borderWidth = 1
        remainderContainerBatchTableView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        remainderContainerBatchTableView.layer.cornerRadius = 10
    
        containerTypeLabel.text = "Container Size: \(containerName)"
        containerTypeLabel.textAlignment = .center
        
        cocktailCountLabel.text = "Container Count: \(totalContainerCount)"
        cocktailCountLabel.textAlignment = .center
        
        wholeContainerLabel.text = "Whole containter batch recipe:"
        wholeContainerLabel.textColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1.0)
        wholeContainerLabel.backgroundColor = .white
        wholeContainerLabel.textAlignment = .center
        
        remainderContainerLabel.text = "Remaininder batch recipe:"
        remainderContainerLabel.textColor = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0)
        remainderContainerLabel.backgroundColor = .white
        remainderContainerLabel.textAlignment = .center
        
        wholeContainerBatchTableView.translatesAutoresizingMaskIntoConstraints = false
        wholeContainerBatchTableView.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 0.0)
        
        remainderContainerBatchTableView.translatesAutoresizingMaskIntoConstraints = false
        remainderContainerBatchTableView.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 0.0)
        NSLayoutConstraint.activate([
            containerTypeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            containerTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            containerTypeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            containerTypeLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            
            cocktailCountLabel.topAnchor.constraint(equalTo: containerTypeLabel.bottomAnchor),
            cocktailCountLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            cocktailCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            cocktailCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            
            wholeContainerLabel.topAnchor.constraint(equalTo: cocktailCountLabel.bottomAnchor),
            wholeContainerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            wholeContainerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            wholeContainerLabel.heightAnchor.constraint(equalToConstant: 25),
            
            wholeContainerBatchTableView.topAnchor.constraint(equalTo: wholeContainerLabel.bottomAnchor),
            wholeContainerBatchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            wholeContainerBatchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            wholeContainerBatchTableView.bottomAnchor.constraint(equalTo: remainderContainerLabel.topAnchor),
            
            remainderContainerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60),
            remainderContainerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            remainderContainerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            remainderContainerLabel.heightAnchor.constraint(equalToConstant: 25),
            
            remainderContainerBatchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            remainderContainerBatchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            remainderContainerBatchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            remainderContainerBatchTableView.topAnchor.constraint(equalTo: remainderContainerLabel.bottomAnchor),

        
        ])
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return splitBatchCellDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SplitBatchTableViewCell
        let colorArray = [cocktail.blue, cocktail.red, cocktail.orange, cocktail.lightOrange, cocktail.forestGreen, cocktail.blue, cocktail.red, cocktail.orange, cocktail.lightOrange, cocktail.forestGreen, cocktail.blue, cocktail.red, cocktail.orange, cocktail.lightOrange, cocktail.forestGreen, cocktail.blue ]
        switch tableView {
        case wholeContainerBatchTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SplitBatchTableViewCell
            cell.ingredientNameField.text = splitBatchCellDataArray[indexPath.row].ingredientName
           
            cell.backgroundColor = colorArray[indexPath.row]
            if indexPath.row == splitBatchCellDataArray.count - 1 {
                cell.backgroundColor = cocktail.teal
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
                cell.backgroundColor = cocktail.teal
            }
        default:
            print("oops! Something Went Wrong!")
        }
  
        return cell

    }
    func doSplitBatchMath() {
        
        let twentyPercentBatchSize = Double(containerSize) * 0.2
        actualBatchedContainerSize = Double(containerSize) - twentyPercentBatchSize
        let containerCount = Double(batchedTotalVolume) / actualBatchedContainerSize
        let truncatedContainerCount = containerCount.truncate(places: 2)
        totalContainerCount = truncatedContainerCount
        
        numberOfCocktailsPerFullContainer = actualBatchedContainerSize / singleCocktailAmountInMls
       
        remainderBatch = batchedTotalVolume % Int(actualBatchedContainerSize)
       
        numberOfCocktailsPerRemainderContainer = Double(remainderBatch) / singleCocktailAmountInMls
    }
    

    
    func refreshBackground() {
        let gradientLayer = CAGradientLayer.gradientLayer(for: .savedBatches, in: view.frame)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
   
    }


}

