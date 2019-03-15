//
//  LogsViewController.swift
//  macPinger
//
//  Created by Jese on 02/02/2019.
//  Copyright © 2019 jbenisoy. All rights reserved.
//

import Cocoa

class LogsViewController: NSViewController {
    
    @IBOutlet var logsViewString: NSTextView!
    @IBOutlet weak var logsView: NSScrollView!
    @IBOutlet weak var logLabel: NSTextField!
    @IBOutlet weak var logBlur: NSVisualEffectView!
    let notificationCenter = NotificationCenter.default
    @objc func errorLog(_ notification:Notification) {
        logsAll = logsAll + "\n" + logsVar
        logsViewString.string = logsViewString.string + "\n" + logsVar
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(self, selector: #selector(errorLog(_:)), name: .errorLogNotificationGoogle, object: nil)
        notificationCenter.addObserver(self, selector: #selector(errorLog(_:)), name: .errorLogNotificationGithub, object: nil)
        notificationCenter.addObserver(self, selector: #selector(errorLog(_:)), name: .errorLogNotificationApple, object: nil)
        
    }
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.titleVisibility = NSWindow.TitleVisibility.hidden
        self.view.window?.titlebarAppearsTransparent = true
        self.view.window?.styleMask.insert(.fullSizeContentView)
        self.view.window?.backgroundColor = .clear
        self.view.window?.isOpaque = false
        logBlur.blendingMode = .behindWindow
        logBlur.state = .active
        logBlur.material = .dark
        logBlur.wantsLayer = true
        logsViewString.string = logsAll
        muikeaTicker = true
        self.logLabel.stringValue = "This is the log window for\nerror troubleshooting"
    }
    override func viewDidDisappear() {
        muikeaTicker = false
    }
}
extension Notification.Name{
    static let errorLogNotificationApple = Notification.Name("benis")
    static let errorLogNotificationGoogle = Notification.Name("benis1")
    static let errorLogNotificationGithub = Notification.Name("benis2")
}
