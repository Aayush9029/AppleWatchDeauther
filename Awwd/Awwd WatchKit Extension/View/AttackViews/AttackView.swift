//
//  AttackView.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-09.
//

import SwiftUI

struct AttackView: View {
    @StateObject var attackViewModel = AttackViewModel()

    var body: some View {
        NavigationView {
            VStack {

                NavigationLink {
                    BeaconAttackView()
                        .environmentObject(attackViewModel)
                } label: {
                    Label("Beacon", systemImage: "square.grid.3x3.middle.filled")
                }.tint(.red)

                NavigationLink {
                    BeaconAttackView()
                } label: {
                    Label("Deauth Frame", systemImage: "wifi.slash")
                }.tint(.orange)

                NavigationLink {
                    BeaconAttackView()
                } label: {
                    Label("Probe", systemImage: "speaker.wave.2")
                }.tint(.blue)

                Spacer()

            }
        }
    }
}

struct AttackView_Previews: PreviewProvider {
    static var previews: some View {
        AttackView()
    }
}
