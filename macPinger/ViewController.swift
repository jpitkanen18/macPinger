//
//  ViewController.swift
//  Service Checker
//
//  Created by Jese on 21/01/2019.
//  Copyright © 2019 jbenisoy. All rights reserved.
//
import Cocoa
import PlainPing
import UserNotifications
class ViewController: NSViewController, NSUserNotificationCenterDelegate, UNUserNotificationCenterDelegate {

    //Memes here
    
    @IBOutlet weak var indicatorGoogle: NSTextField!
    @IBOutlet weak var indicatorUnknown: NSImageView!
    @IBOutlet weak var indicatorOffline: NSImageView!
    @IBOutlet weak var indicatorOnline: NSImageView!
    @IBOutlet weak var indicatorGH: NSTextField!
    @IBOutlet weak var indicatorOnlineGH: NSImageView!
    @IBOutlet weak var indicatorOfflineGH: NSImageView!
    @IBOutlet weak var indicatorUnknownGH: NSImageView!
    @IBOutlet weak var indicatorApple: NSTextField!
    @IBOutlet weak var indicatorOnlineApple: NSImageView!
    @IBOutlet weak var indicatorOfflineApple: NSImageView!
    @IBOutlet weak var indicatorUnknownApple: NSImageView!
    @IBOutlet weak var pingResultLabel: NSTextField!
    @IBOutlet weak var pingResultLabelGH: NSTextField!
    @IBOutlet weak var labelApp: NSTextField!
    @IBOutlet weak var labelJese: NSTextFieldCell!
    @IBOutlet weak var pingResultLabelApple: NSTextField!
    @IBOutlet weak var labelGooglePing: NSTextField!
    @IBOutlet weak var labelGithubPing: NSTextField!
    @IBOutlet weak var labelApplePing: NSTextField!
    @IBOutlet weak var tesbuttonTitle: NSTextField!
    @IBOutlet weak var googleTitle: NSTextField!
    @IBOutlet weak var buttonGHOutlet: NSTextField!
    @IBOutlet weak var buttonAppleOutlet: NSTextField!
    @IBOutlet weak var visualBlur: NSVisualEffectView!
    @IBOutlet weak var lastPingGoogle: NSTextField!
    @IBOutlet weak var lastPingGH: NSTextField!
    @IBOutlet weak var lastPingApple: NSTextField!
    @IBOutlet weak var stopButtonOutlet: NSButton!
    @IBOutlet weak var stopLabel: NSTextField!
    
    var huutista = NSColor(deviceRed: 266, green: 0, blue: 0, alpha: 1.0)
    var onnistu = NSColor(deviceRed: 0, green: 266, blue: 0, alpha: 1.0)
    let notificationCenter = NotificationCenter.default
    let currentDateTime = Date()
    let formatterDate = DateFormatter()
    var repeatTimer1: Timer!
    var repeatTimer2: Timer!
    var repeatTimer3: Timer!
    var errorTicker1 = 0
    var errorTicker2 = 0
    var errorTicker3 = 0
    let applePingIdentifier = UUID().uuidString
    let githubPingIdentifier = UUID().uuidString
    let googlePingIdentifier = UUID().uuidString
    let notifCenterU = UNUserNotificationCenter.current()

