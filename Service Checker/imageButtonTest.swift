//
//  imageButtonTest.swift
//  macPinger
//
//  Created by Jese on 29/01/2019.
//  Copyright © 2019 jbenisoy. All rights reserved.
//

import Cocoa

class imageButtonTest: NSViewController {
    @IBOutlet weak var buttonImage: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonImage.setButtonType(NSButton.ButtonType.momentaryChange)
        // Do view setup here.
    }
    override func viewDidAppear() {
        buttonImage.image = NSImage(named: "GitHub-Mark-Light-120px-plus")
        buttonImage.alternateImage = NSImage(named: "GitHub-Mark-120px-plus")
    }
    @IBAction func buttonMeme(_ sender: NSButton) {
        //buttonImage.image = NSImage(named: "GitHub-Mark-120px-plus")
    }
    
}
