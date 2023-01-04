//
//  ChooseContainerVC.swift
//  BigBatch
//
//  Created by James on 12/14/22.
//

import UIKit

class ChooseContainerVC: UIViewController {

    let containerType = ["4 Liter", "5 Liter", "6 Liter", "7 Liter", "8 Liter", "9 Liter", "10 Liter", "11 Liter", "12 Liter", "13 Liter", "14 Liter", "15 Liter", "16 Liter", "17 Liter", "18 Liter", "5 Gallon Buckets"]
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
    
    var totalDilution = 0.0
    var totalDilutionName = ""
    var totalVesselCount = 0
    var batchedTotalVolume = 0
    
    init(ingredient1Name: String, ingredient2Name: String, ingredient3Name: String, ingredient4Name: String, ingredient5Name: String, ingredient6Name: String, ingredient7Name: String, ingredient8Name: String, ingredient9Name: String, ingredient10Name: String, ingredient11Name: String, ingredient12Name: String, ingredient13Name: String, ingredient14Name: String, ingredient15Name: String, ingredient16Name: String, ingredient1Amount: Int, ingredient2Amount: Int, ingredient3Amount: Int, ingredient4Amount: Int, ingredient5Amount: Int, ingredient6Amount: Int, ingredient7Amount: Int, ingredient8Amount: Int, ingredient9Amount: Int, ingredient10Amount: Int, ingredient11Amount: Int, ingredient12Amount: Int, ingredient13Amount: Int, ingredient14Amount: Int, ingredient15Amount: Int, ingredient16Amount: Int, dilutionAmount: Double, dilutionName: String, totalVolume: Int){
        
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
//        let splitBatchVC = SplitBatchVC()
//        self.present(splitBatchVC, animated: true)
        //navigationController?.pushViewController(SplitBatchVC(), animated: true)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        refreshBackground()
        super.viewWillAppear(animated)
    }
   
    func refreshBackground() {
        let gradientLayer = CAGradientLayer.gradientLayer(for: .cocktailSpecs, in: view.frame)
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
}
