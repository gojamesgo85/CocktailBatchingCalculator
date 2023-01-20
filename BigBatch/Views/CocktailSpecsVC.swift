//
//  CocktailSpecsVC.swift
//  BigBatch
//
//  Created by James on 12/10/22.
//

import UIKit

class CocktailSpecsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
   
    let alert = Alert()
    
    
    
    func rearrangeArray() {
        
        for i in 0..<cocktailIgredientsArray.count {
            if cocktailIgredientsArray[i].cellSwitch == 1 {
                let element = cocktailIgredientsArray.remove(at: i)
                cocktailIgredientsArray.insert(element, at: cocktailIgredientsArray.count)
                ingredientsTableView.reloadData()
            }
        }
    }
    
    func addNotes(notes: String) {
        cocktailNotes = notes
        print(cocktailNotes)
    }
    var cellTypeSwitch = 0
    let labelHeight = CGFloat(40)
    let cocktail = Cocktail()
    
    let cocktailNameField = CocktailIngredientNameTF()
    let notesButton = BatchButton()
    let addAnIngredientButton = BatchButton()
    let batchButton = BatchButton()
    var finalABVCalculation = TypeLabel()
    let ingredientsTableView = UITableView()
    
    var cocktailIgredientsArray: [CocktailIngredientsForCell] = []
    var cocktailIngredient = CocktailIngredientsForCell()
    let numberOfCocktailsTextField = CocktailIngredientAmountTF()
    let numberOfCocktailsLabel = TypeLabel()
    
    var numberOfIngredientRows = 0
    var numberOfDilutionRows = 0
    var cocktailNotes = ""
    
    
    init(name: String,
         notes: String,
         ingredient1Name: String,
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
         ingredient1Amount: String,
         ingredient2Amount: String,
         ingredient3Amount: String,
         ingredient4Amount: String,
         ingredient5Amount: String,
         ingredient6Amount: String,
         ingredient7Amount: String,
         ingredient8Amount: String,
         ingredient9Amount: String,
         ingredient10Amount: String,
         ingredient11Amount: String,
         ingredient12Amount: String,
         ingredient13Amount: String,
         ingredient14Amount: String,
         ingredient15Amount: String,
         ingredient16Amount: String,
         dilutionTypeName: String,
         dilutionPecentage: String,
         ABV1: String,
         ABV2: String,
         ABV3: String,
         ABV4: String,
         ABV5: String,
         ABV6: String,
         ABV7: String,
         ABV8: String,
         ABV9: String,
         ABV10: String,
         ABV11: String,
         ABV12: String,
         ABV13: String,
         ABV14: String,
         ABV15: String,
         ABV16: String) {

        let namesArray = [ingredient1Name, ingredient2Name,ingredient3Name,ingredient4Name, ingredient5Name,ingredient6Name,ingredient7Name,ingredient8Name,ingredient9Name,ingredient10Name,ingredient11Name,ingredient12Name,ingredient13Name,ingredient14Name,ingredient15Name,ingredient16Name]
        let amountsArray = [ingredient1Amount,ingredient2Amount,ingredient3Amount,ingredient4Amount,ingredient5Amount,ingredient6Amount,ingredient7Amount,ingredient8Amount,ingredient9Amount,ingredient10Amount,ingredient11Amount,ingredient12Amount,ingredient13Amount,ingredient14Amount,ingredient15Amount,ingredient16Amount]
        let abvArray = [ABV1,ABV2,ABV3,ABV4,ABV5,ABV6,ABV7,ABV8,ABV9,ABV10,ABV11,ABV12,ABV13,ABV14,ABV15,ABV16]

        //notes = cocktailNotes
        cocktailNameField.text = name
        for i in 0...15{
            if namesArray[i] != "" {
                cocktailIngredient.name = namesArray[i]
                cocktailIngredient.amount = amountsArray[i]
                cocktailIngredient.abv = abvArray[i]
                cocktailIngredient.cellSwitch = 0
                cocktailIgredientsArray.append(cocktailIngredient)
            } else {
                break
            }
        }
        cocktailNotes = notes
        if dilutionTypeName != "" {
            cocktailIngredient.name = dilutionTypeName
            cocktailIngredient.dilutionPercentageTextField = dilutionPecentage
            cocktailIngredient.cellSwitch = 1
            cocktailIgredientsArray.append(cocktailIngredient)
        }
        
        
        ingredientsTableView.reloadData()

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
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20) ]
        navigationItem.standardAppearance = appearance
        configureViews()
        
        CalculateABV()
        ingredientsTableView.register(CocktailSpecsTableViewCell.self, forCellReuseIdentifier: CocktailSpecsTableViewCell.coktailIngredientIdentifier)
        ingredientsTableView.register(DilutionTableViewCell.self, forCellReuseIdentifier: DilutionTableViewCell.dilutionIdentifier)
        ingredientsTableView.dataSource = self
        ingredientsTableView.delegate = self
        
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(addCocktailToSavedCocktailsArray)), UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearPageData))]
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
      
        
    }
    override func viewWillAppear(_ animated: Bool) {
        refreshBackground()
        
        super.viewWillAppear(animated)
  
    }
    
    
    func configureViews() {
        setupKeyboardHiding()
        configureTopAnchorFields()
        configureBottomAnchorButtons()
        configureTableView()
        
    }
    
    func refreshBackground() {
        let gradientLayer = CAGradientLayer.gradientLayer(for: .savedBatches, in: view.frame)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    
    func configureTopAnchorFields() {
        view.addSubview(cocktailNameField)
        view.addSubview(notesButton)
        view.addSubview(addAnIngredientButton)
        view.addSubview(numberOfCocktailsLabel)
        view.addSubview(numberOfCocktailsTextField)
        numberOfCocktailsLabel.text = "Cocktail Count:"
        numberOfCocktailsLabel.textAlignment = .right
        numberOfCocktailsLabel.textColor = .white
        numberOfCocktailsLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        numberOfCocktailsLabel.backgroundColor = .clear
        numberOfCocktailsTextField.textAlignment = .center
        numberOfCocktailsTextField.backgroundColor = .white
        addAnIngredientButton.setTitle("➕ Ingredient", for: .normal)
        cocktailNameField.placeholder = "Enter a cocktail name."
        notesButton.setTitle("➕ Notes", for: .normal)
        addAnIngredientButton.addTarget(self, action: #selector(pushModalIngredients), for: .touchUpInside)
        cocktailNameField.inputAccessoryView = toolBar()
        numberOfCocktailsTextField.inputAccessoryView = toolBar()
        notesButton.addTarget(self, action: #selector(pushNotesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            cocktailNameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            cocktailNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            cocktailNameField.trailingAnchor.constraint(equalTo: notesButton.leadingAnchor, constant: -5),
            cocktailNameField.heightAnchor.constraint(equalToConstant: labelHeight),
            
            notesButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            notesButton.widthAnchor.constraint(equalToConstant: 100),
            notesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            notesButton.heightAnchor.constraint(equalToConstant: labelHeight),
            
            addAnIngredientButton.topAnchor.constraint(equalTo: cocktailNameField.bottomAnchor, constant: 5),
            addAnIngredientButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            addAnIngredientButton.widthAnchor.constraint(equalToConstant: 150),
            addAnIngredientButton.heightAnchor.constraint(equalToConstant: labelHeight),
            
            numberOfCocktailsTextField.widthAnchor.constraint(equalToConstant: 60),
            numberOfCocktailsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            numberOfCocktailsTextField.heightAnchor.constraint(equalToConstant: labelHeight),
            numberOfCocktailsTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
          
            numberOfCocktailsLabel.trailingAnchor.constraint(equalTo: numberOfCocktailsTextField.leadingAnchor, constant: -5),
            numberOfCocktailsLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            numberOfCocktailsLabel.leadingAnchor.constraint(equalTo: addAnIngredientButton.trailingAnchor, constant: 5),
            numberOfCocktailsLabel.topAnchor.constraint(equalTo: addAnIngredientButton.topAnchor)
            
        ])
        
    }
    func configureBottomAnchorButtons() {
        view.addSubview(batchButton)
        view.addSubview(finalABVCalculation)
        
        batchButton.addTarget(self, action: #selector(BatchedView), for: .touchUpInside)

        finalABVCalculation.textAlignment = .center
        finalABVCalculation.textColor = .white
        finalABVCalculation.layer.borderWidth = 0
        finalABVCalculation.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.0)
        
        NSLayoutConstraint.activate([
            batchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            batchButton.heightAnchor.constraint(equalToConstant: labelHeight),
            batchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            batchButton.widthAnchor.constraint(equalToConstant: 250),
            
            finalABVCalculation.bottomAnchor.constraint(equalTo: batchButton.topAnchor, constant: -5),
            finalABVCalculation.heightAnchor.constraint(equalToConstant: labelHeight),
            finalABVCalculation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            finalABVCalculation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
        ])
    }
    func configureTableView() {
        view.addSubview(ingredientsTableView)
        ingredientsTableView.layer.borderWidth = 1
        ingredientsTableView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ingredientsTableView.layer.cornerRadius = 10 
        ingredientsTableView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.0)
        NSLayoutConstraint.activate([
            ingredientsTableView.topAnchor.constraint(equalTo: addAnIngredientButton.bottomAnchor, constant: 5),
            ingredientsTableView.bottomAnchor.constraint(equalTo: finalABVCalculation.topAnchor, constant: -5),
            ingredientsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            ingredientsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
            
            
        ])
        
        
    }
    
    @objc func pushNotesVC() {
        
        let pushNotesVC = NotesVC(notes: cocktailNotes)
        pushNotesVC.addNotesDelegate = self
        self.present(pushNotesVC, animated: true)
    }
    
    @objc func pushModalIngredients() {
        
        let addIngredientVC = AddIngredientVC()
        addIngredientVC.addIngredientDelegate = self
        self.present(addIngredientVC, animated: true)
        
    }
    
    @objc func BatchedView() {
        
        
        var cocktailModel = Cocktail()
        
        
        
        
        var modelOzAmountArray = [cocktailModel.modelOzAmount1, cocktailModel.modelOzAmount2,cocktailModel.modelOzAmount3,cocktailModel.modelOzAmount4,cocktailModel.modelOzAmount5,cocktailModel.modelOzAmount6,cocktailModel.modelOzAmount7,cocktailModel.modelOzAmount8,cocktailModel.modelOzAmount9,cocktailModel.modelOzAmount10,cocktailModel.modelOzAmount11,cocktailModel.modelOzAmount12,cocktailModel.modelOzAmount13,cocktailModel.modelOzAmount14,cocktailModel.modelOzAmount15,cocktailModel.modelOzAmount16]

        var modelIngredientsArray = [cocktailModel.modelIngredient1Name, cocktailModel.modelIngredient2Name, cocktailModel.modelIngredient3Name,cocktailModel.modelIngredient4Name, cocktailModel.modelIngredient5Name, cocktailModel.modelIngredient6Name, cocktailModel.modelIngredient7Name, cocktailModel.modelIngredient8Name, cocktailModel.modelIngredient9Name, cocktailModel.modelIngredient10Name, cocktailModel.modelIngredient11Name, cocktailModel.modelIngredient12Name, cocktailModel.modelIngredient13Name, cocktailModel.modelIngredient14Name, cocktailModel.modelIngredient15Name, cocktailModel.modelIngredient16Name]

        
        
        guard let cocktailName = cocktailNameField.text,
              let initialCocktialCount = numberOfCocktailsTextField.text else { return }
        
        cocktailModel.savedCocktailName = cocktailName
        cocktailModel.modelInitialCocktailsNumber = initialCocktialCount
        
        if initialCocktialCount == "" {
            cocktailModel.modelInitialCocktailsNumber = "1.0"
        }
            
        
                
        for i in 0..<cocktailIgredientsArray.count {
            if cocktailIgredientsArray[i].cellSwitch == 0 {
                modelIngredientsArray[i] = cocktailIgredientsArray[i].name
                modelOzAmountArray[i] = cocktailIgredientsArray[i].amount
            } else {
                
                if cocktailIgredientsArray[i].cellSwitch == 1 {
                    
                    cocktailModel.modelDilutionPercentage = cocktailIgredientsArray[i].dilutionPercentageTextField
                    cocktailModel.modelDilutionType = cocktailIgredientsArray[i].name
                }
            }
  
        }
        
        cocktailModel.modelIngredient1Name = modelIngredientsArray[0]
        cocktailModel.modelIngredient2Name = modelIngredientsArray[1]
        cocktailModel.modelIngredient3Name = modelIngredientsArray[2]
        cocktailModel.modelIngredient4Name = modelIngredientsArray[3]
        cocktailModel.modelIngredient5Name = modelIngredientsArray[4]
        cocktailModel.modelIngredient6Name = modelIngredientsArray[5]
        cocktailModel.modelIngredient7Name = modelIngredientsArray[6]
        cocktailModel.modelIngredient8Name = modelIngredientsArray[7]
        cocktailModel.modelIngredient9Name = modelIngredientsArray[8]
        cocktailModel.modelIngredient10Name = modelIngredientsArray[9]
        cocktailModel.modelIngredient11Name = modelIngredientsArray[10]
        cocktailModel.modelIngredient12Name = modelIngredientsArray[11]
        cocktailModel.modelIngredient13Name = modelIngredientsArray[12]
        cocktailModel.modelIngredient14Name = modelIngredientsArray[13]
        cocktailModel.modelIngredient15Name = modelIngredientsArray[14]
        cocktailModel.modelIngredient16Name = modelIngredientsArray[15]
        
        cocktailModel.modelOzAmount1 = modelOzAmountArray[0]
        cocktailModel.modelOzAmount2 = modelOzAmountArray[1]
        cocktailModel.modelOzAmount3 = modelOzAmountArray[2]
        cocktailModel.modelOzAmount4 = modelOzAmountArray[3]
        cocktailModel.modelOzAmount5 = modelOzAmountArray[4]
        cocktailModel.modelOzAmount6 = modelOzAmountArray[5]
        cocktailModel.modelOzAmount7 = modelOzAmountArray[6]
        cocktailModel.modelOzAmount8 = modelOzAmountArray[7]
        cocktailModel.modelOzAmount9 = modelOzAmountArray[8]
        cocktailModel.modelOzAmount10 = modelOzAmountArray[9]
        cocktailModel.modelOzAmount11 = modelOzAmountArray[10]
        cocktailModel.modelOzAmount12 = modelOzAmountArray[11]
        cocktailModel.modelOzAmount13 = modelOzAmountArray[12]
        cocktailModel.modelOzAmount14 = modelOzAmountArray[13]
        cocktailModel.modelOzAmount15 = modelOzAmountArray[14]
        cocktailModel.modelOzAmount16 = modelOzAmountArray[15]
        
        
        
        
        
        navigationController?.pushViewController(BatchedVC1(cocktail: cocktailModel), animated: true)
        
    }
    
    @objc func CalculateABV() {
        var preDilutionVolume = 0.0
        var dilutionPercentage = 0.0
        
        let i1ABV = 0.0
        let i2ABV = 0.0
        let i3ABV = 0.0
        let i4ABV = 0.0
        let i5ABV = 0.0
        let i6ABV = 0.0
        let i7ABV = 0.0
        let i8ABV = 0.0
        let i9ABV = 0.0
        let i10ABV = 0.0
        let i11ABV = 0.0
        let i12ABV = 0.0
        let i13ABV = 0.0
        let i14ABV = 0.0
        let i15ABV = 0.0
        let i16ABV = 0.0
        
        let pureAlcoholVolume1 = 0.0
        let pureAlcoholVolume2 = 0.0
        let pureAlcoholVolume3 = 0.0
        let pureAlcoholVolume4 = 0.0
        let pureAlcoholVolume5 = 0.0
        let pureAlcoholVolume6 = 0.0
        let pureAlcoholVolume7 = 0.0
        let pureAlcoholVolume8 = 0.0
        let pureAlcoholVolume9 = 0.0
        let pureAlcoholVolume10 = 0.0
        let pureAlcoholVolume11 = 0.0
        let pureAlcoholVolume12 = 0.0
        let pureAlcoholVolume13 = 0.0
        let pureAlcoholVolume14 = 0.0
        let pureAlcoholVolume15 = 0.0
        let pureAlcoholVolume16 = 0.0
        
        var pureAlcoholVolumeArray = [pureAlcoholVolume1,pureAlcoholVolume2,pureAlcoholVolume3,pureAlcoholVolume4,pureAlcoholVolume5,pureAlcoholVolume6,pureAlcoholVolume7,pureAlcoholVolume8,pureAlcoholVolume9,pureAlcoholVolume10,pureAlcoholVolume11,pureAlcoholVolume12,pureAlcoholVolume13,pureAlcoholVolume14,pureAlcoholVolume15,pureAlcoholVolume16]
        var totalPureAlcohol = 0.0
        
        var aBVArray = [i1ABV,i2ABV,i3ABV,i4ABV,i5ABV,i6ABV,i7ABV,i8ABV,i9ABV,i10ABV,i11ABV,i12ABV,i13ABV,i14ABV,i15ABV,i16ABV]
     
        for i in 0..<cocktailIgredientsArray.count {
           
            preDilutionVolume += Double(cocktailIgredientsArray[i].amount) ?? 0.0
            aBVArray[i] = Double(cocktailIgredientsArray[i].abv) ?? 0.0
            aBVArray[i] = aBVArray[i] / 100
            pureAlcoholVolumeArray[i] = Double(cocktailIgredientsArray[i].amount) ?? 0.0
            pureAlcoholVolumeArray[i] = pureAlcoholVolumeArray[i] * aBVArray[i]
            totalPureAlcohol += pureAlcoholVolumeArray[i]
            if cocktailIgredientsArray[i].cellSwitch == 1 {
                dilutionPercentage = Double(cocktailIgredientsArray[i].dilutionPercentageTextField) ?? 0.0
            }
        }
        let actualDilutionPercentage = dilutionPercentage / 100.0
        let dilutionToAddToPreDilution = preDilutionVolume * actualDilutionPercentage
        let totalVolumeForABVCalculation = preDilutionVolume + dilutionToAddToPreDilution
  
        let preABVCalculation = totalPureAlcohol / totalVolumeForABVCalculation
        let aBVCalculation = preABVCalculation * 100
        
        if cocktailIgredientsArray.count == 0 {
            finalABVCalculation.text = "Your ABV is 0%"
        } else {
            finalABVCalculation.text = "Your ABV is \(aBVCalculation.truncate(places: 2))%"
        }
        
        
    }
    
    @objc func addCocktailToSavedCocktailsArray() {
        
        var dilutionTypeName = ""
        var dilutionPercentage = ""
        let ingredients1 = ""
        let ingredients2 = ""
        let ingredients3 = ""
        let ingredients4 = ""
        let ingredients5 = ""
        let ingredients6 = ""
        let ingredients7 = ""
        let ingredients8 = ""
        let ingredients9 = ""
        let ingredients10 = ""
        let ingredients11 = ""
        let ingredients12 = ""
        let ingredients13 = ""
        let ingredients14 = ""
        let ingredients15 = ""
        let ingredients16 = ""
        let oz1String = ""
        let oz2String = ""
        let oz3String = ""
        let oz4String = ""
        let oz5String = ""
        let oz6String = ""
        let oz7String = ""
        let oz8String = ""
        let oz9String = ""
        let oz10String = ""
        let oz11String = ""
        let oz12String = ""
        let oz13String = ""
        let oz14String = ""
        let oz15String = ""
        let oz16String = ""
        let alcoholPercentage1 = ""
        let alcoholPercentage2 = ""
        let alcoholPercentage3 = ""
        let alcoholPercentage4 = ""
        let alcoholPercentage5 = ""
        let alcoholPercentage6 = ""
        let alcoholPercentage7 = ""
        let alcoholPercentage8 = ""
        let alcoholPercentage9 = ""
        let alcoholPercentage10 = ""
        let alcoholPercentage11 = ""
        let alcoholPercentage12 = ""
        let alcoholPercentage13 = ""
        let alcoholPercentage14 = ""
        let alcoholPercentage15 = ""
        let alcoholPercentage16 = ""
        
        var percentageArray = [alcoholPercentage1,alcoholPercentage2, alcoholPercentage3, alcoholPercentage4, alcoholPercentage5, alcoholPercentage6, alcoholPercentage7, alcoholPercentage8, alcoholPercentage9, alcoholPercentage10, alcoholPercentage11, alcoholPercentage12, alcoholPercentage13, alcoholPercentage14, alcoholPercentage15, alcoholPercentage16]
        var ozStringArray = [oz1String,oz2String,oz3String,oz4String,oz5String,oz6String,oz7String,oz8String,oz9String,oz10String,oz11String,oz12String,oz13String,oz14String,oz15String,oz16String]
        var ingredientsArray = [ingredients1,ingredients2,ingredients3,ingredients4,ingredients5,ingredients6,ingredients7,ingredients8,ingredients9,ingredients10,ingredients11,ingredients12,ingredients13,ingredients14,ingredients15,ingredients16]
        
        for i in 0..<cocktailIgredientsArray.count {
            if cocktailIgredientsArray[i].cellSwitch == 1 {
                dilutionTypeName = cocktailIgredientsArray[i].name
                dilutionPercentage = cocktailIgredientsArray[i].dilutionPercentageTextField
            }
        }
        
        guard let cocktailName = cocktailNameField.text else {
            print("oops")
            return
        }
        
        for i in 0..<cocktailIgredientsArray.count {
            if cocktailIgredientsArray[i].cellSwitch == 0 {
                ingredientsArray[i] = cocktailIgredientsArray[i].name
                percentageArray[i] = cocktailIgredientsArray[i].abv
                ozStringArray[i] = cocktailIgredientsArray[i].amount
            }
        }

        StorageProvider.sharedStorageProvider.saveCocktail(named: cocktailName,
                                                           notes: cocktailNotes,
                                                           ingredient1Name: ingredientsArray[0],
                                                           ingredient2Name: ingredientsArray[1],
                                                           ingredient3Name: ingredientsArray[2],
                                                           ingredient4Name: ingredientsArray[3],
                                                           ingredient5Name: ingredientsArray[4],
                                                           ingredient6Name: ingredientsArray[5],
                                                           ingredient7Name: ingredientsArray[6],
                                                           ingredient8Name: ingredientsArray[7],
                                                           ingredient9Name: ingredientsArray[8],
                                                           ingredient10Name: ingredientsArray[9],
                                                           ingredient11Name: ingredientsArray[10],
                                                           ingredient12Name: ingredientsArray[11],
                                                           ingredient13Name: ingredientsArray[12],
                                                           ingredient14Name: ingredientsArray[13],
                                                           ingredient15Name: ingredientsArray[14],
                                                           ingredient16Name: ingredientsArray[15],
                                                           ingredient1Amount: ozStringArray[0],
                                                           ingredient2Amount: ozStringArray[1],
                                                           ingredient3Amount: ozStringArray[2],
                                                           ingredient4Amount: ozStringArray[3],
                                                           ingredient5Amount: ozStringArray[4],
                                                           ingredient6Amount: ozStringArray[5],
                                                           ingredient7Amount: ozStringArray[6],
                                                           ingredient8Amount: ozStringArray[7],
                                                           ingredient9Amount: ozStringArray[8],
                                                           ingredient10Amount: ozStringArray[9],
                                                           ingredient11Amount: ozStringArray[10],
                                                           ingredient12Amount: ozStringArray[11],
                                                           ingredient13Amount: ozStringArray[12],
                                                           ingredient14Amount: ozStringArray[13],
                                                           ingredient15Amount: ozStringArray[14],
                                                           ingredient16Amount: ozStringArray[15],
                                                           dilutionTypeName: dilutionTypeName,
                                                           dilutionPecentage: dilutionPercentage,
                                                           ABV1: percentageArray[0],
                                                           ABV2: percentageArray[1],
                                                           ABV3: percentageArray[2],
                                                           ABV4: percentageArray[3],
                                                           ABV5: percentageArray[4],
                                                           ABV6: percentageArray[5],
                                                           ABV7: percentageArray[6],
                                                           ABV8: percentageArray[7],
                                                           ABV9: percentageArray[8],
                                                           ABV10: percentageArray[9],
                                                           ABV11: percentageArray[10],
                                                           ABV12: percentageArray[11],
                                                           ABV13: percentageArray[12],
                                                           ABV14: percentageArray[13],
                                                           ABV15: percentageArray[14],
                                                           ABV16: percentageArray[15])
        
        print("the cocktail nots were saved and are: \(cocktailNotes)")
        navigationController?.pushViewController(SavedBatches(persistantStorage: StorageProvider.sharedStorageProvider), animated: true)

    }
    
    @objc func clearPageData() {
        cocktailNameField.text = ""
        cocktailIgredientsArray = []
        numberOfCocktailsTextField.text = ""
        ingredientsTableView.reloadData()
        CalculateABV()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cocktailIgredientsArray.count
      
            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = ingredientsTableView.dequeueReusableCell(withIdentifier: CocktailSpecsTableViewCell.coktailIngredientIdentifier , for: indexPath) as! CocktailSpecsTableViewCell
        let cell2 = ingredientsTableView.dequeueReusableCell(withIdentifier: DilutionTableViewCell.dilutionIdentifier, for: indexPath) as! DilutionTableViewCell
        let colorArray = [cocktail.blue, cocktail.red, cocktail.orange, cocktail.lightOrange, cocktail.forestGreen, cocktail.blue, cocktail.red, cocktail.orange, cocktail.lightOrange, cocktail.forestGreen, cocktail.blue, cocktail.red, cocktail.orange, cocktail.lightOrange, cocktail.forestGreen, cocktail.blue ]
     
        cell1.ozTextField.tag = indexPath.row
        cell1.abvTextField.tag = indexPath.row
        cell2.percentTextField.tag = indexPath.row
        cell2.delegate = self
        cell1.delegate = self
        
        
        if cocktailIgredientsArray[indexPath.row].cellSwitch == 0 {
            cell1.specsIngredientLabel.text = "oz. \(cocktailIgredientsArray[indexPath.row].name) "
            cell1.ozTextField.text = cocktailIgredientsArray[indexPath.row].amount
            cell1.abvTextField.text = cocktailIgredientsArray[indexPath.row].abv
            cell1.backgroundColor = colorArray[indexPath.row]
           
            //cell1.backgroundColor = UIColor.clear
            return cell1
        }
        
        if cocktailIgredientsArray[indexPath.row].cellSwitch == 1 {
            cell2.percentLable.text = "% dilution with \(cocktailIgredientsArray[indexPath.row].name)"
            cell2.percentTextField.text = cocktailIgredientsArray[indexPath.row].dilutionPercentageTextField
            cell2.backgroundColor = cocktail.teal
            return cell2
        }
        
        return cell1
        
    }
    
    

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
       return .delete
       
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            cocktailIgredientsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
            CalculateABV()
            tableView.endUpdates()
        }
        
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
// MARK: CocktailSpecsTableViewCellDelegate, CocktailSpecsTableViewDilutionCellDelegate

