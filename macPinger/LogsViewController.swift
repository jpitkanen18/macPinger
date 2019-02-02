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
    let notificationCenter = NotificationCenter.default
    @objc func errorLogGoogleOG(_ notification:Notification) {
        logsViewString.string = logsViewString.string + "\n" + logsGoogle
    }
    @objc func errorLogApple(_ notification:Notification) {
        logsViewString.string = logsViewString.string + "\n" + logsApple
    }
    @objc func errorLogGithub(_ notification:Notification) {
        logsViewString.string = logsViewString.string + "\n" + logsGithub
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear() {
        super.viewDidAppear()
        logsViewString.string = logsViewString.string + "\n" + logsGoogle + "\n" + logsGithub + "\n" + logsApple
        notificationCenter.addObserver(self, selector: #selector(errorLogGoogleOG(_:)), name: .errorLogNotificationGoogle, object: nil)
        notificationCenter.addObserver(self, selector: #selector(errorLogGithub(_:)), name: .errorLogNotificationGithub, object: nil)
        notificationCenter.addObserver(self, selector: #selector(errorLogApple(_:)), name: .errorLogNotificationApple, object: nil)
    }
    
}
extension Notification.Name{
    static let errorLogNotificationApple = Notification.Name("benis")
    static let errorLogNotificationGoogle = Notification.Name("benis1")
    static let errorLogNotificationGithub = Notification.Name("benis2")
}
