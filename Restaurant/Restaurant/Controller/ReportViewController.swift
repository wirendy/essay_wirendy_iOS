//
//  ReportViewController.swift
//  Restaurant
//
//  Created by Wirendy on 07/08/19.
//  Copyright © 2019 Wirendy. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    @IBOutlet weak var labelCustomerData: UILabel!
    var averageAge: Int = 0
    var manCount: Int = 0
    var womanCount: Int = 0
    var dataService: DataService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Report Customer Data"
        self.averageAge = self.dataService!.calculateAverageAge()
        self.manCount = self.dataService!.returnManCount()
        self.womanCount = self.dataService!.returnWomanCount()
        self.labelCustomerData.text = "This month you have \(self.manCount) man and \(self.womanCount) woman then the average age is \(self.averageAge)"
        // Do any additional setup after loading the view.
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
