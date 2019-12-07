//
//  UserDefaultsDetailViewController.swift
//  TaskSix
//
//  Created by AllSpark on 08/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import UIKit

class UserDefaultsDetailViewController: BaseViewController {

    @IBOutlet var lblMailId: UILabel!
    @IBOutlet var lblAge: UILabel!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblPhoneNumber: UILabel!
    var defaults = UserDefaults.standard
    
    var getData = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   setUpBackButtonInNav()
        getData = (defaults.object(forKey: "data") as? NSArray)!
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData() {
        lblUserName.text = getData[0] as? String
        lblPhoneNumber.text = getData[1] as? String
        lblAge.text = getData[2] as? String
        lblMailId.text = getData[3] as? String
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
