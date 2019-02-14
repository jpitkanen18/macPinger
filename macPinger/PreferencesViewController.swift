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
    @IBOutlet weak var labelWTF: NSTextField!
    @IBOutlet weak var visualBlurPref: NSVisualEffectView!
    @IBOutlet weak var repeatPing1: NSButton!
    @IBOutlet weak var repeatPing2: NSButton!
    @IBOutlet weak var repeatPing3: NSButton!
    @IBOutlet weak var repeatInterval: NSTextField!
    @IBOutlet weak var repeatLabel: NSTextField!
    let huutistaPref = NSColor(calibratedRed: 255, green: 119, blue: 104, alpha: 1.0)
    override func viewDidAppear() {
        self.view.window?.titleVisibility = NSWindow.TitleVisibility.hidden
        self.view.window?.titlebarAppearsTransparent = true
        self.view.window?.styleMask.insert(.fullSizeContentView)
        visualBlurPref.blendingMode = .behindWindow
        visualBlurPref.state = .active
        visualBlurPref.material = .dark
        visualBlurPref.wantsLayer = true
        self.view.window?.backgroundColor = .clear
        self.view.window?.isOpaque = false
        repeatLabel.stringValue = "Repeat interval(sec)"
        repeatInterval.placeholderString = "i.e 60 (1 minute)"
        NotificationCenter.default.addObserver(self, selector: #selector(reset1(_:)), name: .stop1, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reset2(_:)), name: .stop2, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reset3(_:)), name: .stop3, object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingButton1.title = "Set"
        self.settingButton2.title = "Set"
        self.settingButton3.title = "Set"
        self.resetButton.title = "Reset"
        self.addressLabel.stringValue = "Address"
        self.buttonNameLabel.stringValue = "Name"
        self.repeatPing3.title = "Repeat?"
        self.repeatPing3.toolTip = "Repeats specified address until the server is offline or the repeat is stopped from the main window"
        self.repeatPing2.title = "Repeat?"
        self.repeatPing2.toolTip = "Repeats specified address until the server is offline or the repeat is stopped from the main window"
        self.repeatPing1.title = "Repeat?"
        self.repeatPing1.toolTip = "Repeats specified address until the server is offline or the repeat is stopped from the main window"
        self.addressLabel.alignment = NSTextAlignment.center
        self.buttonNameLabel.alignment = NSTextAlignment.center
        self.labelWTF.isHidden = true
    }
    @IBAction func resetButtonPress(_ sender: Any) {
        buttonName1 = "Apple"
        buttonName2 = "GitHub"
        buttonName3 = "Google"
        buttonPressedYes1 = false
        buttonPressedYes2 = false
        buttonPressedYes3 = false
        self.repeatPing1.state = .off
        self.repeatPing2.state = .off
        self.repeatPing3.state = .off
        self.repeatInterval.stringValue = ""
        NotificationCenter.default.post(name: .resetButtonHasBeenPressed, object: nil)
    }
    @IBAction func buttonPressFirst(_ sender: NSButton) {
        buttonPressedYes1 = true
        if repeatPing1.state == .on {
            repeatTicker1 = true
            let hostnameLegit1: String = hostnameFirst.stringValue
            let buttonLegit1 = buttonNameFirst.stringValue
            if (hostnameFirst.stringValue == "" || buttonNameFirst.stringValue == "" || repeatInterval.stringValue == ""){
                labelWTF.stringValue = "You must set an IP address and a name!\nFor the repeater you need to set an interval!"
                repeatInterval.placeholderString = "Set an interval!"
                labelWTF.textColor = huutistaPref
                labelWTF.isHidden = false
            } else {
                repeatIntervalGlbl1 = repeatInterval.doubleValue
                hostnameUser1 = hostnameLegit1
                buttonName1 = buttonLegit1
                NotificationCenter.default.post(name: .buttonFirstHasBeenPressedRepeat, object: nil)
                labelWTF.isHidden = true
            }
        }
        else {
        let hostnameLegit: String = hostnameFirst.stringValue
        let buttonLegit = buttonNameFirst.stringValue
        if (hostnameFirst.stringValue == "" || buttonNameFirst.stringValue == ""){
            labelWTF.stringValue = "You must set an IP address and a name!"
            labelWTF.textColor = huutistaPref
            labelWTF.isHidden = false
        } else {
            hostnameUser1 = hostnameLegit
            buttonName1 = buttonLegit
            NotificationCenter.default.post(name: .buttonFirstHasBeenPressed, object: nil)
            labelWTF.isHidden = true
        }
        }

    }
    @IBAction func buttonPressSecond(_ sender: Any) {
        buttonPressedYes2 = true
        if repeatPing2.state == .on {
            repeatTicker2 = true
            let hostnameLegit2: String = hostnameSecond.stringValue
            let buttonLegit2 = buttonNameSecond.stringValue
            if (hostnameSecond.stringValue == "" || buttonNameSecond.stringValue == "" || repeatInterval.stringValue == ""){
                labelWTF.stringValue = "You must set an IP address and a name!\nFor the repeater you need to set an interval!"
                repeatInterval.placeholderString = "Set an interval!"
                labelWTF.textColor = huutistaPref
                labelWTF.isHidden = false
            } else {
                repeatIntervalGlbl2 = repeatInterval.doubleValue
                hostnameUser2 = hostnameLegit2
                buttonName2 = buttonLegit2
                NotificationCenter.default.post(name: .buttonSecondHasBeenPressedRepeat, object: nil)
                labelWTF.isHidden = true
            }
        }
        else {
        let hostnameLegit2: String = hostnameSecond.stringValue
        let buttonLegi2t = buttonNameSecond.stringValue
        if (hostnameSecond.stringValue == "" || buttonNameSecond.stringValue == ""){
            labelWTF.stringValue = "You must set an IP address and a name!"
            labelWTF.textColor = huutistaPref
            labelWTF.isHidden = false
        } else {
            hostnameUser2 = hostnameLegit2
            buttonName2 = buttonLegi2t
            NotificationCenter.default.post(name: .buttonSecondHasBeenPressed, object: nil)
            labelWTF.isHidden = true
        }
    }
    }
    @IBAction func buttonPressThird(_ sender: Any) {
        buttonPressedYes3 = true
        if repeatPing3.state == .on {
            repeatTicker3 = true
            let hostnameLegit3: String = hostnameThird.stringValue
            let buttonLegit3 = buttonNameThird.stringValue
            if (hostnameThird.stringValue == "" || buttonNameThird.stringValue == "" || repeatInterval.stringValue == ""){
                labelWTF.stringValue = "You must set an IP address and a name!\nFor the repeater you need to set an interval!"
                labelWTF.textColor = huutistaPref
                labelWTF.isHidden = false
            } else {
                repeatIntervalGlbl3 = repeatInterval.doubleValue
                hostnameUser3 = hostnameLegit3
                buttonName3 = buttonLegit3
                NotificationCenter.default.post(name: .buttonThirdHasBeenPressedRepeat, object: nil)
                labelWTF.isHidden = true
        }
        } else {
        let hostnameLegit3: String = hostnameThird.stringValue
        let buttonLegit3 = buttonNameThird.stringValue
        if (hostnameThird.stringValue == "" || buttonNameThird.stringValue == ""){
            labelWTF.stringValue = "You must set an IP address and a name!"
            labelWTF.textColor = huutistaPref
            labelWTF.isHidden = false
        } else {
            hostnameUser3 = hostnameLegit3
            buttonName3 = buttonLegit3
            NotificationCenter.default.post(name: .buttonThirdHasBeenPressed, object: nil)
            labelWTF.isHidden = true
        }
    }
    }
    @objc func reset1(_ notification:Notification){
        self.repeatPing1.state = .off
        self.repeatInterval.stringValue = ""
    }
    @objc func reset2(_ notification:Notification){
        self.repeatPing2.state = .off
        self.repeatInterval.stringValue = ""
    }
    @objc func reset3(_ notification:Notification){
        self.repeatPing3.state = .off
        self.repeatInterval.stringValue = ""
    }
}

