//
//  Item.swift
//  TaskSix
//
//  Created by AllSpark on 07/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class Item: Object {
    @objc dynamic var ID = 0
    @objc dynamic var textString = ""
    override static func primaryKey() -> String? {
        return "ID"
    }
}

