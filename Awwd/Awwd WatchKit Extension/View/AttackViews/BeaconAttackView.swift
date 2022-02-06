//
//  BeaconAttackView.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-10.
//

import SwiftUI

struct BeaconAttackView: View {
    @EnvironmentObject var attackViewModel: AttackViewModel
    var body: some View {
        NavigationView {

            VStack {
                Toggle(isOn: $attackViewModel.randomEnabled) {
                    Text("Random")
                }
                .tint(.red)
                .padding()
                .onChange(of: attackViewModel.randomEnabled) { _ in
                    Task {
                        await attackViewModel.toggleRandom()
                    }
                }

                if !attackViewModel.randomEnabled {
                    Picker("AP count: \(Int(attackViewModel.beaconCount))", selection: $attackViewModel.beaconCount) {
                        ForEach(0 ..< 61) { i in
                            Text("\(i)")
                        }
                    }
                }
                Spacer()

                Divider()

                ScrollView {
                    if !attackViewModel.randomEnabled {
                        TextField("SSID", text: $attackViewModel.cloneBeaconName)
                    }

                    Button {
                        Task {
                            await attackViewModel.startStopBeaconAttack()
                        }
                    } label: {
                        if !attackViewModel.beaconEnabled {
                            Label("Start Attack", systemImage: "wifi")
                        } else {
                            Label("Stop Attack", systemImage: "wifi.slash")
                        }
                    }
                    .tint(.red)
                    .disabled(!attackViewModel.randomEnabled && attackViewModel.cloneBeaconName.count < 1 && !attackViewModel.beaconEnabled)

                }

            }
        }
    }
}

struct BeaconAttackView_Previews: PreviewProvider {
    static var previews: some View {
        BeaconAttackView()
            .environmentObject(AttackViewModel())
    }
}
