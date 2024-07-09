//
//  StartViewController.swift
//  original
//
//  Created by 田中志門 on 2024/06/27.
//

import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        UserDefaults.standard.set(false, forKey: "update")
        super.viewDidLoad()
    }
    
    
    @IBAction func start() {
        dismiss(animated: true)
    }
}
