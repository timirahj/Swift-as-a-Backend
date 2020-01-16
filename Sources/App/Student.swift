//
//  Student.swift
//  App
//
//  Created by Timirah James on 1/16/20.
//

import FluentSQLite
import Foundation
import Vapor

struct Student: Content, SQLiteModel, Migration {
    var id: Int?
    var name: String
    var gradeLevel: Int
    var mathGrade: String
    var sciGrade: String
}
