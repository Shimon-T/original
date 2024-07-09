//
//  ViewController.swift
//  original
//
//  Created by 田中志門 on 2024/06/16.
//

import UIKit
import PhotosUI

class Fromtemplate: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var backgroundImageiew: UIImageView!
    @IBOutlet var companylabel: UILabel!
    @IBOutlet var companyTextField: UITextField!
    @IBOutlet var wherelabel: UILabel!
    @IBOutlet var whereTextField: UITextField!
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var contactlabel: UILabel!
    @IBOutlet var contactTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyTextField.delegate = self
        whereTextField.delegate = self
        nameTextField.delegate = self
        contactTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back() {
        dismiss(animated: true)
    }
    
    @IBAction func next_check() {
        UIGraphicsBeginImageContextWithOptions(backgroundImageiew.frame.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: -backgroundImageiew.frame.origin.x, y: -backgroundImageiew.frame.origin.y)
        view.layer.render(in: context)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if let screenshot {
            self.store(image: screenshot, forKey: "meisi")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        switch (textField.tag) {
            
        case 1:
            companylabel.text = companyTextField.text ?? ""
        case 2 :
            wherelabel.text = whereTextField.text ?? ""
        case 3 :
            namelabel.text = nameTextField.text ?? ""
        case 4 :
            contactlabel.text = contactTextField.text ?? ""
            
        default :
            break
        }
        return true
    }
    
    func store(image: UIImage, forKey key: String) {
        if let pngRepresentation = image.pngData() {

            if let filePath = filePath(forKey: key) {
                do  {
                    try pngRepresentation.write(to: filePath, options: .atomic)
                } catch let error {
                    print(error)
                }
            }
        }
    }
    
    func filePath(forKey key: String) -> URL? {
        let fileManager = FileManager.default
        guard let documentURL = fileManager.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
        return documentURL.appendingPathComponent(key + ".png")
    }
}
