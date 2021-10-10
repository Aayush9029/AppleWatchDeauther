//
//  AccessPointsView.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-09.
//

import SwiftUI

//let ssid  : String
//let name  : String  // too inconsistent to show name
//let ch    : Int
//let rssi  : Int
//let enc   : String
//let bssid : String
//let vendor: String  // to inconsistent to show vendor

struct AccessPointsView: View {
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical){
                    ForEach(exampleApModel, id: \.self){ ap in
                        NavigationLink {
                            ApDetailView(ap: ap)
                        } label: {
                            HStack{
                                VStack(alignment: .leading){
                                    Text(ap.ssid)
                                        .font(.caption2)
                                        .bold()
                                        .lineLimit(1)
                                    Text(ap.bssid)
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                encryptionToImage(enc: ap.enc)
                                    .font(.caption2)
                            }
                        }
                        .background(rssiToColor(rssi: ap.rssi).opacity(0.25))
                        .cornerRadius(5)
                        .padding(.bottom, 5)
                        
                        
                        
                    }
                }
            }
        }
    }
}


extension AccessPointsView{
    func encryptionToImage(enc: String) -> Image{
        switch enc{
        case "WPA2":
            
            return Image(systemName: "lock.fill")
        case "WPA*":
            return Image(systemName: "key.fill")
        case "":
            return Image(systemName: "lock.open.fill")
        default:
            return Image(systemName: "questionmark")
        }
    }
    func rssiToColor(rssi: Int) -> Color{
        if (rssi > -55){
            return .green
        }else if (rssi > -60){
            return .blue
        }else if (rssi > -70){
            return .purple
        }else if (rssi > -80){
            return .orange
        }else if (rssi > -90){
            return .red
        }
        return .white
    }
}

struct AccessPointsView_Previews: PreviewProvider {
    static var previews: some View {
        AccessPointsView()
    }
}
