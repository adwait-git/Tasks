//
//  InsertDataViewController.swift
//  FMDBDatabase Demo
//
//  Created by Parth Changela on 22/06/17.
//  Copyright © 2017 Micropple. All rights reserved.
//

import UIKit

class InsertDataViewController: BaseViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtEmail: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackButtonInNav()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnInsertDataTapped(_ sender: Any) {
        var FMDBInfo:Tbl_Info = Tbl_Info()
        FMDBInfo.Name = txtName.text!
        FMDBInfo.MobileNo = txtMobile.text!
        FMDBInfo.Email = txtEmail.text!

        let isInserted = FMDBDatabaseModel.getInstance().InsertData(FMDBInfo)
        if isInserted{
            Util.invokeAlertMethod(strTitle: "Success", strBody: "Insert data successfully", delegate: nil)
            navigationController?.popViewController(animated: true)
        }else
        {
            Util.invokeAlertMethod(strTitle: "Error", strBody: "Error in inserting record", delegate: nil)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
