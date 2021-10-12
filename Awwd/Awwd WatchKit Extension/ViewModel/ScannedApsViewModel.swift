//
//  ScannedApsViewModel.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-11.
//

//import Foundation
import SwiftUI

class SAPViewModel: ObservableObject {
    @Published var accessPoints = [ApModel]()
    @Published var state: APFetcherProgress = .none
    
    
    
    func fetchRawJsonData(from url: URL) async throws -> Data {
        let session = URLSession.shared
        let (data, _) = try await session.data(from: url)
        return data
    }
    
    func jsonToAPModels(from data: Data){
        
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // try to read out a string array
                if let aps = json["aps"] as? [NSArray] {
                    print("===APS===")
                    for ap in aps {
                        
                            let ssid = ap[0] 
                            let name = ap[1]
                            let ch = ap[2]
                            let rssi = ap[3]
                            let enc = ap[4]
                            let bssid = ap[5]
                            let vendor = ap[6]
//                            let selected = ap[7]
                        DispatchQueue.main.sync {
                            accessPoints.append(
                                ApModel(ssid: ssid as! String,
                                        name: name as! String,
                                        ch: ch as! Int,
                                        rssi: rssi as! Int,
                                        enc: enc as! String,
                                        bssid: bssid as! String,
                                        vendor: vendor as! String
                                       )
                            )
                        }
                        
                    }
                    print(aps)
                    DispatchQueue.main.sync {
                        state = .createdModel
                    }
                }

                //                MARK: Will implement later in v2 maybe
//                if let stations = json["stations"] as? [Any] {
//                    print("===STATIONS===")
//                    print(stations)
//                }
            
            
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
    
    func fetchScannedAPs() async{
        // Removed previously fetched data (if any)
        
        guard let url = URL(string: "http://127.0.0.1:8000/scan.json") else {
            print("INVALID URL")
            DispatchQueue.main.sync {
                state = .invalidURL
            }
            return
        }
        guard let data = try? await fetchRawJsonData(from: url) else{
        
            DispatchQueue.main.sync {
                state = .missingData
            }
            return
        }
        jsonToAPModels(from: data)

    }
    
    
}


// MARK: - The Json file is not "organized" (kinda bad) workable nonetheless ig
extension SAPViewModel{
    enum APFetcherProgress: String {
        case none = "Nothing?"
        case gotData = "We Got the Data"
        case gotJson = "We Got the Json"
        case createdModel = "We created [ApModel]\nEverything seem to work fine"
        case invalidURL = "URL is invalid u sure it's 192.168.4.1?"
        case missingData = "Data is missing\n U connected to pwned?"
    }
}
