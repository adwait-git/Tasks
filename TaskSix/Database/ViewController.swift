//
//  ViewController.swift
//  FMDBDatabase Demo
//
//  Created by Parth Changela on 22/06/17.
//  Copyright © 2017 Micropple. All rights reserved.
//

import UIKit

class ViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,buttonDeleget {

    @IBOutlet weak var tblTableview: UITableView!
    var GetAllDataInfo  = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarForLeftMenuIcon(title: "Database Sql")
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        GetAllDataInfo = FMDBDatabaseModel.getInstance().GetAllData()
        tblTableview.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func EditButton(sender: InfoTableViewCell) {
        print("Edit clicked ")
        let cell = sender.tag
        var l = Tbl_Info()
        l = GetAllDataInfo.object(at: sender.tag) as! Tbl_Info
        let MainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DV = MainStoryboard.instantiateViewController(withIdentifier: "EditDataViewController") as! EditDataViewController
        DV.getId = l.Id
        DV.getName = l.Name
        DV.getMobileNo = l.MobileNo
        DV.getEmail = l.Email
        self.navigationController?.pushViewController(DV, animated: true)
    }
    func DeleteButton(sender: InfoTableViewCell) {
        let cell = sender.tag
        var l = Tbl_Info()
        l = GetAllDataInfo.object(at: sender.tag) as! Tbl_Info
        _ = FMDBDatabaseModel.getInstance().deleteRecode(RecoreId: l.Id)
        GetAllDataInfo = FMDBDatabaseModel.getInstance().GetAllData()
        tblTableview.reloadData()
    }

    @IBAction func btnInsertTapped(_ sender: Any) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GetAllDataInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as! InfoTableViewCell
        cell.editData = self
        cell.tag = indexPath.row
        var l = Tbl_Info()
        l = GetAllDataInfo.object(at: indexPath.row) as! Tbl_Info
        cell.lblName.text! = l.Name
        cell.lblMobileNo.text! = l.MobileNo
        cell.lblEmail.text! = l.Email
        return cell
    }

    @IBAction func insertDataClicked(_ sender: Any) {
        let MainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DV = MainStoryboard.instantiateViewController(withIdentifier: "InsertDataViewController") as! InsertDataViewController
        self.navigationController?.pushViewController(DV, animated: true)
    }
}

