//
//  HelpViewController.swift
//  Service Checker
//
//  Created by Jese on 29/01/2019.
//  Copyright © 2019 jbenisoy. All rights reserved.
//

import Cocoa
var emailContentVar = "placeholder"
var emailAddressVar = "placeholder"
var emailNameVar = "placeholder"
var emailSubjctVar = "placeholder"
import mailgun
class HelpViewController: NSViewController {
    @IBOutlet weak var githubLabe: NSTextField!
    @IBOutlet weak var githubButtonTitle: NSButton!
    @IBOutlet weak var emailLabel: NSTextField!
    @IBOutlet weak var emailAddress: NSTextField!
    @IBOutlet weak var emailContents: NSTextField!
    @IBOutlet weak var emailButtonTitle: NSButton!
    @IBOutlet weak var emailName: NSTextField!
    @IBOutlet weak var emailSubjct: NSTextField!
    @IBOutlet weak var sentLabel: NSTextField!
    let bensi = NSColor(deviceRed: 0, green: 240, blue: 0, alpha: 0.8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        githubLabe.stringValue = "GitHub Project"
        emailLabel.stringValue = "Email me!"
        emailLabel.alignment = NSTextAlignment.center
        githubLabe.alignment = NSTextAlignment.center
        githubButtonTitle.title = "To GitHub"
        emailButtonTitle.title = "Send"
        sentLabel.isHidden = true
        
        // Do view setup here.
    }
    override func viewDidAppear() {
        super .viewDidAppear()
        self.view.window?.title = "Help"
        
    }
    @IBAction func githubButton(_ sender: Any) {
        if let url = URL(string: "https://github.com/jpitkanen18/Service-Checker"),
            NSWorkspace.shared.open(url) {
            print("default browser was successfully opened")
            
        }
    }
    @IBAction func emailButton(_ sender: Any) {
        let emailCont = emailContents.stringValue
        emailContentVar = emailCont
        let emailOrigin = emailAddress.stringValue
        emailAddressVar = emailOrigin
        let emailname = emailName.stringValue
        emailNameVar = emailname
        let emailsubjct = emailSubjct.stringValue
        emailSubjctVar = emailsubjct
        SendEmail.send()
        emailContents.stringValue = ""
        emailAddress.stringValue = ""
        emailName.stringValue = ""
        emailSubjct.stringValue = ""
        sentLabel.stringValue = "Sent!"
        sentLabel.textColor = bensi
        sentLabel.isHidden = false

        
    }
    
}
class SendEmail: NSObject {
    static func send() {
        let mailgun = Mailgun.client(withDomain: "sandbox67f5f044ed5d40db869cc074e8a584d3.mailgun.org", apiKey: "")
        mailgun?.sendMessage(to: "Helper <macpingerhelp@gmail.com>", from: "\(emailNameVar) <\(emailAddressVar)>" , subject: emailSubjctVar, body: emailContentVar)
    }
}

