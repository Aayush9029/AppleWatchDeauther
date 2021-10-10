//
//  ApDetailView.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-09.
//

import SwiftUI

//let ssid  : String
//let name  : String  // too inconsistent to show name
//let ch    : Int
//let rssi  : Int    //
//let enc   : String  //
//let bssid : String
//let vendor: String  // to inconsistent to show vendor

struct ApDetailView: View {
    let ap: ApModel
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    Text(ap.ssid)
                        .bold()
                        .lineLimit(1)
                    Text(ap.bssid)
                        .font(.caption2)
                        .foregroundColor(.gray)
                    Divider()
                    Text("Encryption: \(Text(ap.enc).italic())")
                    Divider()
                    Text("Channel: \(ap.ch)")
                    Divider()
                    Text("RSSI: \(ap.rssi)")
                    Button {
                        //
                    } label: {
                        Label("Add", systemImage: "plus.circle")
                    }
                    .tint(.green)
                    
                }
            }
        }
    }
}

struct ApDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ApDetailView(ap: exampleApModel.first!)
    }
}
