//
//  UserDefaultsViewController.swift
//  TaskSix
//
//  Created by AllSpark on 08/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import UIKit

class UserDefaultsViewController: BaseViewController {
    var data = NSMutableArray()
    let defaults = UserDefaults.standard
    @IBOutlet var txtMailID: UITextField!
    @IBOutlet var txtAge: UITextField!
    @IBOutlet var txtPhoneNumber: UITextField!
    @IBOutlet var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarForLeftMenuIcon(title: "User Defaults")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addDataClicked(_ sender: Any) {
        if txtAge.text == "" || txtName.text == "" || txtMailID.text == "" || txtPhoneNumber.text == "" {
            invokeAlertMethod(strTitle: "Error", strBody: "Please make sure all data is filled", delegate: nil)
        }
        else {
            data.insert(txtName.text, at: 0)
            data.insert(txtPhoneNumber.text, at: 1)
            data.insert(txtAge.text, at: 2)
            data.insert(txtMailID.text, at: 3)
            defaults.set(data, forKey: "data")
            let vc = storyboard?.instantiateViewController(withIdentifier: "UserDefaultsDetailViewController") as! UserDefaultsDetailViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
