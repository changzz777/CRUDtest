//
//  PlayerList.swift
//  CRUDtest
//
//  Created by User08 on 2020/11/9.
//

import SwiftUI

struct PlayerList: View {
    @StateObject var playerData = PlayerData()
    @State private var showEditPlayer = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(playerData.players.indices ,id: \.self) { (i) in
                    NavigationLink(destination: PlayerEditor(editPlayerIndex: i, playerData: playerData)){
                        PlayerRow(player : playerData.players[i])
                    }
                }
                .onDelete { (indexSet) in
                    playerData.players.remove(atOffsets: indexSet)
                }
            }
            
            .navigationBarTitle("球員列表")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                            showEditPlayer = true
                        },
                        label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                }
            })
            
            .sheet(isPresented:$showEditPlayer){
                NavigationView {
                    PlayerEditor(playerData:playerData)
                }
            }
        }
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList()
    }
}
