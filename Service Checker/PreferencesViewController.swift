//
//  PreferencesViewController.swift
//  Service Checker
//
//  Created by Jese on 22/01/2019.
//  Copyright © 2019 jbenisoy. All rights reserved.
//
//bensi.buttonPressedAmount2 = IntegerLiteralType(+1)
//bensi.buttonPressedAmount3 = IntegerLiteralType(+1)
import Cocoa
import PlainPing
class PreferencesViewController: NSViewController {
    let bensi = pings()
    var normVC = ViewController()
    @IBOutlet var hostnameFirst: NSTextField!
    @IBOutlet var buttonNameFirst: NSTextField!
    @IBOutlet var hostnameSecond: NSTextField!
    @IBOutlet var hostnameThird: NSTextField!
    @IBOutlet var buttonNameThird: NSTextField!
    @IBOutlet var buttonNameSecond: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
}
    @IBAction func buttonPressFirst(_ sender: NSButton) {
        
        buttonPressedYes1 = true
        let hostnameLegit: String = hostnameFirst.stringValue
        hostnameUser1 = hostnameLegit
        let buttonNameLegit: String = buttonNameFirst.stringValue
        buttonName1 = buttonNameLegit
        
        
        //bensi.buttonPressedAmount1 += 1
        
    }
    
    
}

