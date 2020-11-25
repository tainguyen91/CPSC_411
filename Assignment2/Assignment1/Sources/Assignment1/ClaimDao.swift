//
//  ClaimDao.swift
//  Assignment1
//
//  Created by Winnie Tran on 10/21/20.
//

import SQLite3
import Foundation

struct Claim: Codable{
    var id : UUID?
    var title :String
    var date :String
    var isSolved : Int?
   
    init(i:UUID?, t: String, d: String, s: Int?) {
        id = i
        title = t
        date = d
        isSolved = s
    }
    
    init( t:String, d: String) {
            title = t
            date = d
    }
}

class ClaimDao{
    func addClaim(cObj: Claim){
        let sqlStmt = String (format: "insert into claim (id , title, date, isSolved) values ('%@','%@','%@','%@')",  UUID().uuidString, cObj.title, cObj.date, "0")
        let conn = Database.getInstance().getDBConnection()
        
        if sqlite3_exec(conn, sqlStmt, nil, nil, nil) != SQLITE_OK{
            let errcode = sqlite3_errcode(conn)
            print ("Faild to insert a Claim record due to error \(errcode)")
        }
        sqlite3_close(conn)
    }
    
    func getAll() -> [Claim] {
        var cList = [Claim]()
        var resultSet : OpaquePointer?
        let sqlStr = "select id, title, date, isSolved from Claim"
        let conn = Database.getInstance().getDBConnection()
        if (sqlite3_prepare_v2(conn, sqlStr, -1, &resultSet, nil) == SQLITE_OK)
        {
            while (sqlite3_step(resultSet) == SQLITE_ROW){
                    let id_val = sqlite3_column_text(resultSet, 0)
                    let id = UUID(uuidString: String(cString: id_val!))
                    let title_val = sqlite3_column_text(resultSet, 1)
                    let title = String (cString: title_val!)
                    let date_val = sqlite3_column_text(resultSet, 2)
                    let date = String (cString: date_val!)
                    let isSolved_val = sqlite3_column_int(resultSet, 3)
                    let isSolved = Int(isSolved_val)
                    cList.append(Claim(i: id, t: title, d: date, s: isSolved))
                }
        }
        return cList
    }
}
