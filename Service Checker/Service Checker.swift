//
//  File.swift
//  Service Checker
//
//  Created by Jese on 22/01/2019.
//  Copyright © 2019 jbenisoy. All rights reserved.
//

import Foundation
import Cocoa
import PlainPing
var buttonPressedYes1 = false
var buttonPressedYes2 = false
var buttonPressedYes3 = false
var hostnameUser1: String = "www.ylilauta.org"
var buttonName1 = "Benis"
var buttonEntity = entity()
let prefVC = PreferencesViewController()
class pings {
    public static let shared = pings()

    var hostname1 = "www.google.com"
    var hostname2 = "www.github.com"
    var hostname3 = "www.apple.com"
    //lazy var hostnameUser1 = pre
    lazy var hostnameUser2 = String(prefVC.hostnameSecond.stringValue)
    lazy var hostnameUser3 = String(prefVC.hostnameThird.stringValue)
    var buttonName1 = "Google"
    var buttonName2 = "GitHub"
    var buttonName3 = "Benis"
    lazy var buttonNameUser1 = String(prefVC.buttonNameFirst.stringValue)
    lazy var buttonNameUser2 = String(prefVC.buttonNameSecond.stringValue)
    lazy var buttonNameUser3 = String(prefVC.buttonNameThird.stringValue)

    
    
    
    
    

    
}
