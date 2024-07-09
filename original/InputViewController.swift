//
//  CheckViewController.swift
//  original
//
//  Created by 田中志門 on 2024/06/24.
//

import UIKit
class InputViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var select1: UITextField!
    @IBOutlet var select2: UITextField!
    @IBOutlet var select3: UITextField!
    @IBOutlet var select4: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        select1.delegate = self
        select2.delegate = self
        select3.delegate = self
        select4.delegate = self
    }
    
    @IBAction func back() {
        dismiss(animated: true)
    }
    
    @IBAction func next() {
        let alert: UIAlertController = UIAlertController(title:"名刺の向き",message:"",preferredStyle: UIAlertController.Style.alert)
        
        let firstAction: UIAlertAction = UIAlertAction(title:"縦向きで作成する",style: UIAlertAction.Style.default,handler:{
            (action: UIAlertAction!) -> Void in
            print("縦")
            self.performSegue(withIdentifier: "first", sender: nil)
        })
        
        let secondAction: UIAlertAction = UIAlertAction(title: "横向きで作成する", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            print("横")
            self.performSegue(withIdentifier: "secound", sender: nil)
        })
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
        })
        
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        switch (textField.tag) {
            
        case 1:
            saveData.set(select1.text, forKey: "select1")
        case 2 :
            saveData.set(select2.text, forKey: "select2")
        case 3 :
            saveData.set(select3.text, forKey: "select3")
        case 4 :
            saveData.set(select4.text, forKey: "select4")
            
        default :
            break
        }
        return true
    }
}
