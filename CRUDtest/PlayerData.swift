//
//  PlayerData.swift
//  CRUDtest
//
//  Created by User08 on 2020/11/9.
//


import Foundation
import SwiftUI

class PlayerData: ObservableObject {
    @AppStorage("players") var playerData: Data?
    
    @Published var players = [Player](){
        didSet {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(players)
                playerData = data
            } catch {
                
            }
        }
    }
    
    init() {
        if let playerData = playerData {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Player].self,from: playerData) {
                players = decodedData
            }
        }
    }
}
