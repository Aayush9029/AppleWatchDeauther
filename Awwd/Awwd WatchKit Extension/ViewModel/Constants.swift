//
//  Constants.swift
//  Awwd WatchKit Extension
//
//  Created by Aayush Pokharel on 2021-10-11.
//

import Foundation

class Constants {
    // Default ip for pwned

//    Default =
//    Test = 127.0.0.1
    static let pwned_ip = "http://192.168.4.1"

    // Scan.json path
    static let scanJsonUrl = pwned_ip + "/scan.json"

    // Scan.json path
    static let ssidJsonUrl = pwned_ip + "/ssids.json"

    // Scan.json path
    static let nameJsonUrl = pwned_ip + "/names.json"

    // Scan.json path
    static let attackJsonUrl = pwned_ip + "/attack.json"

    // Run Command path
    static let commandUrl = pwned_ip + "/run?cmd"

}
