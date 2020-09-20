//
//  Extensions.swift
//  TDL-app
//
//  Created by Meitar Basson on 20/09/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String, actionText: String, completion: @escaping (String) -> ()) {
        var text = ""
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionText, style: .default, handler: { (UIAlertAction) in
            text = alert.textFields?.first?.text as! String
            completion(text)
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        setTextField(alert: alert)
        
        present(alert, animated: true, completion: nil)
    }
    
    func setTextField(alert: UIAlertController) {
        alert.addTextField { (newTextField) in
            newTextField.placeholder = "task here"
        }
    }
}


