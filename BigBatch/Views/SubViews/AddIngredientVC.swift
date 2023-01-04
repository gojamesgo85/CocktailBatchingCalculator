//
//  AddIngredientVC.swift
//  BigBatch
//
//  Created by James on 12/11/22.
//

import UIKit
protocol AddIngredientToTableViewDelegate {
    
    func addIngredientToTableView(name: String, amount: String, aBV: String, dilutionPercentage: String, cellSwitch: Int)
    
}


class AddIngredientVC: UIViewController {

    
    var addIngredientDelegate: AddIngredientToTableViewDelegate?
    
    var cocktail = Cocktail()
    
    let ingredientNameLabel = TypeLabel()
    let ingredientAmountLabel = TypeLabel()
    let ingredientABVLabel = TypeLabel()
    let dilutionTypeLabel = TypeLabel()
    let ingredientNameTextField = CocktailIngredientNameTF()
    let ingredientAmountTextField = CocktailIngredientAmountTF()
    let ingredientABVTextField = CocktailIngredientAmountTF()
    let dilutionPercentageTextField = CocktailIngredientAmountTF()
    let addButton = BatchButton()
    let segmentedControl = UISegmentedControl(items: ["Ingredient", "Dilution"])
    var cocktailIngredientsArray = CocktailIngredientsForCell()
    
    
    let labelHeight = CGFloat(40)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSegmentedControll()
        configureButtonsAndTextFields()
        
        segmentedControlWasChanged()
        ingredientNameTextField.becomeFirstResponder()
        
     
       
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
    
    func configureButtonsAndTextFields() {
        
        view.addSubview(ingredientNameLabel)
        view.addSubview(ingredientNameTextField)
        view.addSubview(ingredientAmountLabel)
        view.addSubview(ingredientAmountTextField)
        view.addSubview(ingredientABVLabel)
        view.addSubview(ingredientABVTextField)
        view.addSubview(dilutionTypeLabel)
        view.addSubview(dilutionPercentageTextField)
        view.addSubview(addButton)
        
        addButton.setTitle("  Add to specs  ", for: .normal)
        addButton.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1.0)
        
        
        
        ingredientAmountLabel.text = "Amount in ounces: "
        ingredientABVLabel.text = "ABV percentage: "
        dilutionTypeLabel.text = "Dilution percentage: "
        

       
        addButton.addTarget(self, action: #selector(handleAddButton), for: .touchUpInside)
        
        
        
        NSLayoutConstraint.activate([
            ingredientNameLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 120),
            ingredientNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            ingredientNameLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            ingredientNameLabel.widthAnchor.constraint(equalToConstant: 60),
            
            ingredientNameTextField.topAnchor.constraint(equalTo: ingredientNameLabel.topAnchor),
            ingredientNameTextField.leadingAnchor.constraint(equalTo: ingredientNameLabel.trailingAnchor, constant: 10),
            ingredientNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            ingredientNameTextField.heightAnchor.constraint(equalToConstant: labelHeight),
            
            ingredientAmountLabel.topAnchor.constraint(equalTo: dilutionTypeLabel.bottomAnchor, constant: 10),
            ingredientAmountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            ingredientAmountLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            ingredientAmountLabel.widthAnchor.constraint(equalToConstant: 225),
            
            ingredientAmountTextField.topAnchor.constraint(equalTo: ingredientAmountLabel.topAnchor),
            ingredientAmountTextField.leadingAnchor.constraint(equalTo: ingredientAmountLabel.trailingAnchor, constant: 10),
            ingredientAmountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            ingredientAmountTextField.heightAnchor.constraint(equalToConstant: labelHeight),
            
            ingredientABVLabel.topAnchor.constraint(equalTo: ingredientAmountLabel.bottomAnchor, constant: 10),
            ingredientABVLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            ingredientABVLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            ingredientABVLabel.widthAnchor.constraint(equalToConstant: 225),
            
            ingredientABVTextField.topAnchor.constraint(equalTo: ingredientABVLabel.topAnchor),
            ingredientABVTextField.leadingAnchor.constraint(equalTo: ingredientABVLabel.trailingAnchor, constant: 10),
            ingredientABVTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            ingredientABVTextField.heightAnchor.constraint(equalToConstant: labelHeight),
            
            dilutionTypeLabel.topAnchor.constraint(equalTo: ingredientNameTextField.bottomAnchor, constant: 10),
            dilutionTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            dilutionTypeLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            dilutionTypeLabel.widthAnchor.constraint(equalToConstant: 225),
            
            dilutionPercentageTextField.topAnchor.constraint(equalTo: dilutionTypeLabel.topAnchor),
            dilutionPercentageTextField.leadingAnchor.constraint(equalTo: dilutionTypeLabel.trailingAnchor, constant: 10),
            dilutionPercentageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            dilutionPercentageTextField.heightAnchor.constraint(equalToConstant: labelHeight),
            
            addButton.topAnchor.constraint(equalTo: ingredientABVLabel.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: labelHeight),
            addButton.widthAnchor.constraint(equalToConstant: 150)
        
        
        ])
        
        
    }
    
    @objc func handleAddButton() {
        
        guard let name = ingredientNameTextField.text,
              let amount = ingredientAmountTextField.text,
              let aBV = ingredientABVTextField.text,
              let dilution = dilutionPercentageTextField.text else {
            print("oops")
            return
        }
        let cellSwitch = segmentedControl.selectedSegmentIndex
        
        addIngredientDelegate?.addIngredientToTableView(name: name, amount: amount, aBV: aBV, dilutionPercentage: dilution, cellSwitch: cellSwitch)
        
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
        
    }
    
    func configureSegmentedControll() {

        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentTintColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1.0)
        segmentedControl.backgroundColor = .systemFill
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlWasChanged), for: .valueChanged)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            segmentedControl.widthAnchor.constraint(equalToConstant: 250)
        
        ])
    }

    @objc func segmentedControlWasChanged() {
        if segmentedControl.selectedSegmentIndex == 0 {
            
            ingredientNameTextField.placeholder = "Ingredient Name"
            ingredientNameLabel.text = "Name: "
            ingredientAmountTextField.isEnabled = true
            ingredientAmountTextField.backgroundColor = .white
            ingredientAmountLabel.textColor = .white
            
            dilutionPercentageTextField.isEnabled = false
            dilutionPercentageTextField.backgroundColor = .systemFill
            dilutionTypeLabel.textColor = .systemFill
            
            ingredientABVLabel.textColor = .white
            ingredientABVTextField.isEnabled = true
            ingredientABVTextField.backgroundColor = .white
            
        }
        
        if segmentedControl.selectedSegmentIndex == 1 {
            
            ingredientNameTextField.placeholder = "Usually Water"
            ingredientAmountTextField.isEnabled = false
            ingredientAmountTextField.backgroundColor = .systemFill
            ingredientAmountLabel.textColor = .systemFill
            ingredientNameLabel.text = "Type: "
            dilutionPercentageTextField.isEnabled = true
            dilutionPercentageTextField.backgroundColor = .white
            dilutionTypeLabel.textColor = .white
            
            ingredientABVLabel.textColor = .systemFill
            ingredientABVTextField.isEnabled = false
            ingredientABVTextField.backgroundColor = .systemFill
            
        }
        
    }

}
