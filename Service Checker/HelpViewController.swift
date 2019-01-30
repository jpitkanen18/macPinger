//
//  HelpViewController.swift
//  Service Checker
//
//  Created by Jese on 29/01/2019.
//  Copyright © 2019 jbenisoy. All rights reserved.
//

import Cocoa

class HelpViewController: NSViewController {
    @IBOutlet weak var githubLabe: NSTextField!
    @IBOutlet weak var githubButtonTitle: NSButton!
    @IBOutlet weak var emailLabel: NSTextField!
    @IBOutlet weak var emailAddress: NSTextField!
    @IBOutlet weak var emailContents: NSTextField!
    @IBOutlet weak var emailButtonTitle: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        githubLabe.stringValue = "GitHub Project"
        emailLabel.stringValue = "Email me!"
        emailLabel.alignment = NSTextAlignment.center
        githubLabe.alignment = NSTextAlignment.center
        githubButtonTitle.title = "To GitHub"
        emailButtonTitle.title = "Send"
        
        // Do view setup here.
    }
    override func viewDidAppear() {
        super .viewDidAppear()
        
    }
    @IBAction func githubButton(_ sender: Any) {
        if let url = URL(string: "https://github.com/jpitkanen18/Service-Checker"),
            NSWorkspace.shared.open(url) {
            print("default browser was successfully opened")
            
        }
    }
    @IBAction func emailButton(_ sender: Any) {
        
    }
    
}
