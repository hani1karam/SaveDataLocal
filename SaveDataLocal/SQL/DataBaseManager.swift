//
//  DataBaseManager.swift
//  SaveDataLocal
//
//  Created by hany karam on 4/8/22.
//

import Foundation
import SQLite3
class DataBaseManager{
    func openDatabase() -> OpaquePointer? {
        var db:OpaquePointer?
        let fileUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Data.sqlite")
        if sqlite3_open(fileUrl?.path, &db) == SQLITE_OK{
            print("Successfully opened connection to database")
            return db
        }else{
            print("unable to open database.")
            return nil
        }
    }
    
    func createTable(db:OpaquePointer?){
        let createTableString = """
        CREATE TABLE Data(Id INT PRIMARY KEY NOT NULL,
        Name CHAR(255));
"""
        var createTableStatment:OpaquePointer?
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatment, nil) == SQLITE_OK{
            if sqlite3_step(createTableStatment) == SQLITE_DONE {
                print("\nData table created")
            }else{
                print("\nData table is not created")
            }
        }else{
            print("Create table statment is not prepared")
        }
        sqlite3_finalize(createTableStatment)
    }
    
    func insert(id:Int32,name:NSString,db:OpaquePointer?){
        let insertStatementString = "INSERT INTO Data (Id,Name) VALUES (?, ?);"
        var insertStatment:OpaquePointer?
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatment, nil) == SQLITE_OK{
            
            sqlite3_bind_int(insertStatment, 1, id)
            
            sqlite3_bind_text(insertStatment, 2, name.utf8String, -1, nil)
            
            if sqlite3_step(insertStatment) == SQLITE_DONE{
                print("\nSuccessfully inserted row")
            }else{
                print("User with this ID already exists")
            }
        }else{
            print("Insert statment is not prepared")
        }
        sqlite3_finalize(insertStatment)
    }
    
    func delete(db:OpaquePointer?){
        let deleteStatementString = "DELETE FROM Data WHERE Id = 1;"
        var deleteStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) ==
            SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("\nSuccessfully deleted row.")
            } else {
                print("\nCould not delete row.")
            }
        } else {
            print("\nDELETE statement could not be prepared")
        }
        
        sqlite3_finalize(deleteStatement)
        
    }
    func query(db: OpaquePointer?) {
        let queryStatementString = "SELECT * FROM Data;"
        var queryStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
            while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                let id = sqlite3_column_int(queryStatement, 0)
                guard let queryResultCol1 = sqlite3_column_text(queryStatement, 1) else {
                    print("Query result is nil")
                    return
                }
                let name = String(cString: queryResultCol1)
                print("\nQuery Result:")
                print("\(id) | \(name)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
    }
}
