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
    @StateObject var sapViewModel = SAPViewModel()
    @State var showingLogs = false
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical){
                    HStack{
                        Button {
                            sapViewModel.accessPoints = []
                            print("Scanning")
                        } label: {
                            Label("Scan", systemImage: "magnifyingglass")
                                .labelStyle(.iconOnly)
                        }
                        .tint(.blue)
                        
                        Group{
                            Label("Refresh", systemImage: "arrow.counterclockwise")
                                .foregroundColor(.green)
                                .labelStyle(.iconOnly)
                                .padding(14)
                                .background(.green.opacity(0.20))
                                .cornerRadius(10)
                                .onTapGesture {
                                    Task{
                                        print("REFRESHING..")
                                        // Removing old data if (any)
                                        sapViewModel.accessPoints = []
                                        await sapViewModel.fetchScannedAPs()
                                    }
                                }
                                .onLongPressGesture(minimumDuration: 0.2) {
                                    print("SHOWING LOGS")
                                    showingLogs.toggle()
                                }
                        }
                    }
                    .task {
                        sapViewModel.accessPoints = []
                        await sapViewModel.fetchScannedAPs()
                    }
                    Divider()
                        .padding(.vertical)
                    
                    ForEach(sapViewModel.accessPoints, id: \.self){ ap in
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
                        .background(rssiToColor(rssi: ap.rssi).opacity(0.1))
                        .cornerRadius(5)
                        .padding(.bottom, 5)
                    }
                }
            }
        }
        .alert(sapViewModel.state.rawValue, isPresented: $showingLogs) {
            Button("OK", role: .cancel) { }
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
