//
//  BatchedVC.swift
//  BigBatch
//
//  Created by James on 11/22/22.
//

import UIKit


class BatchedVC: UIViewController {
    var batchedCocktailName:String
    var batchedIngredient1: String
    var batchedIngredient2: String
    var batchedIngredient3: String
    var batchedIngredient4: String
    var batchedIngredient5: String
    var batchedIngredient6: String
    var batchedIngredient7: String
    var dilutionTypeName: String
    
    var ouncesAmount1: Double
    var ouncesAmount2: Double
    var ouncesAmount3: Double
    var ouncesAmount4: Double
    var ouncesAmount5: Double
    var ouncesAmount6: Double
    var ouncesAmount7: Double
    var dilutionPercentageNumber: Double
    
    var initialCocktailNumber: Double
    
    
    
    init(cocktail: Cocktail) {
        
        batchedCocktailName = cocktail.savedCocktailName
        batchedIngredient1 = cocktail.modelIngredient1Name
        batchedIngredient2 = cocktail.modelIngredient2Name
        batchedIngredient3 = cocktail.modelIngredient3Name
        batchedIngredient4 = cocktail.modelIngredient4Name
        batchedIngredient5 = cocktail.modelIngredient5Name
        batchedIngredient6 = cocktail.modelIngredient6Name
        batchedIngredient7 = cocktail.modelIngredient7Name
        dilutionTypeName = cocktail.modelDilutionType
        
        ouncesAmount1 = cocktail.modelOzAmount1
        ouncesAmount2 = cocktail.modelOzAmount2
        ouncesAmount3 = cocktail.modelOzAmount3
        ouncesAmount4 = cocktail.modelOzAmount4
        ouncesAmount5 = cocktail.modelOzAmount5
        ouncesAmount6 = cocktail.modelOzAmount6
        ouncesAmount7 = cocktail.modelOzAmount7
        dilutionPercentageNumber = cocktail.modelDilutionPercentage
        
        initialCocktailNumber = cocktail.modelInitialCocktailsNumber
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    var mlAmount1 = 0.0
    var mlAmount2 = 0.0
    var mlAmount3 = 0.0
    var mlAmount4 = 0.0
    var mlAmount5 = 0.0
    var mlAmount6 = 0.0
    var mlAmount7 = 0.0
    
    let mlLabel = BatchSizeType()
    let ingredientsLabel = BatchSizeType()
    let oneLiterLabel = BatchSizeType()
    let orLabel = BatchSizeType()
    
    var ingredient1 = BatchSizeType()
    var ingredient2 = BatchSizeType()
    var ingredient3 = BatchSizeType()
    var ingredient4 = BatchSizeType()
    var ingredient5 = BatchSizeType()
    var ingredient6 = BatchSizeType()
    var ingredient7 = BatchSizeType()
    var ingredient8 = BatchSizeType()
    

    
    let numberOFCocktailsLabel = BatchSizeType()
    let numberOfCocktailsTF = OzMlPerIngredientTF()
    
    let totalBatch = BatchSizeType()
    
    let oneLiterTF1 = OzMlPerIngredientTF()
    let oneLiterTF2 = OzMlPerIngredientTF()
    let oneLiterTF3 = OzMlPerIngredientTF()
    let oneLiterTF4 = OzMlPerIngredientTF()
    let oneLiterTF5 = OzMlPerIngredientTF()
    let oneLiterTF6 = OzMlPerIngredientTF()
    let oneLiterTF7 = OzMlPerIngredientTF()
    let oneLiterTF8 = OzMlPerIngredientTF()
    let oneLiterTF9 = OzMlPerIngredientTF()
    
    let mlTextField1 = OzMlPerIngredientTF()
    let mlTextField2 = OzMlPerIngredientTF()
    let mlTextField3 = OzMlPerIngredientTF()
    let mlTextField4 = OzMlPerIngredientTF()
    let mlTextField5 = OzMlPerIngredientTF()
    let mlTextField6 = OzMlPerIngredientTF()
    let mlTextField7 = OzMlPerIngredientTF()
    let mlTextField8 = OzMlPerIngredientTF()
    let mlTextField9 = OzMlPerIngredientTF()
    
    let segmentedControl1 = UISegmentedControl()
    let segmentedControl2 = UISegmentedControl()
    let segmentedControl3 = UISegmentedControl()
    let segmentedControl4 = UISegmentedControl()
    let segmentedControl5 = UISegmentedControl()
    let segmentedControl6 = UISegmentedControl()
    let segmentedControl7 = UISegmentedControl()
    let segmentedControl8 = UISegmentedControl()
    let segmentedControl9 = UISegmentedControl()
    
    
    var segmentedControl1Index = 0
    var segmentedControl2Index = 0
    var segmentedControl3Index = 0
    var segmentedControl4Index = 0
    var segmentedControl5Index = 0
    var segmentedControl6Index = 0
    var segmentedControl7Index = 0
    var segmentedControl8Index = 0
    var segmentedControl9Index = 0
    
    
    var totalVolumeInMls = 0.0
    
    
    let lableHeight = CGFloat(40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.5)
        title = "Big Batch: \(batchedCocktailName)"
        setupKeyboardHiding()
        configureBatchTypeLabels()
        doBatchMath()
        configureBatchTF()
        createSegmentedControls()

        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20), .backgroundColor: UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.0) ]
        appearance.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.5)
        navigationItem.standardAppearance = appearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: SFSymbols.export), style: .plain, target: self, action: #selector(exportCSVFile))
    }
    
    @objc func exportCSVFile() {
        print("Strat exporting...")
        segmentedControl1Index = 0
        segmentedControl2Index = 0
        segmentedControl3Index = 0
        segmentedControl4Index = 0
        segmentedControl5Index = 0
        segmentedControl6Index = 0
        segmentedControl7Index = 0
        segmentedControl8Index = 0
        segmentedControl9Index = 0
        doBatchMath()
        
     
        let mlTextFieldArray = [mlTextField1, mlTextField2, mlTextField3, mlTextField4, mlTextField5, mlTextField6, mlTextField7, mlTextField8, mlTextField9]
        let ingredientTextFieldArray = [ingredient1, ingredient2,ingredient3, ingredient4,ingredient5, ingredient6,ingredient7, ingredient8, totalBatch]
        let bottleSelectionFieldArray = [oneLiterTF1, oneLiterTF2, oneLiterTF3, oneLiterTF4, oneLiterTF5, oneLiterTF6, oneLiterTF7, oneLiterTF8, oneLiterTF9]
  
        
        let fileName = "Big Batch \(batchedCocktailName).csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvHead = "\(batchedCocktailName), Ingredients, Liters , Remaining mLs \n"
        
        csvHead.append("\n,")
        for i in 0...8 {
            csvHead.append("\(ingredientTextFieldArray[i].text ?? ""), \(bottleSelectionFieldArray[i].text ?? ""), \(mlTextFieldArray[i].text ?? "") \n,")
        }
        ///Total 4 Gallon Batch Math
        let totalVolumeInt = Int(totalVolumeInMls)
        let remainder = totalVolumeInt % 15141
        let fourGallonBatches = Double(totalVolumeInMls)/15142
        
        ///Each 4 gallon bucket math
        let fourGallonsInMls = 15141.6
        let totalSingleCocktailPreDilution = mlAmount1+mlAmount2+mlAmount3+mlAmount4+mlAmount5+mlAmount6+mlAmount7
        let dilutionMultiplier = dilutionPercentageNumber / 100
        print("your dilution multiplier is \(dilutionMultiplier)")
        let singleDilutionAmount = totalSingleCocktailPreDilution * dilutionMultiplier
        print("single Dilution amount is \(singleDilutionAmount)")
        let totalSingleCocktailWithDilution = totalSingleCocktailPreDilution + singleDilutionAmount
        
        let numberOfCocktailsPer4Gallon = fourGallonsInMls / totalSingleCocktailWithDilution
        print("number of cocktails per 4 gallons is \(numberOfCocktailsPer4Gallon)")
        ///individual ingredients amount per four gallon buckets
        let ingredient1Per4Gallon = mlAmount1 * numberOfCocktailsPer4Gallon
        let ingredient2Per4Gallon = mlAmount2 * numberOfCocktailsPer4Gallon
        let ingredient3Per4Gallon = mlAmount3 * numberOfCocktailsPer4Gallon
        let ingredient4Per4Gallon = mlAmount4 * numberOfCocktailsPer4Gallon
        let ingredient5Per4Gallon = mlAmount5 * numberOfCocktailsPer4Gallon
        let ingredient6Per4Gallon = mlAmount6 * numberOfCocktailsPer4Gallon
        let ingredient7Per4Gallon = mlAmount7 * numberOfCocktailsPer4Gallon
        let ingredient8Per4Gallon = singleDilutionAmount * numberOfCocktailsPer4Gallon
        print("dilution for 4 gallon bucket is \(ingredient8Per4Gallon)")
        let ingredientPer4GalArray = [ingredient1Per4Gallon, ingredient2Per4Gallon, ingredient3Per4Gallon, ingredient4Per4Gallon, ingredient5Per4Gallon, ingredient6Per4Gallon, ingredient7Per4Gallon, ingredient8Per4Gallon]
        
    
        
        ///remainder bucket math
//        let doubleRemainder = Double(remainder)
        let numberOfCocktailsPerRemainderBucket = Double(remainder) / totalSingleCocktailWithDilution
        print("Your number of cocktails for the remainder bucket is \(numberOfCocktailsPerRemainderBucket)")
        let ingredient1PerRemainderBucket = mlAmount1 * numberOfCocktailsPerRemainderBucket
        let ingredient2PerRemainderBucket = mlAmount2 * numberOfCocktailsPerRemainderBucket
        let ingredient3PerRemainderBucket = mlAmount3 * numberOfCocktailsPerRemainderBucket
        let ingredient4PerRemainderBucket = mlAmount4 * numberOfCocktailsPerRemainderBucket
        let ingredient5PerRemainderBucket = mlAmount5 * numberOfCocktailsPerRemainderBucket
        let ingredient6PerRemainderBucket = mlAmount6 * numberOfCocktailsPerRemainderBucket
        let ingredient7PerRemainderBucket = mlAmount7 * numberOfCocktailsPerRemainderBucket
        let ingredient8PerRemainderBucket = singleDilutionAmount * numberOfCocktailsPerRemainderBucket
        print("dilution for remainder is \(ingredient8PerRemainderBucket)")
        let ingredientPerRemainderArray = [ingredient1PerRemainderBucket, ingredient2PerRemainderBucket, ingredient3PerRemainderBucket, ingredient4PerRemainderBucket, ingredient5PerRemainderBucket, ingredient6PerRemainderBucket, ingredient7PerRemainderBucket, ingredient8PerRemainderBucket]
    
        csvHead.append(" Total # of Cocktails =, \(numberOfCocktailsTF.text ?? "") \n,")
        
        if totalVolumeInt > 15141 {
            
            csvHead.append(" \n \n, Total 4 gallon batches =,\(fourGallonBatches.truncate(places: 2)) \n,  Remaining mls in last bucket =, \(remainder)")
            csvHead.append(" \n \n, INGREDIENTS TO MAKE A 4 GALLON BATCH \n, ")
            csvHead.append(" , Ingredints , total mLs \n,")
            for i in 0...7 {
                csvHead.append(" , \(ingredientTextFieldArray[i].text ?? ""), \(Int(ingredientPer4GalArray[i])) \n, ")
            }
            
            csvHead.append(" \n  \n, INGREDIENTS FOR THE REMAINDER VESSEL \n")
            csvHead.append(" ,   , Ingredints , total mLs \n,")
            
            for i in 0...7 {
                csvHead.append(" , \(ingredientTextFieldArray[i].text ?? ""), \(Int(ingredientPerRemainderArray[i])) \n, ")
            }

            
        }
        
        
        
        do {
            try csvHead.write(to: path!, atomically: true, encoding: .utf8)
            let exportSheet = UIActivityViewController(activityItems: [path as Any], applicationActivities: nil)
            self.present(exportSheet, animated: true, completion: nil)
            print("exported")
        } catch {
            print("Error")
        }
        
    }
  
    
    func doBatchMath() {
        mlAmount1 = ouncesAmount1 * 29.5735
        mlAmount2 = ouncesAmount2 * 29.5735
        mlAmount3 = ouncesAmount3 * 29.5735
        mlAmount4 = ouncesAmount4 * 29.5735
        mlAmount5 = ouncesAmount5 * 29.5735
        mlAmount6 = ouncesAmount6 * 29.5735
        mlAmount7 = ouncesAmount7 * 29.5735
        
        print("mlamount 1 was \(mlAmount1)")
        
        let doubleToInt1 = 0
        let doubleToInt2 = 0
        let doubleToInt3 = 0
        let doubleToInt4 = 0
        let doubleToInt5 = 0
        let doubleToInt6 = 0
        let doubleToInt7 = 0
        let liters1 = 0
        let liters2 = 0
        let liters3 = 0
        let liters4 = 0
        let liters5 = 0
        let liters6 = 0
        let liters7 = 0

        
        let segmentedControlIndexArray = [segmentedControl1Index, segmentedControl2Index, segmentedControl3Index, segmentedControl4Index, segmentedControl5Index, segmentedControl6Index, segmentedControl7Index, segmentedControl8Index]
        let litersArray = [liters1, liters2, liters3, liters4, liters5, liters6, liters7]
        let mlTextFieldArray = [mlTextField1, mlTextField2, mlTextField3, mlTextField4, mlTextField5, mlTextField6, mlTextField7]
        let mlAmountArray = [mlAmount1, mlAmount2, mlAmount3, mlAmount4, mlAmount5, mlAmount6, mlAmount7]
        var doubleToIntArray = [doubleToInt1 ,doubleToInt2 ,doubleToInt3 , doubleToInt4, doubleToInt5, doubleToInt6, doubleToInt7]
        let bottleSelectionFieldArray = [oneLiterTF1, oneLiterTF2, oneLiterTF3, oneLiterTF4, oneLiterTF5, oneLiterTF6, oneLiterTF7]

        
        
        
        for i in 0...6 {
            if doubleToIntArray[i] == 0 && mlAmountArray[i] == 0 {
                break
            } else {
                doubleToIntArray[i] = Int(mlAmountArray[i] * initialCocktailNumber)

                if segmentedControlIndexArray[i] == 1 {
                    let mathfor750s = mlLiterMath(mlsIngredientVolume: doubleToIntArray[i])
                    bottleSelectionFieldArray[i].text = mathfor750s.whole750sCount
                    mlTextFieldArray[i].text = mathfor750s.remaining750Mls

                } else {

                    let literMath = oneLiterMath(mlsIngredientVolume: doubleToIntArray[i])
                     bottleSelectionFieldArray[i].text = literMath.oneLiterCount
                     mlTextFieldArray[i].text = literMath.remainingLiterMls
                }


            }

        }
    
    func oneLiterMath(mlsIngredientVolume: Int ) -> (oneLiterCount: String, remainingLiterMls: String) {
        var oneLiterCount = 0
        var remainingLiterMls = mlsIngredientVolume
        
        while remainingLiterMls > 999 {
            oneLiterCount += 1
            remainingLiterMls -= 1000
        }
        return (String(oneLiterCount), String(remainingLiterMls))
    }
    
    func mlLiterMath(mlsIngredientVolume: Int ) -> (whole750sCount: String, remaining750Mls: String) {
        var whole750sCount = 0
        var remaining750Mls = mlsIngredientVolume
        
        while remaining750Mls > 749 {
            whole750sCount += 1
            remaining750Mls -= 750
        }
        return (String(whole750sCount), String(remaining750Mls))
    }
    

        
        let litersToMl1 = litersArray[0] * 1000
        let litersToMl2 = litersArray[1] * 1000
        let litersToMl3 = litersArray[2] * 1000
        let litersToMl4 = litersArray[3] * 1000
        let litersToMl5 = litersArray[4] * 1000
        let litersToMl6 = litersArray[5] * 1000
        let litersToMl7 = litersArray[6] * 1000
        
        let totalVolumePreDilution = litersToMl1 + litersToMl2 + litersToMl3 + litersToMl4 + litersToMl5 + litersToMl6 + litersToMl7 + doubleToIntArray[0] + doubleToIntArray[1] + doubleToIntArray[2] + doubleToIntArray[3] + doubleToIntArray[4] + doubleToIntArray[5] + doubleToIntArray[6]
        
        let actualDilutionPercentageNumber = dilutionPercentageNumber / 100.0
        let dilutionAmount = Double(totalVolumePreDilution) * actualDilutionPercentageNumber
        var remainingDilutionMls = Int(dilutionAmount)
        var wholeDilutionBottles = 0
        var totalVolumeWholeContainters = 0
        
        
        if segmentedControl8Index == 0 {
            while remainingDilutionMls > 999 {
                wholeDilutionBottles += 1
                remainingDilutionMls -= 1000
            }
        }
        if segmentedControl8Index == 1 {
            while remainingDilutionMls > 749 {
                wholeDilutionBottles += 1
                remainingDilutionMls -= 750
            }
        }
        
        
        
        
        
        oneLiterTF8.text = String(wholeDilutionBottles)
        mlTextField8.text = String(remainingDilutionMls)
        numberOfCocktailsTF.text = String(initialCocktailNumber.truncate(places: 2))
        
        var remainingVolumeInMls = remainingDilutionMls + totalVolumePreDilution
        
        if segmentedControl9Index == 0 {
            while remainingVolumeInMls > 999 {
                totalVolumeWholeContainters += 1
                remainingVolumeInMls -= 1000
            }
        }
        
        if segmentedControl9Index == 1 {
            while remainingVolumeInMls > 15141 {
                totalVolumeWholeContainters += 1
                remainingVolumeInMls -= 15142
            }
        }
        
        totalVolumeInMls = Double(remainingVolumeInMls) + (Double(totalVolumeWholeContainters) * 1000.0)
        
        
        
        oneLiterTF9.text = String(totalVolumeWholeContainters)
        mlTextField9.text = String(remainingVolumeInMls)
        
        print("after calculation, mlamount 1 is \(mlAmount1)")
    }
    
    
    func createSegmentedControls() {
        let items = ["1L", "750ml"]
        let totalVolumeItems = ["1L", "4Gallon"]
        let segmentedControl1 = UISegmentedControl(items: items)
        let segmentedControl2 = UISegmentedControl(items: items)
        let segmentedControl3 = UISegmentedControl(items: items)
        let segmentedControl4 = UISegmentedControl(items: items)
        let segmentedControl5 = UISegmentedControl(items: items)
        let segmentedControl6 = UISegmentedControl(items: items)
        let segmentedControl7 = UISegmentedControl(items: items)
        let segmentedControl8 = UISegmentedControl(items: items)
        let segmentedControl9 = UISegmentedControl(items: totalVolumeItems)
        
        segmentedControl1.addTarget(self, action: #selector(bottleOption1Changed(_:)), for: .valueChanged)
        segmentedControl2.addTarget(self, action: #selector(bottleOption2Changed(_:)), for: .valueChanged)
        segmentedControl3.addTarget(self, action: #selector(bottleOption3Changed(_:)), for: .valueChanged)
        segmentedControl4.addTarget(self, action: #selector(bottleOption4Changed(_:)), for: .valueChanged)
        segmentedControl5.addTarget(self, action: #selector(bottleOption5Changed(_:)), for: .valueChanged)
        segmentedControl6.addTarget(self, action: #selector(bottleOption6Changed(_:)), for: .valueChanged)
        segmentedControl7.addTarget(self, action: #selector(bottleOption7Changed(_:)), for: .valueChanged)
        segmentedControl8.addTarget(self, action: #selector(bottleOption8Changed(_:)), for: .valueChanged)
        segmentedControl9.addTarget(self, action: #selector(bottleOption9Changed(_:)), for: .valueChanged)
        
        let segmentedArray = [segmentedControl1, segmentedControl2, segmentedControl3, segmentedControl4, segmentedControl5, segmentedControl6, segmentedControl7, segmentedControl8, segmentedControl9]
        let oneLiterTFArray = [oneLiterTF1, oneLiterTF2, oneLiterTF3, oneLiterTF4, oneLiterTF5, oneLiterTF6, oneLiterTF7, oneLiterTF8, oneLiterTF9]
        let mlTextFieldArray = [mlTextField1, mlTextField2, mlTextField3, mlTextField4, mlTextField5, mlTextField6, mlTextField7, mlTextField8, mlTextField9]
        for i in 0...8 {
            
            segmentedArray[i].translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(segmentedArray[i])
            segmentedArray[i].selectedSegmentTintColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1.0)
            segmentedArray[i].backgroundColor = .systemGray2
            segmentedArray[i].selectedSegmentIndex = 0
        }
        
        NSLayoutConstraint.activate([
            segmentedControl1.centerYAnchor.constraint(equalTo: oneLiterTF1.centerYAnchor),
            segmentedControl1.widthAnchor.constraint(equalTo: orLabel.widthAnchor),
            segmentedControl1.heightAnchor.constraint(equalToConstant: 30),
            segmentedControl1.trailingAnchor.constraint(equalTo: oneLiterTF1.leadingAnchor, constant: -5)
            
        ])
        
        for i in 1...8 {
            NSLayoutConstraint.activate([
                segmentedArray[i].centerYAnchor.constraint(equalTo: oneLiterTFArray[i].centerYAnchor),
                segmentedArray[i].widthAnchor.constraint(equalTo: segmentedControl1.widthAnchor),
                segmentedArray[i].heightAnchor.constraint(equalToConstant: 30),
                segmentedArray[i].trailingAnchor.constraint(equalTo: segmentedControl1.trailingAnchor)
                
            ])
        }
        
        for i in 0...6 {
            if oneLiterTFArray[i].text == "" && mlTextFieldArray[i].text == "" {
                segmentedArray[i].selectedSegmentTintColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
                segmentedArray[i].backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
                segmentedArray[i].isEnabled = false
            } else {
                continue
            }
        }

        if oneLiterTF8.text == "0" && mlTextField8.text == "0" {
            segmentedControl8.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
            segmentedControl8.selectedSegmentTintColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
            segmentedControl8.isEnabled = false
        } else {
            return
        }


    }
    
    @objc func bottleOption1Changed(_ segmentedControl: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControl1Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        case 1:
            segmentedControl1Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        default:
            doBatchMath()
        }
    }
    @objc func bottleOption2Changed(_ segmentedControl: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControl2Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        case 1:
            segmentedControl2Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        default:
            doBatchMath()
        }
    }
    @objc func bottleOption3Changed(_ segmentedControl: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControl3Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        case 1:
            segmentedControl3Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        default:
            doBatchMath()
        }
    }
    @objc func bottleOption4Changed(_ segmentedControl: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControl4Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        case 1:
            segmentedControl4Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        default:
            doBatchMath()
        }
    }
    @objc func bottleOption5Changed(_ segmentedControl: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControl5Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        case 1:
            segmentedControl5Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        default:
            doBatchMath()
        }
    }
    @objc func bottleOption6Changed(_ segmentedControl: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControl6Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        case 1:
            segmentedControl6Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        default:
            doBatchMath()
        }
    }
    @objc func bottleOption7Changed(_ segmentedControl: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControl7Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        case 1:
            segmentedControl7Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        default:
            doBatchMath()
        }
    }
    
    @objc func bottleOption8Changed(_ segmentedControl: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControl8Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        case 1:
            segmentedControl8Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        default:
            doBatchMath()
        }
    }
    @objc func bottleOption9Changed(_ segmentedControl: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControl9Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        case 1:
            segmentedControl9Index = segmentedControl.selectedSegmentIndex
            doBatchMath()
        default:
            doBatchMath()
        }
    }
    
    
    func configureBatchTypeLabels() {
        let ingredientLabelsArray = [ingredient1,ingredient2, ingredient3, ingredient4, ingredient5, ingredient6, ingredient7, ingredient8]
        view.addSubview(mlLabel)
        view.addSubview(ingredientsLabel)
        view.addSubview(oneLiterLabel)
        view.addSubview(orLabel)
        view.addSubview(totalBatch)
        view.addSubview(numberOFCocktailsLabel)
        view.addSubview(numberOfCocktailsTF)
        for i in 0...7 {
            view.addSubview(ingredientLabelsArray[i])
        }
        
        
        numberOFCocktailsLabel.text = "Number of Cocktails: "
        numberOFCocktailsLabel.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
        numberOFCocktailsLabel.textColor = .white
        numberOFCocktailsLabel.layer.borderWidth = 0
        numberOFCocktailsLabel.textAlignment = .right
        
        ingredientsLabel.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
        ingredientsLabel.textColor = .white
        ingredientsLabel.layer.borderWidth = 0
        
        oneLiterLabel.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
        oneLiterLabel.textColor = .white
        oneLiterLabel.layer.borderWidth = 0
        
        mlLabel.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
        mlLabel.textColor = .white
        mlLabel.layer.borderWidth = 0
        
        ingredient1.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
        ingredient1.textColor = .white
        ingredient1.layer.borderWidth = 0
        
        mlLabel.text = "mls"
        
        ingredientsLabel.text = "Ingredients"
        
        oneLiterLabel.text = "Vessels"
        orLabel.text = ""
        totalBatch.text = "Total Volume:"
        ingredient8.text = dilutionTypeName
        ingredient1.text = batchedIngredient1
        ingredient1.textAlignment = .right
        ingredient2.text = batchedIngredient2
        ingredient3.text = batchedIngredient3
        ingredient4.text = batchedIngredient4
        ingredient5.text = batchedIngredient5
        ingredient6.text = batchedIngredient6
        ingredient7.text = batchedIngredient7
        ingredient8.text = "Dilution: \(dilutionTypeName)"
        totalBatch.textAlignment = .right
        numberOfCocktailsTF.placeholder = "#"
        
        numberOfCocktailsTF.addTarget(self, action: #selector(changedCocktailsNumber), for: .editingDidEnd)
        
        totalBatch.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
        totalBatch.textColor = .white
        totalBatch.layer.borderWidth = 0
        
        
        orLabel.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
        
        orLabel.font = .systemFont(ofSize: 20)
        orLabel.layer.borderWidth = 0
        let topPadding = CGFloat(90)
        NSLayoutConstraint.activate([
            ingredientsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            ingredientsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding),
            ingredientsLabel.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -5),
            ingredientsLabel.heightAnchor.constraint(equalToConstant: lableHeight),
            
            orLabel.widthAnchor.constraint(equalToConstant: 95),
            orLabel.heightAnchor.constraint(equalToConstant: lableHeight),
            orLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding),
            orLabel.trailingAnchor.constraint(equalTo: oneLiterLabel.leadingAnchor, constant: -5),
            
            oneLiterLabel.widthAnchor.constraint(equalToConstant: 75),
            oneLiterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding),
            oneLiterLabel.trailingAnchor.constraint(equalTo: mlLabel.leadingAnchor, constant: -5),
            oneLiterLabel.heightAnchor.constraint(equalToConstant: lableHeight),
            
            mlLabel.widthAnchor.constraint(equalToConstant: 60),
            mlLabel.heightAnchor.constraint(equalToConstant: lableHeight),
            mlLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding),
            mlLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            ingredient1.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 5),
            ingredient1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            ingredient1.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -5),
            ingredient1.heightAnchor.constraint(equalToConstant: lableHeight),
            
            totalBatch.topAnchor.constraint(equalTo: ingredient8.bottomAnchor, constant: 5),
            totalBatch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            totalBatch.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -5),
            totalBatch.heightAnchor.constraint(equalToConstant: lableHeight),
            
            numberOFCocktailsLabel.topAnchor.constraint(equalTo: totalBatch.bottomAnchor, constant: 5),
            numberOFCocktailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            numberOFCocktailsLabel.heightAnchor.constraint(equalToConstant: lableHeight),
            numberOFCocktailsLabel.trailingAnchor.constraint(equalTo: mlLabel.leadingAnchor, constant: -5),
            
            numberOfCocktailsTF.topAnchor.constraint(equalTo: numberOFCocktailsLabel.topAnchor),
            numberOfCocktailsTF.trailingAnchor.constraint(equalTo: mlLabel.trailingAnchor),
            numberOfCocktailsTF.heightAnchor.constraint(equalToConstant: lableHeight),
            numberOfCocktailsTF.leadingAnchor.constraint(equalTo: mlLabel.leadingAnchor)
            
            
            
        ])
        for i in 1...7 {
            NSLayoutConstraint.activate([
                ingredientLabelsArray[i].topAnchor.constraint(equalTo: ingredientLabelsArray[i-1].bottomAnchor, constant: 5),
                ingredientLabelsArray[i].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                ingredientLabelsArray[i].trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -5),
                ingredientLabelsArray[i].heightAnchor.constraint(equalToConstant: lableHeight),
                
                
            ])
            ingredientLabelsArray[i].backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
            ingredientLabelsArray[i].textColor = .white
            ingredientLabelsArray[i].layer.borderWidth = 0
            ingredientLabelsArray[i].textAlignment = .right
            
        }
        
    }
    
    func configureBatchTF() {
        
        let mlTextFieldArray = [mlTextField1, mlTextField2, mlTextField3, mlTextField4, mlTextField5, mlTextField6, mlTextField7, mlTextField8, mlTextField9]
        let oneLiterTFArray = [oneLiterTF1, oneLiterTF2, oneLiterTF3, oneLiterTF4, oneLiterTF5, oneLiterTF6, oneLiterTF7, oneLiterTF8, oneLiterTF9]
        
        for i in 0...8 {
            view.addSubview(mlTextFieldArray[i])
            view.addSubview(oneLiterTFArray[i])
            
        }
        
        for i in 0...8 {
            mlTextFieldArray[i].inputAccessoryView = toolBar()
            oneLiterTFArray[i].inputAccessoryView = toolBar()
        }
        numberOfCocktailsTF.inputAccessoryView = toolBar()
        
        for i in 0...8 {
            if oneLiterTFArray[i].text == "" && mlTextFieldArray[i].text == "" {
                oneLiterTFArray[i].backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
                oneLiterTFArray[i].isEnabled = false
                
                
                mlTextFieldArray[i].backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
                mlTextFieldArray[i].isEnabled = false
                
            } else {
                
                oneLiterTFArray[i].backgroundColor = .white
                oneLiterTFArray[i].isEnabled = true
                
                
                mlTextFieldArray[i].backgroundColor = .white
                mlTextFieldArray[i].isEnabled = true
                
            }
            
            if oneLiterTF8.text == "0" && mlTextField8.text == "0" {
                oneLiterTF8.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
                oneLiterTF8.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
                mlTextField8.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
                mlTextField8.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
            } else {
                oneLiterTF8.backgroundColor = .white
                oneLiterTF8.textColor = .label
                mlTextField8.textColor = .label
                mlTextField8.isEnabled = true
            }
        }
        
        
        
        
        
        NSLayoutConstraint.activate([
            
            oneLiterTF1.leadingAnchor.constraint(equalTo: oneLiterLabel.leadingAnchor),
            oneLiterTF1.topAnchor.constraint(equalTo: oneLiterLabel.bottomAnchor, constant: 5),
            oneLiterTF1.trailingAnchor.constraint(equalTo: oneLiterLabel.trailingAnchor),
            oneLiterTF1.heightAnchor.constraint(equalToConstant: lableHeight),
            
            mlTextField1.leadingAnchor.constraint(equalTo: mlLabel.leadingAnchor),
            mlTextField1.topAnchor.constraint(equalTo: mlLabel.bottomAnchor, constant: 5),
            mlTextField1.trailingAnchor.constraint(equalTo: mlLabel.trailingAnchor),
            mlTextField1.heightAnchor.constraint(equalToConstant: lableHeight),
            
            
            
            
            
        ])
        
        
        for i in 1...8 {
            NSLayoutConstraint.activate([
                
                oneLiterTFArray[i].topAnchor.constraint(equalTo: oneLiterTFArray[i - 1].bottomAnchor, constant: 5),
                oneLiterTFArray[i].leadingAnchor.constraint(equalTo: oneLiterLabel.leadingAnchor),
                oneLiterTFArray[i].trailingAnchor.constraint(equalTo: oneLiterLabel.trailingAnchor),
                oneLiterTFArray[i].heightAnchor.constraint(equalToConstant: lableHeight),
                
                mlTextFieldArray[i].topAnchor.constraint(equalTo: mlTextFieldArray[i - 1].bottomAnchor, constant: 5),
                mlTextFieldArray[i].leadingAnchor.constraint(equalTo: mlLabel.leadingAnchor),
                mlTextFieldArray[i].trailingAnchor.constraint(equalTo: mlLabel.trailingAnchor),
                mlTextFieldArray[i].heightAnchor.constraint(equalToConstant: lableHeight),
                
            ])
        }
        
        oneLiterTF1.addTarget(self, action: #selector(changeNumberOfBaseIngredientBottles1), for: .editingDidEnd)
        oneLiterTF2.addTarget(self, action: #selector(changeNumberOfBaseIngredientBottles2), for: .editingDidEnd)
        oneLiterTF3.addTarget(self, action: #selector(changeNumberOfBaseIngredientBottles3), for: .editingDidEnd)
        oneLiterTF4.addTarget(self, action: #selector(changeNumberOfBaseIngredientBottles4), for: .editingDidEnd)
        oneLiterTF5.addTarget(self, action: #selector(changeNumberOfBaseIngredientBottles5), for: .editingDidEnd)
        oneLiterTF6.addTarget(self, action: #selector(changeNumberOfBaseIngredientBottles6), for: .editingDidEnd)
        oneLiterTF7.addTarget(self, action: #selector(changeNumberOfBaseIngredientBottles7), for: .editingDidEnd)
        
    }

    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        numberOfCocktailsTF.resignFirstResponder()
        mlTextField1.resignFirstResponder()
        mlTextField2.resignFirstResponder()
        mlTextField3.resignFirstResponder()
        mlTextField4.resignFirstResponder()
        mlTextField5.resignFirstResponder()
        mlTextField6.resignFirstResponder()
        mlTextField7.resignFirstResponder()
        mlTextField8.resignFirstResponder()
        mlTextField9.resignFirstResponder()
        oneLiterTF1.resignFirstResponder()
        oneLiterTF2.resignFirstResponder()
        oneLiterTF3.resignFirstResponder()
        oneLiterTF4.resignFirstResponder()
        oneLiterTF5.resignFirstResponder()
        oneLiterTF6.resignFirstResponder()
        oneLiterTF7.resignFirstResponder()
        oneLiterTF8.resignFirstResponder()
        oneLiterTF9.resignFirstResponder()
    }
    
    @objc func changedCocktailsNumber() {
        guard let newNumberOfCocktails = numberOfCocktailsTF.text else {
            print("Oops")
            return
        }
        
        initialCocktailNumber = Double(newNumberOfCocktails) ?? 10.0
        doBatchMath()
        
    }
    
    @objc func changeNumberOfBaseIngredientBottles1() {
        guard let newNumberOfBottles1 = oneLiterTF1.text else {
            print("Oops")
            return
        }
        let stringIntoDouble1 = Double(newNumberOfBottles1) ?? 0.0
        
        if segmentedControl1Index == 0 {
            let bottleIntoMls1 = stringIntoDouble1 * 1000
            initialCocktailNumber = bottleIntoMls1 / mlAmount1
        } else {
            let bottleIntoMls1 = stringIntoDouble1 * 750
            initialCocktailNumber = bottleIntoMls1 / mlAmount1
        }
        
        doBatchMath()
        
    }
    
    @objc func changeNumberOfBaseIngredientBottles2() {
        guard let newNumberOfBottles2 = oneLiterTF2.text else {
            print("Oops")
            return
        }
        let stringIntoDouble2 = Double(newNumberOfBottles2) ?? 0.0
        
        if segmentedControl2Index == 0 {
            let bottleIntoMls2 = stringIntoDouble2 * 1000
            initialCocktailNumber = bottleIntoMls2 / mlAmount2
        } else {
            let bottleIntoMls2 = stringIntoDouble2 * 750
            initialCocktailNumber = bottleIntoMls2 / mlAmount2
        }
        
        doBatchMath()
    }
    
    @objc func changeNumberOfBaseIngredientBottles3() {
        guard let newNumberOfBottles3 = oneLiterTF3.text else {
            print("Oops")
            return
        }
        let stringIntoDouble3 = Double(newNumberOfBottles3) ?? 0.0
        
        if segmentedControl3Index == 0 {
            let bottleIntoMls3 = stringIntoDouble3 * 1000
            initialCocktailNumber = bottleIntoMls3 / mlAmount3
        } else {
            let bottleIntoMls3 = stringIntoDouble3 * 750
            initialCocktailNumber = bottleIntoMls3 / mlAmount3
        }
        
        doBatchMath()
    }
    
    @objc func changeNumberOfBaseIngredientBottles4() {
        guard let newNumberOfBottles4 = oneLiterTF4.text else {
            print("Oops")
            return
        }
        let stringIntoDouble4 = Double(newNumberOfBottles4) ?? 0.0
        
        if segmentedControl4Index == 0 {
            let bottleIntoMls4 = stringIntoDouble4 * 1000
            initialCocktailNumber = bottleIntoMls4 / mlAmount4
        } else {
            let bottleIntoMls4 = stringIntoDouble4 * 750
            initialCocktailNumber = bottleIntoMls4 / mlAmount4
        }
        
        doBatchMath()
    }
    
    @objc func changeNumberOfBaseIngredientBottles5() {
        guard let newNumberOfBottles5 = oneLiterTF5.text else {
            print("Oops")
            return
        }
        let stringIntoDouble5 = Double(newNumberOfBottles5) ?? 0.0
        
        if segmentedControl5Index == 0 {
            let bottleIntoMls5 = stringIntoDouble5 * 1000
            initialCocktailNumber = bottleIntoMls5 / mlAmount5
        } else {
            let bottleIntoMls5 = stringIntoDouble5 * 750
            initialCocktailNumber = bottleIntoMls5 / mlAmount5
        }
        
        doBatchMath()
    }
    
    @objc func changeNumberOfBaseIngredientBottles6() {
        guard let newNumberOfBottles6 = oneLiterTF6.text else {
            print("Oops")
            return
        }
        let stringIntoDouble6 = Double(newNumberOfBottles6) ?? 0.0
        
        if segmentedControl6Index == 0 {
            let bottleIntoMls6 = stringIntoDouble6 * 1000
            initialCocktailNumber = bottleIntoMls6 / mlAmount6
        } else {
            let bottleIntoMls6 = stringIntoDouble6 * 750
            initialCocktailNumber = bottleIntoMls6 / mlAmount6
        }
        
        doBatchMath()
    }
    @objc func changeNumberOfBaseIngredientBottles7() {
        guard let newNumberOfBottles7 = oneLiterTF7.text else {
            print("Oops")
            return
        }
        let stringIntoDouble7 = Double(newNumberOfBottles7) ?? 0.0
        
        if segmentedControl7Index == 0 {
            let bottleIntoMls7 = stringIntoDouble7 * 1000
            initialCocktailNumber = bottleIntoMls7 / mlAmount7
        } else {
            let bottleIntoMls7 = stringIntoDouble7 * 750
            initialCocktailNumber = bottleIntoMls7 / mlAmount7
        }
        
        doBatchMath()
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
}
