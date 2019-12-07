//
//  RealmDetailViewController.swift
//  TaskSix
//
//  Created by AllSpark on 07/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import UIKit

class RealmDetailViewController: BaseViewController {

    var currentItem: Item?
    @IBOutlet var txtNote: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackButtonInNav()
        if let item = currentItem {
            txtNote.text = item.textString
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButtonClicked(_ sender: Any) {
        let item = Item()
        if(currentItem == nil) {
            // if is a new Item then calculate a new ID, else use the current ID
            item.ID = DBManager.sharedInstance.getDataFromDB().count
              self.navigationController?.popViewController(animated: true)
        }
        item.textString = txtNote.text!
        DBManager.sharedInstance.addData(object: item)
       self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        if let item = currentItem {
            DBManager.sharedInstance.deleteFromDb(object: item)
            navigationController?.popViewController(animated: true)
        }
//        let predicate = NSPredicate(format: "UUID == %@", product.uuid)
//        if let productToDelete = realm.object(Item.self)
//            .filter(predicate).first {
//            realm.delete(productToDelete)
//        }
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
