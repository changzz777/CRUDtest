//
//  PlayerEditor.swift
//  CRUDtest
//
//  Created by User08 on 2020/11/9.
//

import SwiftUI

struct PlayerEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var editPlayerIndex: Int?
    @State private var name = ""
    @State private var height = 200
    @State private var Superstar = true
    var playerData : PlayerData
    var body: some View {
        Form {
            TextField("名字", text: $name)
            Stepper("身高 \(height) cm", value: $height, in: 160...250)
            Toggle("明星", isOn: $Superstar)
        }
        .onAppear(perform: {
            if let editPlayerIndex = editPlayerIndex {
                let editPlayer = playerData.players[editPlayerIndex]
                name = editPlayer.name
                height = editPlayer.height
                Superstar = editPlayer.Superstar
            }
        })
        .navigationBarTitle(editPlayerIndex == nil ? "Add new player" :"Edit player")
        .navigationBarItems(trailing: Button("Save") {
            let player = Player(name: name, height: height,Superstar: Superstar)
            
            if let editPlayerIndex = editPlayerIndex {
                playerData.players[editPlayerIndex] = player
            }else {
                playerData.players.insert(player, at: 0)
            }
            
            self.presentationMode.wrappedValue.dismiss()
        })
    }
}

struct PlayerEditor_Previews: PreviewProvider {
    static var previews: some View {
        PlayerEditor(playerData:PlayerData())
    }
}
