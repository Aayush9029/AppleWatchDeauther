//
//  ScanView.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-09.
//

import SwiftUI

struct ScanView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                NavigationLink {
                    AttackView()
                } label: {
                    Label("Attack", systemImage: "iphone.homebutton.radiowaves.left.and.right")
                }
                .tint(.red)
                
                NavigationLink {
                    AttackView()
                } label: {
                    Label("Scan APs", systemImage: "externaldrive.connected.to.line.below")
                }
                .tint(.green)

                Spacer()
                NavigationLink {
                    AccessPointsView()
                } label: {
                    Label("Scaned APs", systemImage: "list.star")
                }
                .tint(.blue)
                
                
            }
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
