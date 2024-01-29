//
//  CocktailSpecsVC.swift
//  BigBatch
//
//  Created by James on 12/10/22.
//

import UIKit


class CocktailSpecsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
   
    let alert = Alert()

    let labelHeight = CGFloat(40)
    var cocktail = CocktailModel()
    let colorPalette = ColorPalette()
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

    init(cocktailModel: CocktailModel){
        self.cocktail = cocktailModel
        let namesArray = cocktail.getNames()
        let amountsArray = cocktail.getAmounts()
        let abvArray = cocktail.getABV()
        cocktailNameField.text = cocktail.cocktailName
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
        cocktailNotes = cocktail.notes
        if cocktail.dilutionType != "" {
            cocktailIngredient.name = cocktail.dilutionType
            cocktailIngredient.dilutionPercentageTextField = cocktail.dilutionPercentage
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
        setupKeyboardHiding()
        configureTopAnchorFields()
        configureBottomAnchorButtons()
        configureTableView()
        
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
    
    func refreshBackground() {
        let gradientLayer = CAGradientLayer.gradientLayer(for: .savedBatches, in: view.frame)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
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
        
    }
   
    @objc func BatchedView() {
 
        guard let cocktailName = cocktailNameField.text,
              let initialCocktialCount = numberOfCocktailsTextField.text else { return }

        var cocktailOzAmounts = cocktail.getAmounts()
        var cocktailIngredientsNames = cocktail.getNames()


        cocktail.cocktailName = cocktailName
        cocktail.initialCocktailsNumber = initialCocktialCount
        
        if initialCocktialCount == "" {
            cocktail.initialCocktailsNumber = "1.0"
        }
            
        for i in 0..<cocktailIgredientsArray.count {
            if cocktailIgredientsArray[i].cellSwitch == 0 {
                cocktailIngredientsNames[i] = cocktailIgredientsArray[i].name
                cocktailOzAmounts[i] = cocktailIgredientsArray[i].amount
            } else {
                cocktail.dilutionPercentage = cocktailIgredientsArray[i].dilutionPercentageTextField
                cocktail.dilutionType = cocktailIgredientsArray[i].name
               
            }
        }
        
        cocktail.ingredient1Name = cocktailIngredientsNames[0]
        cocktail.ingredient2Name = cocktailIngredientsNames[1]
        cocktail.ingredient3Name = cocktailIngredientsNames[2]
        cocktail.ingredient4Name = cocktailIngredientsNames[3]
        cocktail.ingredient5Name = cocktailIngredientsNames[4]
        cocktail.ingredient6Name = cocktailIngredientsNames[5]
        cocktail.ingredient7Name = cocktailIngredientsNames[6]
        cocktail.ingredient8Name = cocktailIngredientsNames[7]
        cocktail.ingredient9Name = cocktailIngredientsNames[8]
        cocktail.ingredient10Name = cocktailIngredientsNames[9]
        cocktail.ingredient11Name = cocktailIngredientsNames[10]
        cocktail.ingredient12Name = cocktailIngredientsNames[11]
        cocktail.ingredient13Name = cocktailIngredientsNames[12]
        cocktail.ingredient14Name = cocktailIngredientsNames[13]
        cocktail.ingredient15Name = cocktailIngredientsNames[14]
        cocktail.ingredient16Name = cocktailIngredientsNames[15]
        cocktail.ozAmount1 = cocktailOzAmounts[0]
        cocktail.ozAmount2 = cocktailOzAmounts[1]
        cocktail.ozAmount3 = cocktailOzAmounts[2]
        cocktail.ozAmount4 = cocktailOzAmounts[3]
        cocktail.ozAmount5 = cocktailOzAmounts[4]
        cocktail.ozAmount6 = cocktailOzAmounts[5]
        cocktail.ozAmount7 = cocktailOzAmounts[6]
        cocktail.ozAmount8 = cocktailOzAmounts[7]
        cocktail.ozAmount9 = cocktailOzAmounts[8]
        cocktail.ozAmount10 = cocktailOzAmounts[9]
        cocktail.ozAmount11 = cocktailOzAmounts[10]
        cocktail.ozAmount12 = cocktailOzAmounts[11]
        cocktail.ozAmount13 = cocktailOzAmounts[12]
        cocktail.ozAmount14 = cocktailOzAmounts[13]
        cocktail.ozAmount15 = cocktailOzAmounts[14]
        cocktail.ozAmount16 = cocktailOzAmounts[15]
        
        navigationController?.pushViewController(BatchedVC1(cocktail: cocktail), animated: true)
        
        
    }
    
    @objc func CalculateABV() {
        var aBVModel = ABVModel()
        var pureAlcoholVolumeArray = aBVModel.getPureAlcoholAmounts()
        var aBVArray = aBVModel.getABVs()
        for i in 0..<cocktailIgredientsArray.count {
            aBVModel.preDilutionVolume += Double(cocktailIgredientsArray[i].amount) ?? 0.0
            aBVArray[i] = Double(cocktailIgredientsArray[i].abv) ?? 0.0
            aBVArray[i] = aBVArray[i] / 100
            pureAlcoholVolumeArray[i] = Double(cocktailIgredientsArray[i].amount) ?? 0.0
            pureAlcoholVolumeArray[i] = pureAlcoholVolumeArray[i] * aBVArray[i]
            aBVModel.totalPureAlcohol += pureAlcoholVolumeArray[i]
            if cocktailIgredientsArray[i].cellSwitch == 1 {
                let dilutionPercentageWholeNumber = Double(cocktailIgredientsArray[i].dilutionPercentageTextField) ?? 0.0
                aBVModel.dilutionPercentage = dilutionPercentageWholeNumber / 100.0
            }
        }
        
        let dilutionToAddToPreDilution = aBVModel.preDilutionVolume * aBVModel.dilutionPercentage
        let totalVolumeForABVCalculation = aBVModel.preDilutionVolume + dilutionToAddToPreDilution
        let preABVCalculation = aBVModel.totalPureAlcohol / totalVolumeForABVCalculation
        let aBVCalculation = preABVCalculation * 100
        
        if cocktailIgredientsArray.count == 0 {
            finalABVCalculation.text = "Your ABV is 0%"
        } else {
            finalABVCalculation.text = "Your ABV is \(aBVCalculation.truncate(places: 2))%"
        }
 
    }
    
    @objc func addCocktailToSavedCocktailsArray() {
        
        
        var percentageArray = cocktail.getABV()
        var ozStringArray = cocktail.getAmounts()
        var ingredientsArray = cocktail.getNames()
        
        for i in 0..<cocktailIgredientsArray.count {
            if cocktailIgredientsArray[i].cellSwitch == 1 {
                cocktail.dilutionType = cocktailIgredientsArray[i].name
                cocktail.dilutionPercentage = cocktailIgredientsArray[i].dilutionPercentageTextField
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
                                                           dilutionTypeName: cocktail.dilutionType,
                                                           dilutionPecentage: cocktail.dilutionPercentage,
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
        let colorArray = colorPalette.getTableViewColors()
     
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
            cell2.backgroundColor = colorPalette.teal
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
        numberOfCocktailsTextField.attributedPlaceholder = NSAttributedString(string: "#", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        addAnIngredientButton.setTitle("➕ Ingredient", for: .normal)
        //cocktailNameField.placeholder = "Enter a cocktail name."
        cocktailNameField.attributedPlaceholder = NSAttributedString(string: "Enter a cocktail name.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
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
  
}

