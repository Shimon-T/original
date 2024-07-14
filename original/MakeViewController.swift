//
//  ViewController.swift
//  original
//
//  Created by 田中志門 on 2024/06/16.
//

import UIKit
import PhotosUI

class MakeViewController: UIViewController, PHPickerViewControllerDelegate {
    
    
    
    @IBOutlet var backgroundImageiew: UIImageView!
    @IBOutlet var yourimagebutton: UIButton!
    @IBOutlet var select1_b: UIButton!
    @IBOutlet var select2_b: UIButton!
    @IBOutlet var select3_b: UIButton!
    @IBOutlet var select4_b: UIButton!
    
    @IBOutlet var black_b: UIButton!
    @IBOutlet var white_b: UIButton!
    @IBOutlet var red_b: UIButton!
    @IBOutlet var blue_b: UIButton!
    @IBOutlet var erase_b: UIButton!
    
    
    var whatselected: String = "select1"
    var myimage: UIImage?
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var ButtonArray: [UIButton] = []
    
    
    var width: CGFloat!
    var height: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        let select1 = saveData.object(forKey: "select1") as? String
        let select2 = saveData.object(forKey: "select2") as? String
        let select3 = saveData.object(forKey: "select3") as? String
        let select4 = saveData.object(forKey: "select4") as? String
        
        width = view.frame.width * CGFloat(0.5) - CGFloat(150)
        height = view.frame.height * CGFloat(0.5) - CGFloat(150)
        
        select1_b.setTitle(select1, for: .normal)
        select2_b.setTitle(select2, for: .normal)
        select3_b.setTitle(select3, for: .normal)
        select4_b.setTitle(select4, for: .normal)
        
        self.black_b.isHidden = true
        self.white_b.isHidden = true
        self.red_b.isHidden = true
        self.blue_b.isHidden = true
        self.black_b.isHidden = true
        self.erase_b.isHidden = true
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        ButtonArray.append(sender)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if erase_b.isHidden {
            self.black_b.isHidden = false
            self.white_b.isHidden = false
            self.red_b.isHidden = false
            self.blue_b.isHidden = false
            self.black_b.isHidden = false
            self.erase_b.isHidden = false
        }
        
        
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: view)
        let ButtonView = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 70))
        
        
        if whatselected == "select1" {
            ButtonView.setTitle(saveData.object(forKey: "select1") as? String, for: .normal)
            ButtonView.center = CGPoint(x: location.x, y: location.y)
            ButtonView.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            if location.x > width && location.x < width+300 {
                if location.y > height && location.y < height+400 {
                    view.addSubview(ButtonView)
                } else {
                    print("else_y")
                }
            } else {
                print("else_x")
            }
            whatselected = "select"
            print("select1")
        }
        
        if whatselected == "select2" {
            ButtonView.setTitle(saveData.object(forKey: "select2") as? String, for: .normal)
            ButtonView.center = CGPoint(x: location.x, y: location.y)
            ButtonView.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            if location.x > width && location.x < width+300 {
                if location.y > height && location.y < height+400 {
                    view.addSubview(ButtonView)
                } else {
                    print("else_y")
                }
            } else {
                print("else_x")
            }
            whatselected = "select"
            print("select2")
        }
        if whatselected == "select3" {
            ButtonView.setTitle(saveData.object(forKey: "select3") as? String, for: .normal)
            ButtonView.center = CGPoint(x: location.x, y: location.y)
            ButtonView.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            if location.x > width && location.x < width+300 {
                if location.y > height && location.y < height+400 {
                    view.addSubview(ButtonView)
                } else {
                    print("else_y")
                }
            } else {
                print("else_x")
            }
            whatselected = "select"
            print("select3")
        }
        if whatselected == "select4" {
            ButtonView.setTitle(saveData.object(forKey: "select4") as? String, for: .normal)
            ButtonView.center = CGPoint(x: location.x, y: location.y)
            ButtonView.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            if location.x > width && location.x < width+300 {
                if location.y > height && location.y < height+400 {
                    view.addSubview(ButtonView)
                } else {
                    print("else_y")
                }
            } else {
                print("else_x")
            }
            whatselected = "select"
            print("select4")
        }
        
        if whatselected == "select" {
            
        }
        
        ButtonArray.append(ButtonView)
        
    }
    
    
    @IBAction func black(){
        ButtonArray.last!.setTitleColor(UIColor.black, for: .normal)
        ButtonArray.last!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        print("black")
    }
    @IBAction func white(){
        ButtonArray.last!.setTitleColor(UIColor.white, for: .normal)
        ButtonArray.last!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        print("white")
    }
    
    @IBAction func red(){
        ButtonArray.last!.setTitleColor(UIColor.red, for: .normal)
        ButtonArray.last!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        print("red")
    }
    @IBAction func blue(){
        ButtonArray.last!.setTitleColor(UIColor.blue, for: .normal)
        ButtonArray.last!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        print("blue")
    }
    
    @IBAction func erase(){
        ButtonArray.last!.removeFromSuperview()
        ButtonArray.removeLast()
        print("erase")
    }
    
    @IBAction func select1() {
        whatselected = "select1"
    }
    
    @IBAction func select2() {
        whatselected = "select2"
    }
    
    @IBAction func select3() {
        whatselected = "select3"
    }
    
    @IBAction func select4() {
        whatselected = "select4"
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
    
    @IBAction func back() {
        dismiss(animated: true)
    }
    
    @IBAction func yourimage() {
        var configuration = PHPickerConfiguration()
        
        let filter = PHPickerFilter.images
        configuration.filter = filter
        let picker = PHPickerViewController(configuration: configuration)
        
        picker.delegate = self
        
        present(picker, animated: true)
        
    }
    
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        
        
        
        if let itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    
                    self.backgroundImageiew.image = image as? UIImage
                }
            }
        }
        
                                            
        dismiss(animated: true)
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