    @objc func settingFirst(_ notification:Notification) {
        self.buttonAppleOutlet.stringValue = buttonName1
        self.labelApplePing.stringValue = hostnameUser1
        self.labelApplePing.toolTip = hostnameUser1
    }
    @objc func settingSecond(_ notification:Notification) {
        self.buttonGHOutlet.stringValue = buttonName2
        self.labelGithubPing.stringValue = hostnameUser2
        self.labelGithubPing.toolTip = hostnameUser2
    }
    @objc func settingThird(_ notification:Notification) {
        self.googleTitle.stringValue = buttonName3
        self.labelGooglePing.stringValue = hostnameUser3
        self.labelGooglePing.toolTip = hostnameUser3
    }
    @objc func repeatPingsFirst(_ notification:Notification){
        self.buttonAppleOutlet.stringValue = buttonName1
        self.labelApplePing.stringValue = hostnameUser1
        self.labelApplePing.toolTip = hostnameUser1
        self.stopLabel.isHidden = false
        self.repeatTimer1 = Timer.scheduledTimer(timeInterval: repeatIntervalGlbl1, target: self, selector: #selector(applePressNonIB), userInfo: nil, repeats: true)
    }
    @objc func repeatPingsSecond(_ notification:Notification){
        self.buttonGHOutlet.stringValue = buttonName2
        self.labelGithubPing.stringValue = hostnameUser2
        self.labelGithubPing.toolTip = hostnameUser2
        self.stopLabel.isHidden = false
        self.repeatTimer2 = Timer.scheduledTimer(timeInterval: repeatIntervalGlbl2, target: self, selector: #selector(githubPressNonIB), userInfo: nil, repeats: true)
    }
    @objc func repeatPingsThird(_ notification:Notification){
        self.googleTitle.stringValue = buttonName3
        self.labelGooglePing.stringValue = hostnameUser3
        self.labelGooglePing.toolTip = hostnameUser3
        self.stopButtonOutlet.isHidden = false
        self.stopLabel.isHidden = false
        self.repeatTimer3 = Timer.scheduledTimer(timeInterval: repeatIntervalGlbl3, target: self, selector: #selector(googlePressNonIB), userInfo: nil, repeats: true)
    }
    @objc func resetSettings(_ notification:Notification){
        self.buttonAppleOutlet.stringValue = buttonName1
        self.buttonGHOutlet.stringValue = buttonName2
        self.googleTitle.stringValue = buttonName3
        self.labelApplePing.stringValue = hostname1
        self.labelGithubPing.stringValue = hostname2
        self.labelGooglePing.stringValue = hostname3
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.buttonAppleOutlet.stringValue = buttonName1
        notificationCenter.addObserver(self, selector: #selector(settingFirst(_:)), name: .buttonFirstHasBeenPressed, object: nil)
        notificationCenter.addObserver(self, selector: #selector(resetSettings(_:)), name: .resetButtonHasBeenPressed, object: nil)
        notificationCenter.addObserver(self, selector: #selector(settingSecond(_:)), name: .buttonSecondHasBeenPressed, object: nil)
        notificationCenter.addObserver(self, selector: #selector(settingThird(_:)), name: .buttonThirdHasBeenPressed, object: nil)
        notificationCenter.addObserver(self, selector: #selector(repeatPingsFirst(_:)), name: .buttonFirstHasBeenPressedRepeat, object: nil)
        notificationCenter.addObserver(self, selector: #selector(repeatPingsSecond(_:)), name: .buttonSecondHasBeenPressedRepeat, object: nil)
        notificationCenter.addObserver(self, selector: #selector(repeatPingsThird(_:)), name: .buttonThirdHasBeenPressedRepeat, object: nil)
        self.view.window?.titleVisibility = NSWindow.TitleVisibility.hidden
        self.view.window?.titlebarAppearsTransparent = true
        self.view.window?.styleMask.insert(.fullSizeContentView)
        visualBlur.blendingMode = .behindWindow
        visualBlur.state = .active
        visualBlur.material = .dark
        visualBlur.wantsLayer = true
        self.view.window?.backgroundColor = .clear
        self.view.window?.isOpaque = false
        self.labelGooglePing.toolTip = hostname3
        self.labelGithubPing.toolTip = hostname2
        self.labelApplePing.toolTip = hostname1
        formatterDate.timeStyle = .short
        formatterDate.dateStyle = .none
        
    }
    
    
    @IBAction func testButtonPressed(_ sender: NSButton) {
        labelJeseHidden.isHidden = true
        pingResultLabel.stringValue = "NA"
        pingResultLabelGH.stringValue = "NA"
        pingResultLabelApple.stringValue = "NA"
        indicatorGH.stringValue = "Status: Unknown"
        indicatorApple.stringValue = "Status: Unknown"
        indicatorGoogle.stringValue = "Status: Unknown"
        lastPingGH.stringValue = "NA"
        lastPingApple.stringValue = "NA"
        lastPingGoogle.stringValue = "NA"
        self.indicatorOfflineApple.isHidden = true
        self.indicatorOnlineApple.isHidden = true
        self.indicatorUnknownApple.isHidden = false
        self.indicatorOffline.isHidden = true
        self.indicatorOnline.isHidden = true
        self.indicatorUnknown.isHidden = false
        self.indicatorOfflineGH.isHidden = true
        self.indicatorOnlineGH.isHidden = true
        self.indicatorUnknownGH.isHidden = false
        
    }

    @IBAction func applePress(_ sender: Any) {
        applePressNonIB()
    }
    @objc func applePressNonIB() {
        if buttonPressedYes1 == true {
            PlainPing.ping(hostnameUser1, withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
                if let latency = timeElapsed {
                    let latenssi = String(format: "%.2f", latency)
                    self.pingResultLabelApple.stringValue = latenssi
                    self.pingResultLabelApple.isHidden = false
                    self.indicatorApple.isHidden = false
                    self.indicatorApple.stringValue = "Status: Online"
                    self.indicatorOnlineApple.isHidden = false
                    self.indicatorOfflineApple.isHidden = true
                    self.indicatorUnknownApple.isHidden = true
                    self.lastPingApple.stringValue = self.formatterDate.string(from: self.currentDateTime)
                    print(hostnameUser1)
                }
                if let error = error {
                    let logErrorCustomApple = error.localizedDescription
                    logsApple = logErrorCustomApple
                    self.pingResultLabelApple.stringValue = ("NA Check log")
                    NotificationCenter.default.post(name: .errorLogNotificationApple, object: nil)
                    self.pingResultLabelApple.isHidden = false
                    self.indicatorApple.isHidden = false
                    self.indicatorApple.stringValue = "Status: Offline"
                    self.indicatorOfflineApple.isHidden = false
                    self.indicatorOnlineApple.isHidden = true
                    self.indicatorUnknownApple.isHidden = true
                    self.lastPingApple.stringValue = self.formatterDate.string(from: self.currentDateTime)
                    if (repeatTicker1 == true) {
                        self.errorTicker1 = self.errorTicker1 + 1
                    }
                    if (self.errorTicker1 >= 3) {
                        self.showNotification(message: "Address Offline", title: "Address \(hostnameUser1) is offline", identifier: self.applePingIdentifier)
                        self.repeatTimer1.invalidate()
                        self.stopLabel.isHidden = true
                        self.stopButtonOutlet.isHidden = true
                    }
                    print(repeatTicker1)
                    print(self.errorTicker1)
                }
            }
            )}
            else {
            PlainPing.ping(hostname3, withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
                if let latency = timeElapsed {
                    let latenssi = String(format: "%.2f", latency)
                    self.pingResultLabelApple.stringValue = latenssi
                    self.pingResultLabelApple.isHidden = false
                    self.indicatorApple.isHidden = false
                    self.indicatorApple.stringValue = "Status: Online"
                    self.indicatorOnlineApple.isHidden = false
                    self.indicatorOfflineApple.isHidden = true
                    self.indicatorUnknownApple.isHidden = true
                    self.lastPingApple.stringValue = self.formatterDate.string(from: self.currentDateTime)
                    print(hostnameUser1)
                    
                }
                if let error = error {
                    let logErrorNormApple = error.localizedDescription
                    logsApple = logErrorNormApple
                    self.pingResultLabelApple.stringValue = ("NA Check log")
                    NotificationCenter.default.post(name: .errorLogNotificationApple, object: nil)
                    self.pingResultLabelApple.isHidden = false
                    self.indicatorApple.isHidden = false
                    self.indicatorApple.stringValue = "Status: Offline"
                    self.indicatorOfflineApple.isHidden = false
                    self.indicatorOnlineApple.isHidden = true
                    self.indicatorUnknownApple.isHidden = true
                    self.lastPingApple.stringValue = self.formatterDate.string(from: self.currentDateTime)
                }
            }
            )}
    }
    @IBAction func githubPress(_ sender: NSButton) {
        githubPressNonIB()
    }
    @objc func githubPressNonIB() {
        if buttonPressedYes2 == true {
            PlainPing.ping(hostnameUser2, withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
                if let latency = timeElapsed {
                    let latenssi = String(format: "%.2f", latency)
                    self.pingResultLabelGH.stringValue = latenssi
                    self.pingResultLabelGH.isHidden = false
                    self.indicatorGH.isHidden = false
                    self.indicatorOnlineGH.isHidden = false
                    self.indicatorUnknownGH.isHidden = true
                    self.indicatorOfflineGH.isHidden = true
                    self.indicatorGH.stringValue = "Status: Online"
                    self.lastPingGH.stringValue = self.formatterDate.string(from: self.currentDateTime)
                    print(hostnameUser2)
                }
                if let error = error {
                    let logErrorCustomGithub = error.localizedDescription
                    logsGithub = logErrorCustomGithub
                    self.pingResultLabelGH.stringValue = ("NA Check log")
                    NotificationCenter.default.post(name: .errorLogNotificationGithub, object: nil)
                    self.pingResultLabelGH.isHidden = false
                    self.indicatorGH.isHidden = false
                    self.indicatorOfflineGH.isHidden = false
                    self.indicatorOnlineGH.isHidden = true
                    self.indicatorUnknownGH.isHidden = true
                    self.indicatorGH.stringValue = "Status: Offline"
                    self.lastPingGH.stringValue = self.formatterDate.string(from: self.currentDateTime)
                    if (repeatTicker2 == true) {
                        self.errorTicker2 = self.errorTicker2 + 1
                    }
                    if (self.errorTicker2 >= 3) {
                        self.showNotification(message: "Address Offline", title: "Address \(hostnameUser2) is offline", identifier: self.githubPingIdentifier)
                        self.stopLabel.isHidden = true
                        self.stopButtonOutlet.isHidden = true
                        self.repeatTimer2.invalidate()
                    }
                    print(repeatTicker2)
                    print(self.errorTicker2)
                }
            }
            )} else {
            PlainPing.ping("www.github.com", withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
                if let latency = timeElapsed {
                    let latenssi = String(format: "%.2f", latency)
                    self.pingResultLabelGH.stringValue = latenssi
                    self.pingResultLabelGH.isHidden = false
                    self.indicatorGH.isHidden = false
                    self.indicatorOnlineGH.isHidden = false
                    self.indicatorOfflineGH.isHidden = true
                    self.indicatorUnknownGH.isHidden = true
                    self.indicatorGH.stringValue = "Status: Online"
                    self.lastPingGH.stringValue = self.formatterDate.string(from: self.currentDateTime)
                    
                }
                if let error = error {
                    let logErrorNormGithub = error.localizedDescription
                    logsGithub = logErrorNormGithub
                    self.pingResultLabelGH.stringValue = "NA Check log"
                    NotificationCenter.default.post(name: .errorLogNotificationGithub, object: nil)
                    self.pingResultLabelGH.isHidden = false
                    self.indicatorGH.isHidden = false
                    self.indicatorOfflineGH.isHidden = false
                    self.indicatorUnknownGH.isHidden = true
                    self.indicatorOnlineGH.isHidden = true
                    self.indicatorGH.stringValue = "Status: Offline"
                    self.lastPingGH.stringValue = self.formatterDate.string(from: self.currentDateTime)
                    
                }
            })
        }
    }
    @IBAction func googlePress(_ sender: Any) {
       googlePressNonIB()
    }
    @objc func googlePressNonIB() {
        if buttonPressedYes3 == true {
            PlainPing.ping(hostnameUser3, withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
                if let latency = timeElapsed {
                    let latenssi = String(format: "%.2f", latency)
                    self.pingResultLabel.stringValue = latenssi
                    self.pingResultLabel.isHidden = false
                    self.indicatorGoogle.isHidden = false
                    self.indicatorGoogle.stringValue = "Status: Online"
                    self.indicatorUnknown.isHidden = true
                    self.indicatorOffline.isHidden = true
                    self.indicatorOnline.isHidden = false
                    self.lastPingGoogle.stringValue = self.formatterDate.string(from: self.currentDateTime)
                    print(hostnameUser3)
                    
                }
                if let error = error {
                    let logErrorCustomGoogle = error.localizedDescription
                    logsGoogle = logErrorCustomGoogle
                    self.pingResultLabel.stringValue = ("NA check logs")
                    NotificationCenter.default.post(name: .errorLogNotificationGoogle, object: nil)
                    self.pingResultLabel.isHidden = false
                    self.indicatorGoogle.isHidden = false
                    self.indicatorGoogle.stringValue = "Status: Offline"
                    self.indicatorUnknown.isHidden = true
                    self.indicatorOnline.isHidden = true
                    self.indicatorOffline.isHidden = false
                    self.lastPingGoogle.stringValue = self.formatterDate.string(from: self.currentDateTime)
                    if (repeatTicker3 == true) {
                        self.errorTicker3 = self.errorTicker3 + 1
                    }
                    if (self.errorTicker3 == 3) {
                        self.showNotification(message: "Address Offline", title: "Address \(hostnameUser3) is offline", identifier: "\(self.googlePingIdentifier)")
                        self.repeatTimer3.invalidate()
                        self.stopLabel.isHidden = true
                        self.stopButtonOutlet.isHidden = true
                    }
                    print(repeatTicker3)
                    print(self.errorTicker3)
                    
                }
            }
            )} else {
            PlainPing.ping("www.google.com", withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
                if let latency = timeElapsed {
                    let latenssi = String(format: "%.2f", latency)
                    self.pingResultLabel.stringValue = latenssi
                    self.pingResultLabel.isHidden = false
                    self.indicatorGoogle.isHidden = false
                    self.indicatorGoogle.stringValue = "Status: Online"
                    self.indicatorUnknown.isHidden = true
                    self.indicatorOffline.isHidden = true
                    self.indicatorOnline.isHidden = false
                    self.lastPingGoogle.stringValue = self.formatterDate.string(from: self.currentDateTime)
                    
                }
                if let error = error {
                    let logErrorNormGoogle = error.localizedDescription
                    logsGoogle = logErrorNormGoogle
                    self.pingResultLabel.stringValue = ("NA check logs")
                    NotificationCenter.default.post(name: .errorLogNotificationGoogle, object: nil)
                    self.pingResultLabel.isHidden = false
                    self.indicatorGoogle.isHidden = false
                    self.indicatorUnknown.isHidden = true
                    self.indicatorOnline.isHidden = true
                    self.indicatorGoogle.stringValue = "Status: Offline"
                    self.indicatorOffline.isHidden = false
                    self.lastPingGoogle.stringValue = self.formatterDate.string(from: self.currentDateTime)
                }
            }
            )
        }
    }
    @IBAction func stopButton(_ sender: Any) {
        stopLabel.isHidden = true
        stopButtonOutlet.isHidden = true
        if repeatTicker1 == true {
            repeatTimer1.invalidate()
            repeatTicker1 = false
            NotificationCenter.default.post(name: .stop1, object: nil)
        }
        if repeatTicker2 == true {
            repeatTimer2.invalidate()
            repeatTicker2 = false
            NotificationCenter.default.post(name: .stop2, object: nil)
        }
        if repeatTicker3 == true {
            repeatTimer3.invalidate()
            repeatTicker3 = false
            NotificationCenter.default.post(name: .stop3, object: nil)
        }
        
    }
    let contentUN = UNMutableNotificationContent()
    let showLogs = UNNotificationAction(identifier: "SHOW_LOGS", title: "Logs", options: UNNotificationActionOptions(rawValue: 0))
    let dismissNotif = UNNotificationAction(identifier: "DISMISS", title: "Dismiss", options: UNNotificationActionOptions(rawValue: 0))
    func showNotification(message: String, title: String, identifier: String){
        let contentCategoryAction = UNNotificationCategory(identifier: "NOTIFICATION_ACTION", actions: [self.showLogs, self.dismissNotif], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: .customDismissAction)
        UNUserNotificationCenter.current().setNotificationCategories([contentCategoryAction])
        let memeTrigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 1, repeats: false)
        contentUN.body = message
        contentUN.title = title
        contentUN.categoryIdentifier = "NOTIFICATION_ACTION"
        let notify = UNNotificationRequest.init(identifier: identifier, content: contentUN, trigger: memeTrigger)
        UNUserNotificationCenter.current().add(notify) { (error) in
            if error != nil {
            }
        }
    }
    let logsWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "logWindow") as! NSWindowController
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case "SHOW_LOGS":
            for window: NSWindow in NSApp.orderedWindows {
                window.makeKeyAndOrderFront(self)
            }
            if muikeaTicker == true {
                logsWindowController.showWindow(self)
            }
            logsWindowController.window?.makeKeyAndOrderFront(self)
            logsWindowController.window?.orderFrontRegardless()
            NSApp.activate(ignoringOtherApps: true)
            break
        case "DISMISS":
            break
        default:
            self.view.window?.makeKeyAndOrderFront(self)
            break
        }
        completionHandler()
    }
    @IBOutlet weak var labelJeseHidden: NSTextField!
    var bensi = "MacPinger v1.0"
    var jese = "Jesse Pitkänen 2019"
    override func viewDidLoad() {
        super.viewDidLoad()
        labelApp.stringValue = bensi
        labelJese.stringValue = jese
        labelApp.alignment = NSTextAlignment.center
        labelJese.alignment = NSTextAlignment.center
        stopLabel.isHidden = true
        stopLabel.stringValue = "Stop"
        stopButtonOutlet.isHidden = true
        stopLabel.alignment = NSTextAlignment.center
        labelApp.isHidden = true
        labelJeseHidden.isHidden = true
        pingResultLabel.isHidden = false
        pingResultLabelGH.isHidden = false
        pingResultLabelApple.isHidden = false
        pingResultLabel.stringValue = "NA"
        pingResultLabelGH.stringValue = "NA"
        pingResultLabelApple.stringValue = "NA"
        lastPingGoogle.stringValue = "NA"
        lastPingApple.stringValue = "NA"
        lastPingGH.stringValue = "NA"
        indicatorGH.isHidden = false
        indicatorGH.stringValue = "Status: Unknown"
        indicatorGoogle.stringValue = "Status: Unknown"
        indicatorApple.stringValue = "Status: Unknown"
        indicatorGH.alignment = NSTextAlignment.center
        indicatorGoogle.alignment = NSTextAlignment.center
        indicatorApple.alignment = NSTextAlignment.center
        indicatorApple.isHidden = false
        indicatorGoogle.isHidden = false
        indicatorOffline.isHidden = true
        indicatorOnline.isHidden = true
        indicatorUnknown.isHidden = false
        indicatorOfflineApple.isHidden = true
        indicatorOnlineApple.isHidden = true
        indicatorUnknownApple.isHidden = false
        indicatorOfflineGH.isHidden = true
        indicatorOnlineGH.isHidden = true
        indicatorUnknownGH.isHidden = false
        labelApplePing.stringValue = (hostname1)
        labelGithubPing.stringValue = (hostname2)
        labelGooglePing.stringValue = (hostname3)
        tesbuttonTitle.stringValue = "Reset"
        buttonGHOutlet.stringValue = "GitHub"
        buttonAppleOutlet.stringValue = "Apple"
        notifCenterU.delegate = self
        
    }
}
extension Notification.Name{
    static let buttonFirstHasBeenPressed = Notification.Name("Done1")
    static let buttonSecondHasBeenPressed = Notification.Name("Done2")
    static let buttonThirdHasBeenPressed = Notification.Name("Done3")
    static let resetButtonHasBeenPressed = Notification.Name("Done4")
    static let buttonThirdHasBeenPressedRepeat = Notification.Name("Repeater1")
    static let buttonSecondHasBeenPressedRepeat = Notification.Name("Repeater2")
    static let buttonFirstHasBeenPressedRepeat = Notification.Name("Repeater3")
    static let stop1 = Notification.Name("Stobit1")
    static let stop2 = Notification.Name("Stobit2")
    static let stop3 = Notification.Name("Stobit3")
}
