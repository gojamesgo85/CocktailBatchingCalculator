//
//  ViewController.swift
//  BigBatch
//
//  Created by James on 11/22/22.
//

import UIKit
import CoreData



class ViewController: UIViewController {
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    
    var cocktailNameField = CocktailIngredientTF()
    
    var ABVTextField1 = OzMlPerIngredientTF()
    var ABVTextField2 = OzMlPerIngredientTF()
    var ABVTextField3 = OzMlPerIngredientTF()
    var ABVTextField4 = OzMlPerIngredientTF()
    var ABVTextField5 = OzMlPerIngredientTF()
    var ABVTextField6 = OzMlPerIngredientTF()
    var ABVTextField7 = OzMlPerIngredientTF()
    var ABVTextField8 = OzMlPerIngredientTF()
    var finalABVCalculation = BatchSizeType()
    
    var numberTF1 = OzMlPerIngredientTF()
    var numberTF2 = OzMlPerIngredientTF()
    var numberTF3 = OzMlPerIngredientTF()
    var numberTF4 = OzMlPerIngredientTF()
    var numberTF5 = OzMlPerIngredientTF()
    var numberTF6 = OzMlPerIngredientTF()
    var numberTF7 = OzMlPerIngredientTF()
    var numberTF8 = OzMlPerIngredientTF()
    
    var ingredientTF1 = CocktailIngredientTF()
    var ingredientTF2 = CocktailIngredientTF()
    var ingredientTF3 = CocktailIngredientTF()
    var ingredientTF4 = CocktailIngredientTF()
    var ingredientTF5 = CocktailIngredientTF()
    var ingredientTF6 = CocktailIngredientTF()
    var ingredientTF7 = CocktailIngredientTF()
    var ingredientTF8 = CocktailIngredientTF()
    
    var initialCocktailsNumberTF = OzMlPerIngredientTF()
    
    let batchButton = BatchButton()
    let ABVButton = BatchButton()
    
    let numberOfCocktailsForSpecsLabel = BatchSizeType()

