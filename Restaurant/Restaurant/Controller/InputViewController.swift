//
//  InputViewController.swift
//  Restaurant
//
//  Created by Wirendy on 07/08/19.
//  Copyright © 2019 Wirendy. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    var valueGender: String = ""
    var age: Int? = 0
    var dataService : DataService!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet var genderButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Input Customer Data"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func handleSelection(_ sender: UIButton) {
        genderButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    enum Genders: String {
        case man = "Man"
        case woman = "Woman"
    }
    
    @IBAction func genderTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let gender = Genders(rawValue: title) else {
            return
        }
        
        switch gender {
        case .man:
            print("Man")
            self.valueGender = "Man"
            genderButtons.forEach { (button) in
                UIView.animate(withDuration: 0.3, animations: {
                    button.isHidden = !button.isHidden
                    self.view.layoutIfNeeded()
                })
            }
        default:
            print("Woman")
            self.valueGender = "Woman"
            genderButtons.forEach { (button) in
                UIView.animate(withDuration: 0.3, animations: {
                    button.isHidden = !button.isHidden
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    @IBAction func submitData(_ sender: Any) {
        self.age = Int(ageTextField.text!)
        if (self.valueGender == "") {
            let alert = UIAlertController(title: "Warning", message: "You Must Select Your Gender", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (self.age == 0 || self.age == nil) {
            let alert = UIAlertController(title: "Warning", message: "You Must Input Your Age", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            print(self.age!)
            self.dataService?.addAge(addAge: self.age!)
            if (self.valueGender == "Man") {
                self.dataService?.addManCount()
            } else {
                self.dataService?.addWomanCount()
            }
            let alert = UIAlertController(title: "Success", message: "Successfully add your data", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
