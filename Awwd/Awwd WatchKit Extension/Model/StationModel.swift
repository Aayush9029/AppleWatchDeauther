//
//  ScannedWifiModel.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-09.
//

import Foundation

struct StationModel {
    let ssid    : String
    let ch      : Int
    let name    : String  // too inconsistent to show name
    let vendor  : String
    let pkts    : Int
    let APindex : Int
    let seen    : String
}


let exampleStationModels = [
    StationModel(ssid: "b8:1d:aa:d5:6f:f0", ch: 8, name: "[[[[not mine]]]]", vendor: "don't!", pkts: 2, APindex: 4, seen: "<1sec"),
    StationModel(ssid: "58:41:4e:7a:dd:1b", ch: 8, name: "", vendor: "OK?!", pkts: 2, APindex: 3, seen: "<1min"),
    StationModel(ssid: "04:d7:aa:dc:6e:5a", ch: 6, name: "", vendor: "Just", pkts: 168, APindex: 2, seen: "<1sec")
]
