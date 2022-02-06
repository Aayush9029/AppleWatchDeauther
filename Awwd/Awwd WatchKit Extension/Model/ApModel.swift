//
//  ApModel.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-09.
//

import Foundation

struct ApModel: Hashable {
    let ssid: String
    let name: String  // too inconsistent to show name
    let ch: Int
    let rssi: Int
    let enc: String
    let bssid: String
    let vendor: String  // to inconsistent to show vendor
}

let exampleApModel = [
    ApModel(ssid: "BELL 207", name: "--SpaceRouter!--", ch: 6, rssi: -54, enc: "WPA2", bssid: "f4:6b:de:da:8d:95", vendor: "Spacehuhn"),
    ApModel(ssid: "Felson", name: "--SpaceRouter!--", ch: 8, rssi: -80, enc: "WPA2", bssid: "cc:cf:1e:d5:5b:2b", vendor: "SpaceLtd"),
    ApModel(ssid: "Imagine using WPA", name: "as", ch: 29, rssi: -57, enc: "WPA*", bssid: "69:41:4e:7a:dd:1b", vendor: "CHEAPROUTER"),

    ApModel(ssid: "A Wifi With Long Name Wooo 123 So LONG", name: "", ch: 29, rssi: -57, enc: "", bssid: "69:41:4e:7a:dd:1b", vendor: "Spacehuhn"),
    ApModel(ssid: "Rougue Pi", name: "", ch: 29, rssi: -57, enc: "", bssid: "69:41:4e:7a:dd:1b", vendor: "Spacehuhn")
]
