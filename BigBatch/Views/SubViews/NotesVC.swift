//
//  NotesVC.swift
//  BigBatch
//
//  Created by James on 12/14/22.
//

import UIKit
protocol AddNotesDelegate {
    
    func addNotes(notes: String)
    
}
class NotesVC: UIViewController, UITextFieldDelegate{

    var notesVCNotes = ""
    let textField = UITextView()
    let addToNotesButton = BatchButton()
    
    var addNotesDelegate: AddNotesDelegate?
    
    init(notes: String) {
        notesVCNotes = notes
        print("The nots are: \(notes)")
        textField.text = notes
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configrueNotes()
        setupKeyboardHiding()
       
    }
    

    override func viewWillAppear(_ animated: Bool) {
        refreshBackground()
        
        super.viewWillAppear(animated)
    }
    
    func refreshBackground() {
        let gradientLayer = CAGradientLayer.gradientLayer(for: .batchScreen, in: view.frame)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }


    func configrueNotes() {
        view.addSubview(textField)
        view.addSubview(addToNotesButton)
        addToNotesButton.setTitle("➕ to Notes", for: .normal)
        addToNotesButton.addTarget(self, action: #selector(saveNotes), for: .touchUpInside)
        addToNotesButton.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1.0)
        addToNotesButton.setTitleColor(.white, for: .normal)
        
        //textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.text = notesVCNotes
        textField.inputAccessoryView = toolBar()
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.contentMode = .scaleToFill
        textField.textColor = .black
        textField.text = notesVCNotes
        NSLayoutConstraint.activate([
           
            textField.topAnchor.constraint(equalTo: view.topAnchor,constant: 30),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 400),
            
            addToNotesButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 60),
            addToNotesButton.heightAnchor.constraint(equalToConstant: 40),
            addToNotesButton.widthAnchor.constraint(equalToConstant: 125),
            addToNotesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        
        ])
        
    }
    
    @objc func saveNotes() {
        
        notesVCNotes = textField.text ?? ""
        addNotesDelegate?.addNotes(notes: notesVCNotes)
        
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
        
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
