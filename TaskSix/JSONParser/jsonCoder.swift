//
//  jsonCoder.swift
//  TaskSix
//
//  Created by AllSpark on 02/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import Foundation

import Foundation

// MARK: - Food
struct Food: Codable {
    let title: String
    let version: Double
    let href: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let title: String
    let href: String
    let ingredients: String
    let thumbnail: String
}
