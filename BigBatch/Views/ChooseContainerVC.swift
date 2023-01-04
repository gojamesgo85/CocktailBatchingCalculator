//
//  ChooseContainerVC.swift
//  BigBatch
//
//  Created by James on 12/14/22.
//

import UIKit

class ChooseContainerVC: UIViewController {

    let containerType = ["4 Liter", "5 Liter", "6 Liter", "7 Liter", "8 Liter", "9 Liter", "10 Liter", "11 Liter", "12 Liter", "13 Liter", "14 Liter", "15 Liter", "16 Liter", "17 Liter", "18 Liter", "5 Gallon Bucket"]
    let containerSizeInMls = [4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000, 12000, 13000, 14000, 15000, 16000, 17000, 18000, 18927]
    var pickerView = UIPickerView()
    var label1 = TypeLabel()
    var label2 = UITextView()
    
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
    var totalVesselCount = 0
    var batchedTotalVolume = 0
    var containerSize = 4000
    
    var batchedCocktailName = ""
    var totalCocktailCount = 0.0
    var containerName = "4 Liter"
    var singleCocktailAmountInMls = 0
    
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
        batchedTotalVolume = totalVolume
        singleCocktailAmountInMls = singleCocktailAmount
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
        
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var splitBatchButton = BatchButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
        
    }
    func configureViews() {
        view.addSubview(pickerView)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(splitBatchButton)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "What size are the containers?"
        label2.text = "20% of the container's volume will be left for safe transportation."
        label1.textAlignment = .center
        label2.textAlignment = .center
        label1.font = .systemFont(ofSize: 22, weight: .bold)
        label2.font = .systemFont(ofSize: 18, weight: .bold)
        
        label1.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.0)
        label2.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.0)
        label1.textColor = .white
        label2.textColor = .white
        
        splitBatchButton.setTitle("Crunch The Numbers", for: .normal)
        
        splitBatchButton.addTarget(self, action: #selector(handleSplitBatchButton), for: .touchUpInside)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.0)
        
        pickerView.setValue(UIColor.white, forKeyPath: "textColor")
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            pickerView.heightAnchor.constraint(equalToConstant: 200),
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
        
            label1.bottomAnchor.constraint(equalTo: pickerView.topAnchor),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            label1.heightAnchor.constraint(equalToConstant: 70),
            
            label2.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 5),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            label2.heightAnchor.constraint(equalToConstant: 100),
            
            splitBatchButton.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            splitBatchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splitBatchButton.heightAnchor.constraint(equalToConstant: 50),
            splitBatchButton.widthAnchor.constraint(equalToConstant: 200)
            
        
        ])
        
        
    }
    @objc func handleSplitBatchButton() {
       
        navigationController?.pushViewController(SplitBatchVC(ingredient1Name: batchedIngredient1,
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
                                                              ingredient1Amount: batchedTotalAmount1,
                                                              ingredient2Amount: batchedTotalAmount2,
                                                              ingredient3Amount: batchedTotalAmount3,
                                                              ingredient4Amount: batchedTotalAmount4,
                                                              ingredient5Amount: batchedTotalAmount5,
                                                              ingredient6Amount: batchedTotalAmount6,
                                                              ingredient7Amount: batchedTotalAmount7,
                                                              ingredient8Amount: batchedTotalAmount8,
                                                              ingredient9Amount: batchedTotalAmount9,
                                                              ingredient10Amount: batchedTotalAmount10,
                                                              ingredient11Amount: batchedTotalAmount11,
                                                              ingredient12Amount: batchedTotalAmount12,
                                                              ingredient13Amount: batchedTotalAmount13,
                                                              ingredient14Amount: batchedTotalAmount14,
                                                              ingredient15Amount: batchedTotalAmount15,
                                                              ingredient16Amount: batchedTotalAmount16,
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
                                                              singleDilutionAmount: singleDilution,
                                                              dilutionAmount: totalDilution,
                                                              dilutionName: totalDilutionName,
                                                              batchContainerSize: containerSize,
                                                              containerSizeName: containerName,
                                                              totalVolume: batchedTotalVolume,
                                                              singleCocktailAmount: singleCocktailAmountInMls,
                                                              cocktailCount: totalCocktailCount,
                                                              cocktailName: batchedCocktailName), animated: true)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        refreshBackground()
        super.viewWillAppear(animated)
    }
   
    func refreshBackground() {
        let gradientLayer = CAGradientLayer.gradientLayer(for: .savedBatches, in: view.frame)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
   
    }
   

}
extension ChooseContainerVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        containerType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return containerType[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        containerSize = containerSizeInMls[row]
        containerName = containerType[row]
        
    }
}
