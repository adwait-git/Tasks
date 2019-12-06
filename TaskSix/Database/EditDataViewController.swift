//
//  EditDataViewController.swift
//  FMDBDatabase Demo
//
//  Created by Parth Changela on 26/06/17.
//  Copyright © 2017 Micropple. All rights reserved.
//

import UIKit

class EditDataViewController: BaseViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!

    var getId:Int = Int()
    var getName = ""
    var getMobileNo = ""
    var getEmail = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  setUpBackButtonInNav()
        txtName.text! = getName
        txtMobileNo.text! = getMobileNo
        txtEmail.text! = getEmail


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnUpdateTapped(_ sender: Any) {
        _ = FMDBDatabaseModel.getInstance().updateRecode(RecoreId: getId, Name: txtName.text!, MobileNo: txtMobileNo.text!, Email: txtEmail.text!)

        Util.invokeAlertMethod(strTitle: "", strBody: "recode updated !!", delegate: nil)
             navigationController?.popViewController(animated: true)
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
