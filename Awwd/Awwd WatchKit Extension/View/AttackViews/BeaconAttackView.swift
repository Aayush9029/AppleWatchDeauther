//
//  BeaconAttackView.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-10.
//

import SwiftUI

struct BeaconAttackView: View {
    @State var targetCount = 1;
    var body: some View {
        NavigationView{
            VStack{
                Picker("AP count: \(Int(targetCount))", selection: $targetCount) {
                    ForEach(0 ..< 61) { i in
                        Text("\(i)")
                    }
                }
                
                Button {
                    //
                    print(targetCount)
                } label: {
                    Label("Start Attack", systemImage: "wifi.slash")
                }
                .tint(.red)
                
            }
            
        }
    }
}

struct BeaconAttackView_Previews: PreviewProvider {
    static var previews: some View {
        BeaconAttackView()
    }
}