extension CocktailSpecsVC: CocktailSpecsTableViewCellDelegate, CocktailSpecsTableViewDilutionCellDelegate  {
   
    func didEditCellAmountTextField(indexPath: Int, changedAmountText: String) {
        cocktailIgredientsArray[indexPath].amount = changedAmountText
        CalculateABV()
        
    }
    
    func didEditCellAbvTextField(indexPath: Int, changedAbvText: String) {
        cocktailIgredientsArray[indexPath].abv = changedAbvText
        CalculateABV()
      
    }
    
    
    func didEditDilutionCellTextField(indexPath: Int, changedText: String) {
        
        
        cocktailIgredientsArray[indexPath].dilutionPercentageTextField = changedText
        CalculateABV()
        
        
    }
    
}
// MARK: AddIngredientToTableViewDelegate, AddNotesDelegate

extension CocktailSpecsVC: AddIngredientToTableViewDelegate, AddNotesDelegate {
    

    func addIngredientToTableView(name: String, amount: String, aBV: String, dilutionPercentage: String, cellSwitch: Int) {
        
        var nonDilutionIngredient = 0
        if cellSwitch == 1 {
            for i in 0..<cocktailIgredientsArray.count {
                
                if cocktailIgredientsArray[i].cellSwitch == 1 {
                    cocktailIgredientsArray.remove(at: i)
                }
            }
        }
        
        for i in 0..<cocktailIgredientsArray.count {
            if cocktailIgredientsArray[i].cellSwitch == 0 {
                nonDilutionIngredient += 1
            }
        }
        if nonDilutionIngredient == 15 {
            alert.showAlert(with: "That's too many ingredients!", message: "To add another, you'll have to delete one by swiping left.", on: self)
            return
        } else {
            cocktailIngredient.name = name
            cocktailIngredient.amount = amount
            cocktailIngredient.abv = aBV
            cocktailIngredient.dilutionPercentageTextField = dilutionPercentage
            cocktailIngredient.cellSwitch = cellSwitch
            cocktailIgredientsArray.append(cocktailIngredient)
            rearrangeArray()
            CalculateABV()
            ingredientsTableView.reloadData()
        }
        
    }
    func dismissAlert() {
        alert.dismissAlert()
        
    }
    func showAllert() {
        let alertView = UIAlertController(title: "Oops!", message: "OK, Jeff Berry. That's too many ingredients. To add another ingredient, you'll have to delete one. Maybe rethink this build?🤔", preferredStyle: .actionSheet)
        alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertView, animated: true)
    }

}


