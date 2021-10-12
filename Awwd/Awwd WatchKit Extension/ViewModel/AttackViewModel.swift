//
//  AttackViewModel.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-11.
//

import SwiftUI

class AttackViewModel: ObservableObject{
    @Published var state: String = "NaN"
    @Published var beaconEnabled: Bool = false
    @Published var cloneBeaconName: String = ""
    @Published var beaconCount: Int = 1
    @Published var randomEnabled: Bool = false
    
    
    
//      Custom SSID
//      /run?cmd=add%20ssid%20%22asdasd%22%20-f%20-cl%208

    func addSSID() async{
        let url = "\(Constants.commandUrl)=add%20ssid%20%22\(cloneBeaconName)%22%20-f%20-cl%20\(beaconCount)"
        await sendRequest(for: url)
    }
    
    func changeBeaconCount() async{
//        let url = "\(Constants.commandUrl)=add%"

    }
    
    func toggleRandom() async{
        let url = "\(Constants.commandUrl)=\(randomEnabled ? "enable" : "disable")%20random%20\(beaconCount)"
        await sendRequest(for: url)
    }
    
    // Start Stop Beacon attack
    func startStopBeaconAttack() async{
        await beaconEnabled ? stopBeaconAttack() : startBeaconAttack()
        DispatchQueue.main.sync {
            beaconEnabled.toggle()
        }
        
    }
    
    
    func startBeaconAttack() async {
        let url = "\(Constants.commandUrl)=attack%20-b"

        if !randomEnabled{
            await addSSID()
            await sendRequest(for: url)
        }
        else{
            await sendRequest(for: url)
        }
    }
    
    func stopBeaconAttack() async{
        
        let url = "\(Constants.commandUrl)=attack"
        await clearSSIDS()
        await sendRequest(for: url)
    }
    
    
    func clearSSIDS() async{
        let url = "\(Constants.commandUrl)=remove%20ssids"
        await sendRequest(for: url)
    }
    
    
    func sendRequest(for url: String) async{
        guard let requestURL = URL(string: url) else {return}
        print(requestURL)
        do {
            let session = URLSession.shared
            let (data, _) = try await session.data(from: requestURL)
            print(data.description)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    //
    
}
