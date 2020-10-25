//
//  Database.swift
//  Assignment1
//
//  Created by Winnie Tran on 10/20/20.
//

import SQLite3
import Foundation

class Database {
    static var dbObj : Database!
    let dbName = "/Users/winnietran/Desktop/CPSC 411/ClaimDB.sqlite"
    var conn : OpaquePointer?

    init() {
//        1. Create database
        if sqlite3_open(dbName, &conn) == SQLITE_OK {
//        2. Create tables
            initalizeDB()
            sqlite3_close(conn)
        } else {
            let errcode = sqlite3_errcode(conn)
            print("Open database failed due to error \(errcode)")
        }
    }
    
    private func initalizeDB() {
        let sqlStmt = "create table if not exists claim (id text, title text, date text, isSolved integer)"
        if sqlite3_exec(conn, sqlStmt, nil, nil, nil) != SQLITE_OK {
            let errcode = sqlite3_errcode(conn)
            print("Create table failed due to error \(errcode)")
        }
    }
    
    func getDBConnection() -> OpaquePointer? {
        var conn : OpaquePointer?
        if sqlite3_open(dbName, &conn) == SQLITE_OK {
//        2. Create tables
            initalizeDB()
//            sqlite3_close(conn)
            return conn
        } else {
            let errcode = sqlite3_errcode(conn)
            print("Open database failed due to error \(errcode)")
        }
        return conn
    }
    
    static func getInstance() -> Database {
        if dbObj == nil {
            dbObj = Database()      // create Database if it DNE
        }
        return dbObj
    }
}
