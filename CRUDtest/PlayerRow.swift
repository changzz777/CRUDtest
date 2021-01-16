//
//  PlayerRow.swift
//  CRUDtest
//
//  Created by User08 on 2020/11/9.
//

import SwiftUI

struct PlayerRow: View {
    var player: Player
    var body: some View {
        HStack {
            Text(player.name)
            Spacer()
            Text("\(player.height) cm")
            Image(systemName: player.Superstar ? "star.fill" : "star")
        }
    }
}

struct LoverRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(player: Player(name: "Lebron James", height: 203, Superstar: true))
            .previewLayout(.sizeThatFits)
    }
}
