//
//  PreferencesViewController.swift
//  Service Checker
//
//  Created by Jese on 22/01/2019.
//  Copyright © 2019 jbenisoy. All rights reserved.
//
import Cocoa
import PlainPing

class PreferencesViewController: NSViewController {
    @IBOutlet weak var settingButton1: NSButton!
    @IBOutlet weak var settingButton2: NSButton!
    @IBOutlet weak var settingButton3: NSButton!
    @IBOutlet weak var resetButton: NSButton!
    @IBOutlet var hostnameFirst: NSTextField!
    @IBOutlet var buttonNameFirst: NSTextField!
    @IBOutlet var hostnameSecond: NSTextField!
    @IBOutlet var hostnameThird: NSTextField!
    @IBOutlet var buttonNameThird: NSTextField!
    @IBOutlet var buttonNameSecond: NSTextField!
    @IBOutlet weak var addressLabel: NSTextField!
    @IBOutlet weak var buttonNameLabel: NSTextField!
    override func viewDidAppear() {
        self.view.window?.title = "Preferences"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.window?.title = "Preferences"
        self.settingButton1.title = "Set"
        self.settingButton2.title = "Set"
        self.settingButton3.title = "Set"
        self.resetButton.title = "Reset"
        self.addressLabel.stringValue = "Address"
        self.buttonNameLabel.stringValue = "Name"
        self.addressLabel.alignment = NSTextAlignment.center
        self.buttonNameLabel.alignment = NSTextAlignment.center
}
    @IBAction func resetButtonPress(_ sender: Any) {
        buttonName1 = "Apple"
        buttonName2 = "GitHub"
        buttonName3 = "Google"
        buttonPressedYes1 = false
        buttonPressedYes2 = false
        buttonPressedYes3 = false
        NotificationCenter.default.post(name: .resetButtonHasBeenPressed, object: nil)
    }
    @IBAction func buttonPressFirst(_ sender: NSButton) {
        
        buttonPressedYes1 = true
        let hostnameLegit: String = hostnameFirst.stringValue
        hostnameUser1 = hostnameLegit
        let buttonLegit = buttonNameFirst.stringValue
        buttonName1 = buttonLegit
        NotificationCenter.default.post(name: .buttonFirstHasBeenPressed, object: nil)
    }
    @IBAction func buttonPressSecond(_ sender: Any) {
        
        buttonPressedYes2 = true
        let hostnameLegit2: String = hostnameSecond.stringValue
        hostnameUser2 = hostnameLegit2
        let buttonLegit2 = buttonNameSecond.stringValue
        buttonName2 = buttonLegit2
        NotificationCenter.default.post(name: .buttonSecondHasBeenPressed, object: nil)
    }
    @IBAction func buttonPressThird(_ sender: Any) {
        
        buttonPressedYes3 = true
        let hostnameLegit3: String = hostnameThird.stringValue
        hostnameUser3 = hostnameLegit3
        let buttonLegit3 = buttonNameThird.stringValue
        buttonName3 = buttonLegit3
        NotificationCenter.default.post(name: .buttonThirdHasBeenPressed, object: nil)
    }
    
    
    
}

