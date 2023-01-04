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
        let toolBar = UIToolbar(frame:CGRect(x:0, y:0, width:100, height:40))
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 0.3)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton))
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onClickCancelButton))

        doneButton.tintColor = .white
       
        cancelButton.tintColor = .white

        toolBar.setItems([cancelButton, space, doneButton], animated: true)
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

extension UITableViewCell {
    func toolBar() -> UIToolbar{
        let toolBar = UIToolbar(frame:CGRect(x:0, y:0, width:100, height:40))
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 0.3)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton))
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onClickCancelButton))

        doneButton.tintColor = .white
       
        cancelButton.tintColor = .white

        toolBar.setItems([cancelButton, space, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        return toolBar
    }

    @objc func onClickDoneButton(){
        endEditing(true)
    }

    @objc func onClickCancelButton(){
        endEditing(true)
    }
    
    
}
