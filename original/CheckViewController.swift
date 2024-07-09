//
//  CheckViewController.swift
//  original
//
//  Created by 田中志門 on 2024/06/26.
//

import UIKit
class CheckViewController: UIViewController {
    
    @IBOutlet var checkimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checkimage.image = retrieveImage(forKey: "meisi")
        
    }
    
    @IBAction func complete() {
        let alert: UIAlertController = UIAlertController(title:"保存が完了しました",message:"",preferredStyle: UIAlertController.Style.alert)
        let OkAction: UIAlertAction = UIAlertAction(title: "ホームに戻る", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "complete", sender: nil)
        })
        
        
        alert.addAction(OkAction)
        
        present(alert, animated: true, completion: nil)
        
        
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