    init(cocktailName: String,
         oz1Name: String,
         oz2Name: String,
         oz3Name: String,
         oz4Name: String,
         oz5Name: String,
         oz6Name: String,
         oz7Name: String,
         oz1Amount: String,
         oz2Amount: String,
         oz3Amount: String,
         oz4Amount: String,
         oz5Amount: String,
         oz6Amount: String,
         oz7Amount: String,
         dilutionPercentage: String,
         dilutionName: String,
         ABV1: String,
         ABV2: String,
         ABV3: String,
         ABV4: String,
         ABV5: String,
         ABV6: String,
         ABV7: String,
         ABV8: String) {
        
        cocktailNameField.text = cocktailName
        numberTF1.text = oz1Amount
        numberTF2.text = oz2Amount
        numberTF3.text = oz3Amount
        numberTF4.text = oz4Amount
        numberTF5.text = oz5Amount
        numberTF6.text = oz6Amount
        numberTF7.text = oz7Amount
        numberTF8.text = dilutionPercentage
        ingredientTF1.text = oz1Name
        ingredientTF2.text = oz2Name
        ingredientTF3.text = oz3Name
        ingredientTF4.text = oz4Name
        ingredientTF5.text = oz5Name
        ingredientTF6.text = oz6Name
        ingredientTF7.text = oz7Name
        ingredientTF8.text = dilutionName
        ABVTextField1.text = ABV1
        ABVTextField2.text = ABV2
        ABVTextField3.text = ABV3
        ABVTextField4.text = ABV4
        ABVTextField5.text = ABV5
        ABVTextField6.text = ABV6
        ABVTextField7.text = ABV7
        ABVTextField8.text = ABV8

        super.init(nibName: nil, bundle: nil)

    }
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    let labelsHeight = CGFloat(40)
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.4)
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20) ]
        appearance.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.4)
        navigationItem.standardAppearance = appearance
        
        setupKeyboardHiding()
        configureTextFields()
        configureButtons()
        cocktailNameField.delegate = self
        numberTF1.delegate = self
        numberTF2.delegate = self
        numberTF3.delegate = self
        numberTF4.delegate = self
        numberTF5.delegate = self
        numberTF6.delegate = self
        numberTF7.delegate = self
        numberTF8.delegate = self
        ingredientTF1.delegate = self
        ingredientTF2.delegate = self
        ingredientTF3.delegate = self
        ingredientTF4.delegate = self
        ingredientTF5.delegate = self
        ingredientTF6.delegate = self
        ingredientTF7.delegate = self
        ingredientTF8.delegate = self
        ABVTextField1.delegate = self
        ABVTextField2.delegate = self
        ABVTextField3.delegate = self
        ABVTextField4.delegate = self
        ABVTextField5.delegate = self
        ABVTextField6.delegate = self
        ABVTextField7.delegate = self
        ABVTextField8.delegate = self
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(addCocktailToSavedCocktailsArray)), UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearPageData))]
        
        initialCocktailsNumberTF.text = ""
    }
    
    var aBVCalculation = 0.0
    
 
    
    @objc func clearPageData() {
        let numberFields = [numberTF1, numberTF2, numberTF3, numberTF4, numberTF5, numberTF6, numberTF7, numberTF8]
        let ingredients = [ingredientTF1,ingredientTF2,ingredientTF3,ingredientTF4,ingredientTF5,ingredientTF6,ingredientTF7, ingredientTF8]
        let ABVFieldsArray = [ABVTextField1, ABVTextField2, ABVTextField3, ABVTextField4, ABVTextField5, ABVTextField6, ABVTextField7, ABVTextField8]
        for i in 0...7 {
            numberFields[i].text = ""
            ingredients[i].text = ""
            ABVFieldsArray[i].text = ""
        }
        
        cocktailNameField.text = ""
        initialCocktailsNumberTF.text = ""
        finalABVCalculation.text = ""
    }
    
    @objc func addCocktailToSavedCocktailsArray() {
        
        
        
        
        guard let cocktailName = cocktailNameField.text,
              let oz1String = numberTF1.text,
              let oz2String = numberTF2.text,
              let oz3String = numberTF3.text,
              let oz4String = numberTF4.text,
              let oz5String = numberTF5.text,
              let oz6String = numberTF6.text,
              let oz7String = numberTF7.text,
              let dilutionPercentageText = numberTF8.text,
              let ingredients1 = ingredientTF1.text,
              let ingredients2 = ingredientTF2.text,
              let ingredients3 = ingredientTF3.text,
              let ingredients4 = ingredientTF4.text,
              let ingredients5 = ingredientTF5.text,
              let ingredients6 = ingredientTF6.text,
              let ingredients7 = ingredientTF7.text,
              let ingredients8 = ingredientTF8.text,
              let alcoholPercentage1 = ABVTextField1.text,
              let alcoholPercentage2 = ABVTextField2.text,
              let alcoholPercentage3 = ABVTextField3.text,
              let alcoholPercentage4 = ABVTextField4.text,
              let alcoholPercentage5 = ABVTextField5.text,
              let alcoholPercentage6 = ABVTextField6.text,
              let alcoholPercentage7 = ABVTextField7.text,
              let alcoholPercentage8 = ABVTextField8.text else {
            
            print("Oops")
            return
        }
        
        StorageProvider.sharedStorageProvider.saveCocktail(named: cocktailName,
                                                           ingredient1Name: ingredients1,
                                                           ingredient2Name: ingredients2,
                                                           ingredient3Name: ingredients3,
                                                           ingredient4Name: ingredients4,
                                                           ingredient5Name: ingredients5,
                                                           ingredient6Name: ingredients6,
                                                           ingredient7Name: ingredients7,
                                                           ingredient1Amount: oz1String,
                                                           ingredient2Amount: oz2String,
                                                           ingredient3Amount: oz3String,
                                                           ingredient4Amount: oz4String,
                                                           ingredient5Amount: oz5String,
                                                           ingredient6Amount: oz6String,
                                                           ingredient7Amount: oz7String,
                                                           dilutionTypeName: ingredients8,
                                                           dilutionPecentage: dilutionPercentageText,
                                                           ABV1: alcoholPercentage1,
                                                           ABV2: alcoholPercentage2,
                                                           ABV3: alcoholPercentage3,
                                                           ABV4: alcoholPercentage4,
                                                           ABV5: alcoholPercentage5,
                                                           ABV6: alcoholPercentage6,
                                                           ABV7: alcoholPercentage7,
                                                           ABV8: alcoholPercentage8)
        
        
        navigationController?.pushViewController(SavedBatches(persistantStorage: StorageProvider.sharedStorageProvider), animated: true)
        
    }
    
    
        func configureTextFields() {
            let numberFields = [numberTF1, numberTF2, numberTF3, numberTF4, numberTF5, numberTF6, numberTF7, numberTF8]
            let ingredients = [ingredientTF1,ingredientTF2,ingredientTF3,ingredientTF4,ingredientTF5,ingredientTF6,ingredientTF7, ingredientTF8]
            let ABVFieldsArray = [ABVTextField1, ABVTextField2, ABVTextField3, ABVTextField4, ABVTextField5, ABVTextField6, ABVTextField7, ABVTextField8]
            
            for i in 0...7 {
                view.addSubview(numberFields[i])
                view.addSubview(ingredients[i])
                view.addSubview(ABVFieldsArray[i])
                numberFields[i].placeholder = "Ounces"
                ABVFieldsArray[i].placeholder = " %ABV "
                view.addSubview(numberOfCocktailsForSpecsLabel)
                view.addSubview(initialCocktailsNumberTF)
                
            }
            
            view.addSubview(cocktailNameField)
            numberTF8.placeholder = "% Dilution"
            ingredientTF8.placeholder = "Type(Usually Water)"
            cocktailNameField.placeholder = "Cocktail Name"
            numberOfCocktailsForSpecsLabel.text = "Number of Cocktails:"
            
            numberOfCocktailsForSpecsLabel.textAlignment = .right
            numberOfCocktailsForSpecsLabel.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0)
            numberOfCocktailsForSpecsLabel.textColor = .white
            numberOfCocktailsForSpecsLabel.layer.borderWidth = 0
            for i in 0...7 {
                numberFields[i].inputAccessoryView = toolBar()
                ABVFieldsArray[i].inputAccessoryView = toolBar()
                ingredients[i].inputAccessoryView = toolBar()
            }
            initialCocktailsNumberTF.inputAccessoryView = toolBar()
            cocktailNameField.inputAccessoryView = toolBar()
            NSLayoutConstraint.activate([
                
                numberTF1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                numberTF1.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
                numberTF1.widthAnchor.constraint(equalToConstant: 100),
                numberTF1.heightAnchor.constraint(equalToConstant: labelsHeight),
                
                initialCocktailsNumberTF.topAnchor.constraint(equalTo: ABVTextField8.bottomAnchor, constant: 5),
                initialCocktailsNumberTF.leadingAnchor.constraint(equalTo: ABVTextField8.leadingAnchor),
                initialCocktailsNumberTF.trailingAnchor.constraint(equalTo: ABVTextField8.trailingAnchor),
                initialCocktailsNumberTF.heightAnchor.constraint(equalToConstant: labelsHeight),
                
                numberOfCocktailsForSpecsLabel.topAnchor.constraint(equalTo: ABVTextField8.bottomAnchor, constant: 5),
                numberOfCocktailsForSpecsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                numberOfCocktailsForSpecsLabel.trailingAnchor.constraint(equalTo: initialCocktailsNumberTF.leadingAnchor, constant: -5),
                numberOfCocktailsForSpecsLabel.heightAnchor.constraint(equalToConstant: labelsHeight),
                
                ABVTextField1.leadingAnchor.constraint(equalTo: ingredientTF1.trailingAnchor, constant: 5),
                ABVTextField1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                ABVTextField1.heightAnchor.constraint(equalToConstant: labelsHeight),
                ABVTextField1.bottomAnchor.constraint(equalTo: ingredientTF1.bottomAnchor),
                ABVTextField1.widthAnchor.constraint(equalToConstant: 50),
                
                cocktailNameField.bottomAnchor.constraint(equalTo: ingredientTF1.topAnchor, constant: -5),
                cocktailNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                cocktailNameField.heightAnchor.constraint(equalToConstant: labelsHeight),
                cocktailNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                
                ingredientTF1.leadingAnchor.constraint(equalTo: numberTF1.trailingAnchor, constant: 5),
                ingredientTF1.heightAnchor.constraint(equalToConstant: labelsHeight),
                ingredientTF1.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
                ingredientTF1.trailingAnchor.constraint(equalTo: ABVTextField1.leadingAnchor, constant: -5)
                
            ])
            for i in 1...7 {
                NSLayoutConstraint.activate([
                    numberFields[i].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                    numberFields[i].topAnchor.constraint(equalTo: numberFields[i - 1].bottomAnchor, constant: 5),
                    numberFields[i].widthAnchor.constraint(equalToConstant: 100),
                    numberFields[i].heightAnchor.constraint(equalToConstant: labelsHeight),
                    
                ])
            }
            for i in 1...7 {
                NSLayoutConstraint.activate([
                    ingredients[i].leadingAnchor.constraint(equalTo: numberFields[i].trailingAnchor, constant: 5),
                    ingredients[i].trailingAnchor.constraint(equalTo: ABVFieldsArray[i].leadingAnchor, constant: -5),
                    ingredients[i].heightAnchor.constraint(equalToConstant: labelsHeight),
                    ingredients[i].topAnchor.constraint(equalTo: ingredients[i - 1].bottomAnchor, constant: 5),
                ])
            }
            
            for i in 1...7 {
                NSLayoutConstraint.activate([
                    ABVFieldsArray[i].leadingAnchor.constraint(equalTo: ABVTextField1.leadingAnchor),
                    ABVFieldsArray[i].trailingAnchor.constraint(equalTo: ABVTextField1.trailingAnchor),
                    ABVFieldsArray[i].heightAnchor.constraint(equalToConstant: labelsHeight),
                    ABVFieldsArray[i].topAnchor.constraint(equalTo: ABVFieldsArray[i - 1].bottomAnchor, constant: 5)
    
                ])
            }
        }
        
        func configureButtons() {
            
            view.addSubview(batchButton)
            view.addSubview(ABVButton)
            view.addSubview(finalABVCalculation)
            //finalABVCalculation.text = "Your ABV is %\(aBVCalculation)"
            batchButton.addTarget(self, action: #selector(BatchedView), for: .touchUpInside)
            ABVButton.addTarget(self, action: #selector(CalculateABV), for: .touchUpInside)
            ABVButton.setTitle("CALC.%ABV", for: .normal)
            
            finalABVCalculation.textColor = .white
            finalABVCalculation.layer.borderWidth = 0
            finalABVCalculation.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.0)
            ABVButton.backgroundColor = .systemGray6
            ABVButton.setTitleColor(UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1.0), for: .normal)
            NSLayoutConstraint.activate([
                batchButton.topAnchor.constraint(equalTo: ingredientTF8.bottomAnchor, constant: 70),
                batchButton.heightAnchor.constraint(equalToConstant: labelsHeight),
                batchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
                batchButton.trailingAnchor.constraint(equalTo: ABVButton.leadingAnchor, constant: -5),
                batchButton.widthAnchor.constraint(equalToConstant: 250),
                
                ABVButton.bottomAnchor.constraint(equalTo: batchButton.bottomAnchor),
                ABVButton.heightAnchor.constraint(equalToConstant: labelsHeight),
                ABVButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                ABVButton.leadingAnchor.constraint(equalTo: batchButton.trailingAnchor, constant: 5),
                
                finalABVCalculation.bottomAnchor.constraint(equalTo: batchButton.topAnchor),
                finalABVCalculation.heightAnchor.constraint(equalToConstant: 35),
                finalABVCalculation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
            ])
        }
    
    @objc func CalculateABV() {
        guard let ingredient1Ounces = numberTF1.text,
              let ingredient2Ounces = numberTF2.text,
              let ingredient3Ounces = numberTF3.text,
              let ingredient4Ounces = numberTF4.text,
              let ingredient5Ounces = numberTF5.text,
              let ingredient6Ounces = numberTF6.text,
              let ingredient7Ounces = numberTF7.text,
              let dilutionPercentageForABVCalculation = numberTF8.text,
              let ingredient1ABV = ABVTextField1.text,
              let ingredient2ABV = ABVTextField2.text,
              let ingredient3ABV = ABVTextField3.text,
              let ingredient4ABV = ABVTextField4.text,
              let ingredient5ABV = ABVTextField5.text,
              let ingredient6ABV = ABVTextField6.text,
              let ingredient7ABV = ABVTextField7.text,
              let ingredient8ABV = ABVTextField8.text else {
            print("Oops")
            return
        }
        
        let i1 = Double(ingredient1Ounces) ?? 0.0
        let i2 = Double(ingredient2Ounces) ?? 0.0
        let i3 = Double(ingredient3Ounces) ?? 0.0
        let i4 = Double(ingredient4Ounces) ?? 0.0
        let i5 = Double(ingredient5Ounces) ?? 0.0
        let i6 = Double(ingredient6Ounces) ?? 0.0
        let i7 = Double(ingredient7Ounces) ?? 0.0
        let dilution = Double(dilutionPercentageForABVCalculation) ?? 0.0
    
        let i1ABV = Double(ingredient1ABV) ?? 0.0
     
        let i2ABV = Double(ingredient2ABV) ?? 0.0
        let i3ABV = Double(ingredient3ABV) ?? 0.0
        let i4ABV = Double(ingredient4ABV) ?? 0.0
        let i5ABV = Double(ingredient5ABV) ?? 0.0
        let i6ABV = Double(ingredient6ABV) ?? 0.0
        let i7ABV = Double(ingredient7ABV) ?? 0.0
        let dilutionABV = Double(ingredient8ABV) ?? 0.0

        let actualDilution = dilution / 100.0
        let preDilutionVolumeForABV = i1 + i2 + i3 + i4 + i5 + i6 + i7
        let dilutionAmountToAdd = preDilutionVolumeForABV * actualDilution
        let totalVolumeForABVCalculation = preDilutionVolumeForABV + dilutionAmountToAdd

        let i1ABVFraction = i1ABV / 100
        let i2ABVFraction = i2ABV / 100
        let i3ABVFraction = i3ABV / 100
        let i4ABVFraction = i4ABV / 100
        let i5ABVFraction = i5ABV / 100
        let i6ABVFraction = i6ABV / 100
        let i7ABVFraction = i7ABV / 100
        let dilutionABVFraction = dilutionABV / 100
        
        let pureAlcohol1 = i1 * i1ABVFraction
        let pureAlcohol2 = i2 * i2ABVFraction
        let pureAlcohol3 = i3 * i3ABVFraction
        let pureAlcohol4 = i4 * i4ABVFraction
        let pureAlcohol5 = i5 * i5ABVFraction
        let pureAlcohol6 = i6 * i6ABVFraction
        let pureAlcohol7 = i7 * i7ABVFraction
        let dilutionPureAlcohol = dilutionAmountToAdd * dilutionABVFraction

        let pureAlcohol = pureAlcohol1 + pureAlcohol2 + pureAlcohol3 + pureAlcohol4 + pureAlcohol5 + pureAlcohol6 + pureAlcohol7 + dilutionPureAlcohol
        
        
        
        let preABVCalculation = pureAlcohol / totalVolumeForABVCalculation
        aBVCalculation = preABVCalculation * 100
        
 
        finalABVCalculation.text = "Your ABV is %\(aBVCalculation.truncate(places: 2))"
        
        
        
    }
    
    @objc func BatchedView() {
        
        guard let cockName = cocktailNameField.text,
              let oz1String = numberTF1.text,
              let oz2String = numberTF2.text,
              let oz3String = numberTF3.text,
              let oz4String = numberTF4.text,
              let oz5String = numberTF5.text,
              let oz6String = numberTF6.text,
              let oz7String = numberTF7.text,
              let oz8String = numberTF8.text,
              let ingredients1 = ingredientTF1.text,
              let ingredients2 = ingredientTF2.text,
              let ingredients3 = ingredientTF3.text,
              let ingredients4 = ingredientTF4.text,
              let ingredients5 = ingredientTF5.text,
              let ingredients6 = ingredientTF6.text,
              let ingredients7 = ingredientTF7.text,
              let ingredients8 = ingredientTF8.text,
              let initialCocktailsToSend = initialCocktailsNumberTF.text  else {
            print("Oops")
            return
        }
        
        
        
        
        var cocktailModel = Cocktail()
        
        cocktailModel.savedCocktailName = cockName
        
        cocktailModel.modelOzAmount1 = Double(oz1String) ?? 0.0
        cocktailModel.modelOzAmount2 = Double(oz2String) ?? 0.0
        cocktailModel.modelOzAmount3 = Double(oz3String) ?? 0.0
        cocktailModel.modelOzAmount4 = Double(oz4String) ?? 0.0
        cocktailModel.modelOzAmount5 = Double(oz5String) ?? 0.0
        cocktailModel.modelOzAmount6 = Double(oz6String) ?? 0.0
        cocktailModel.modelOzAmount7 = Double(oz7String) ?? 0.0
        cocktailModel.modelDilutionPercentage = Double(oz8String) ?? 0.0

        if initialCocktailsNumberTF.text == "" {
            cocktailModel.modelInitialCocktailsNumber = 1.0
        } else {
            cocktailModel.modelInitialCocktailsNumber = Double(initialCocktailsToSend) ?? 0.0
        }
        

        cocktailModel.modelIngredient1Name = ingredients1
        cocktailModel.modelIngredient2Name = ingredients2
        cocktailModel.modelIngredient3Name = ingredients3
        cocktailModel.modelIngredient4Name = ingredients4
        cocktailModel.modelIngredient5Name = ingredients5
        cocktailModel.modelIngredient6Name = ingredients6
        cocktailModel.modelIngredient7Name = ingredients7
        cocktailModel.modelDilutionType = ingredients8
        
        navigationController?.pushViewController(BatchedVC(cocktail: cocktailModel), animated: true)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        numberTF1.resignFirstResponder()
        numberTF2.resignFirstResponder()
        numberTF3.resignFirstResponder()
        numberTF4.resignFirstResponder()
        numberTF5.resignFirstResponder()
        numberTF6.resignFirstResponder()
        numberTF7.resignFirstResponder()
        numberTF8.resignFirstResponder()
        ABVTextField1.resignFirstResponder()
        ABVTextField2.resignFirstResponder()
        ABVTextField3.resignFirstResponder()
        ABVTextField4.resignFirstResponder()
        ABVTextField5.resignFirstResponder()
        ABVTextField6.resignFirstResponder()
        ABVTextField7.resignFirstResponder()
        ABVTextField8.resignFirstResponder()
        initialCocktailsNumberTF.resignFirstResponder()
        
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
        view.backgroundColor = nil
        let backgroundView = UIView()
        let gradientLayer = CAGradientLayer.gradientLayer(for: .savedBatches, in: view.frame)
        backgroundView.layer.addSublayer(gradientLayer)
        
        
    }
    
}



