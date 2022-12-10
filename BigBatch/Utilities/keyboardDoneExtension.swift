//
//  keyboardDoneExtension.swift
//  BigBatch
//
//  Created by James on 12/8/22.
//

import Foundation
import UIKit

extension UIViewController{
    func toolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 0.3)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onClickCancelButton))
        
//        let textField = UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 15))
//
//        let keyboardTextField = UIBarButtonItem(customView: textField)
//        keyboardTextField.width = 250
//        keyboardTextField.ise
        

        doneButton.tintColor = .white
        
        cancelButton.tintColor = .white
        
        toolBar.setItems([space, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
    }

    @objc func onClickDoneButton(){
        view.endEditing(true)
    }

    @objc func onClickCancelButton(){
        view.endEditing(true)
    }
}
