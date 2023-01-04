//
//  SplitBatchVC.swift
//  BigBatch
//
//  Created by James on 12/15/22.
//

import UIKit

class SplitBatchVC: UIViewController {
    
    
    var batchedCocktailName = ""
    var containerSize = ""
    
    var cocktailCountLabel = TypeLabel()
    var cocktailCountTextField = CocktailIngredientAmountTF()
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
    var batchedIngredient10 = 0
    var batchedIngredient11 = 0
    var batchedIngredient12 = 0
    var batchedIngredient13 = 0
    var batchedIngredient14 = 0
    var batchedIngredient15 = 0
    var batchedIngredient16 = 0
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
         dilutionAmount: String,
         dilutionName: String){
        
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
        
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabelsAndTableViews()
        
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
        
    }
    
    func configureLabelsAndTableViews() {
        view.addSubview(cocktailCountLabel)
        view.addSubview(containerTypeLabel)
        view.addSubview(wholeContainerLabel)
        view.addSubview(wholeContainerBatchTableView)
        view.addSubview(remainderContainerLabel)
        view.addSubview(remainderContainerBatchTableView)
        view.addSubview(totalVolumeLabel)
        view.addSubview(cocktailCountTextField)
    
        containerTypeLabel.text = "Container Size: \(containerSize)"
        containerTypeLabel.textAlignment = .center
        
        cocktailCountLabel.text = "Cocktail Count:"
        wholeContainerLabel.text = "Whole batch containter recipe:"
        remainderContainerLabel.text = "Remaininder batch:"
        wholeContainerLabel.textAlignment = .left
        remainderContainerLabel.textAlignment = .left
        cocktailCountLabel.textAlignment = .center
        wholeContainerBatchTableView.translatesAutoresizingMaskIntoConstraints = false
        wholeContainerBatchTableView.backgroundColor = .systemPurple
        remainderContainerBatchTableView.translatesAutoresizingMaskIntoConstraints = false
        remainderContainerBatchTableView.backgroundColor = .systemBrown
        
        NSLayoutConstraint.activate([
            containerTypeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            containerTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            containerTypeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            containerTypeLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            
            cocktailCountLabel.topAnchor.constraint(equalTo: containerTypeLabel.bottomAnchor),
            cocktailCountLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            cocktailCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cocktailCountLabel.widthAnchor.constraint(equalToConstant: 145),
            
            cocktailCountTextField.topAnchor.constraint(equalTo: cocktailCountLabel.topAnchor),
            cocktailCountTextField.leadingAnchor.constraint(equalTo: cocktailCountLabel.trailingAnchor, constant: 5),
            cocktailCountTextField.heightAnchor.constraint(equalToConstant: labelHeight),
            cocktailCountTextField.widthAnchor.constraint(equalToConstant: 60),
            
            wholeContainerLabel.topAnchor.constraint(equalTo: cocktailCountLabel.bottomAnchor),
            wholeContainerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            wholeContainerLabel.widthAnchor.constraint(equalToConstant: 250),
            wholeContainerLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            
            wholeContainerBatchTableView.topAnchor.constraint(equalTo: wholeContainerLabel.bottomAnchor),
            wholeContainerBatchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            wholeContainerBatchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            wholeContainerBatchTableView.bottomAnchor.constraint(equalTo: remainderContainerLabel.topAnchor),
            
            remainderContainerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60),
            remainderContainerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            remainderContainerLabel.widthAnchor.constraint(equalToConstant: 250),
            remainderContainerLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            
            remainderContainerBatchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            remainderContainerBatchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            remainderContainerBatchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            remainderContainerBatchTableView.topAnchor.constraint(equalTo: remainderContainerLabel.bottomAnchor),

        
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
    
    func refreshBackground() {
        let gradientLayer = CAGradientLayer.gradientLayer(for: .savedBatches, in: view.frame)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
   
    }


}
