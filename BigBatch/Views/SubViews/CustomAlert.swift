//
//  CustomAlert.swift
//  BigBatch
//
//  Created by James on 12/29/22.
//

import UIKit

class Alert {
    
    struct Constants {
        static let backgroundAlphaTo: CGFloat = 0.9
    }
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.7
        return backgroundView
    }()
    
    private let alertView: UIView = {
        let alert = UIView()
        alert.backgroundColor = UIColor.systemGray2
        alert.layer.borderWidth = 0
        alert.layer.borderColor = CGColor(red: 219/255, green:7/255, blue: 61/255, alpha: 1.0)
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 45
        return alert

    }()
    
    private var myTargetView: UIView?
    
    func showAlert(with title: String, message: String, on viewController: UIViewController){
        guard let targetView = viewController.view else {
            return
        }
        
        myTargetView = targetView
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        
        
        targetView.addSubview(alertView)
        alertView.frame = CGRect(x: 40,
                                 y: -300,
                                 width: targetView.frame.size.width-80,
                                 height: 250)
        
        let gradientLayer = CAGradientLayer.gradientLayer(for: .cocktailSpecs, in: CGRect(x: 40,
                                                                                         y: -300,
                                                                                         width: targetView.frame.size.width-80,
                                                                                         height: 250))
        gradientLayer.frame = alertView.bounds
        alertView.layer.insertSublayer(gradientLayer, at: 0)
        
        let titleLabel = UILabel(frame: CGRect(x: 0,
                                               y: 0,
                                               width: alertView.frame.size.width,
                                               height: 55))
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(red: 219/255, green:7/255, blue: 61/255, alpha: 1.0)
        titleLabel.font = .systemFont(ofSize: CGFloat(22), weight: .bold)
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 15,
                                               y: 35,
                                               width: alertView.frame.size.width-25,
                                               height: 170))
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: CGFloat(18), weight: .bold)
        alertView.addSubview(messageLabel)
        
        let button = UIButton(frame: CGRect(x: 0,
                                            y: alertView.frame.size.height-50,
                                            width: alertView.frame.size.width,
                                            height: 50))
        
        button.setTitle("Close", for: .normal)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        button.backgroundColor = .clear
        button.layer.borderColor = CGColor(red: 219/255, green:7/255, blue: 61/255, alpha: 1.0)
        alertView.addSubview(button)
        UIView.animate(withDuration: 0.50, animations: {
            
            self.alertView.frame = CGRect(x: 40,
                                     y: -300,
                                     width: targetView.frame.size.width-80,
                                     height: 250)

        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25, animations: {
                    self.alertView.center = targetView.center
                })
            }
            
        })
    }
    
    @objc func dismissAlert() {
        guard let targetView = myTargetView else { return }
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.alertView.frame = CGRect(x: 40,
                                          y: targetView.frame.size.height,
                                          width: targetView.frame.size.width-80,
                                          height: 250)
            
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25, animations: {
                    self.backgroundView.alpha = 0
                }, completion: {done in
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                    }
                })
            }
            
        })
    }
}
