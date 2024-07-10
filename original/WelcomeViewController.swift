//
//  FirstViewController.swift
//  original
//
//  Created by 田中志門 on 2024/06/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var mymeisi: UIImageView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mymeisi.image = retrieveImage(forKey: "meisi")
        //デバッグ用
//        UserDefaults.standard.set(false, forKey: "visit")
//        UserDefaults.standard.set(false, forKey: "update")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        setup()
    }
    
    func modal1() {
        performSegue(withIdentifier: "A", sender: nil)
        print("start")
    }
    
    
    func setup() {
        let visit = UserDefaults.standard.bool(forKey: "visit")
        if visit {
            print("OK")
            check()
        } else {
            UserDefaults.standard.set(true, forKey: "visit")
            print("First")
            modal1()
        }
    }
    
    
    func modal2() {
        performSegue(withIdentifier: "B", sender: nil)
        print("update")
    }
    
    func check() {
        let update = UserDefaults.standard.bool(forKey: "update")
        if update {
            print("OK")
        } else {
            UserDefaults.standard.set(true, forKey: "update")
            print("update")
            modal2()
        }
    }
    
    
    func retrieveImage(forKey key: String) -> UIImage? {
           if let filePath = self.filePath(forKey: key), let fileData = FileManager.default.contents(atPath: filePath.path), let image = UIImage(data: fileData) {
               return image
           }
           return nil
       }
    
    func filePath(forKey key: String) -> URL? {
            let fileManager = FileManager.default
            guard let documentURL = fileManager.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
            return documentURL.appendingPathComponent(key + ".png")
        }
}
