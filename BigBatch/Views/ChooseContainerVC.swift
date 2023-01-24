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
    var containerSize = 4000
    var batchedCocktailName = ""
    var totalCocktailCount = 0.0
    var containerName = "4 Liter"
    var singleCocktailAmountInMls = 0
    var splitBatchModelData = SplitBatchCocktailModel()
    var splitBatchButton = BatchButton()
    
    init(cocktailDataModel: SplitBatchCocktailModel){
        self.splitBatchModelData = cocktailDataModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
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
       
        splitBatchModelData.containerName = containerName
        splitBatchModelData.containerSize = containerSize
        
        navigationController?.pushViewController(SplitBatchVC(splitBatchDataModel: splitBatchModelData), animated: true)
        
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
