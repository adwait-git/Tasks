//
//  FMDBDatabaseModel.swift
//  FMDBDatabase Demo
//
//  Created by Parth Changela on 22/06/17.
//  Copyright © 2017 Micropple. All rights reserved.
//

import Foundation
import UIKit

let sharedInstance = FMDBDatabaseModel()
class FMDBDatabaseModel: NSObject {

    var databese:FMDatabase? = nil

    class func getInstance() -> FMDBDatabaseModel
    {
        if (sharedInstance.databese == nil)
        {
        sharedInstance.databese = FMDatabase(path: Util.getPath(fileName: "FMDBDatabase.sqlite"))
        }
        return sharedInstance
    }

    //MARK:- insert data into table

    func InsertData(_ Tbl_Info:Tbl_Info) -> Bool {
        sharedInstance.databese!.open()
        let isInserted = sharedInstance.databese!.executeUpdate("INSERT INTO Info(Name,MobileNo,Email) VALUES(?,?,?)", withArgumentsIn: [Tbl_Info.Name,Tbl_Info.MobileNo,Tbl_Info.Email])

        sharedInstance.databese!.close()
        return (isInserted != nil)

    }
    func GetAllData() -> NSMutableArray {
        sharedInstance.databese!.open()

        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("SELECT * FROM Info", withArgumentsIn: [0])

        let itemInfo:NSMutableArray = NSMutableArray ()
        if (resultSet != nil)
        {
            while resultSet.next() {

                let item:Tbl_Info = Tbl_Info()
                item.Id = Int(resultSet.int(forColumn: "Id"))
                item.Name = String(resultSet.string(forColumn: "Name")!)
                item.MobileNo = String(resultSet.string(forColumn: "MobileNo")!)
                item.Email = String(resultSet.string(forColumn: "Email")!)
                itemInfo.add(item)
            }
        }

        sharedInstance.databese!.close()
        return itemInfo
    }

    func updateRecode(RecoreId:Int,Name:String,MobileNo:String,Email:String) -> NSMutableArray {
        sharedInstance.databese!.open()

        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("UPDATE Info SET Name = ?,MobileNo = ?,Email = ? WHERE Id = ?", withArgumentsIn: [Name,MobileNo,Email,RecoreId])

        let itemInfo:NSMutableArray = NSMutableArray ()
        if (resultSet != nil)
        {
            while resultSet.next() {

                let item:Tbl_Info = Tbl_Info()
                item.Id = Int(resultSet.int(forColumn: "Id"))
                item.Name = String(resultSet.string(forColumn: "Name")!)
                item.MobileNo = String(resultSet.string(forColumn: "MobileNo")!)
                item.Email = String(resultSet.string(forColumn: "Email")!)
                itemInfo.add(item)
            }
        }

        sharedInstance.databese!.close()
        return itemInfo

    }
    func deleteRecode(RecoreId:Int) -> NSMutableArray {
        sharedInstance.databese!.open()

        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("DELETE FROM Info WHERE Id = ?", withArgumentsIn: [RecoreId])

        let itemInfo:NSMutableArray = NSMutableArray ()
        if (resultSet != nil)
        {
            while resultSet.next() {

                let item:Tbl_Info = Tbl_Info()
                item.Id = Int(resultSet.int(forColumn: "Id"))
                item.Name = String(resultSet.string(forColumn: "Name")!)
                item.MobileNo = String(resultSet.string(forColumn: "MobileNo")!)
                item.Email = String(resultSet.string(forColumn: "Email")!)
                itemInfo.add(item)
            }
        }

        sharedInstance.databese!.close()
        return itemInfo
        
    }
}
