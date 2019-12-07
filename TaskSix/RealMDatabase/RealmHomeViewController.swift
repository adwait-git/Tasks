//
//  RealmHomeViewController.swift
//  TaskSix
//
//  Created by AllSpark on 07/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import UIKit

class RealmHomeViewController: BaseViewController {

    @IBOutlet var tableViewRealm: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarForLeftMenuIcon(title: "Real-M Demo")
       self.tableViewRealm.delegate = self //Set the delegate
        self.tableViewRealm.dataSource = self //Set the datasource
//        let item = Item()
//        item.textString = "Hey! It work!"
//        DBManager.sharedInstance.addData(object: item)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        tableViewRealm.reloadData()
    }

   
    @IBAction func addData(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RealmDetailViewController") as! RealmDetailViewController
        vc.currentItem = nil
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
}
extension RealmHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.sharedInstance.getDataFromDB().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealMTableViewCell", for: indexPath) as! RealMTableViewCell
        let index = Int(indexPath.row)
        let item = DBManager.sharedInstance.getDataFromDB()[index] as Item
         cell.labelNotes.text = item.textString // [5]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // if(indexPath.row > -1) {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "RealmDetailViewController") as! RealmDetailViewController
                let index = Int(indexPath.row)
                let item = DBManager.sharedInstance.getDataFromDB()[index]  as Item
                vc.currentItem = item
                navigationController?.pushViewController(vc, animated: true)
         //   }
         //   else {           // }
       // }
    }
}
