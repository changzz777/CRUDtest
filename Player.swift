//
//  Player.swift
//  CRUDtest
//
//  Created by User08 on 2020/11/9.
//

import Foundation

struct Player : Identifiable,Codable{
    var id = UUID()
    var name : String
    var height : Int
    var Superstar : Bool
}
