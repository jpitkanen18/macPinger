//
//  ViewController.swift
//  Service Checker
//
//  Created by Jese on 21/01/2019.
//  Copyright © 2019 jbenisoy. All rights reserved.
//
import Cocoa
import PlainPing
class ViewController: NSViewController {
    //Memes here
    @IBOutlet weak var indicatorGoogle: NSBox!
    @IBOutlet weak var indicatorApple: NSBox!
    @IBOutlet weak var indicatorGH: NSBox!
    @IBOutlet weak var buttonGoogleOutlet: NSButton!
    @IBOutlet weak var buttonAppleOutlet: NSButton!
    @IBOutlet weak var buttonGHOutlet: NSButton!
    @IBOutlet weak var pingResultLabel: NSTextField!
    @IBOutlet weak var pingResultLabelGH: NSTextField!
    @IBOutlet weak var labelApp: NSTextField!
    @IBOutlet weak var labelJese: NSTextFieldCell!
    @IBOutlet weak var pingResultLabelApple: NSTextField!
    @IBOutlet weak var labelGooglePing: NSTextField!
    @IBOutlet weak var labelGithubPing: NSTextField!
    @IBOutlet weak var labelApplePing: NSTextField!
    
    
    var benis = NumberFormatter()
    var huutista = NSColor(deviceRed: 266, green: 0, blue: 0, alpha: 1.0)
    var onnistu = NSColor(deviceRed: 0, green: 266, blue: 0, alpha: 1.0)
    let notificationCenter = NotificationCenter.default
    
    @objc func settingFirst(_ notification:Notification) {
        self.buttonAppleOutlet.title = buttonName1
        self.labelApplePing.stringValue = ("Now pingning:\n \(hostnameUser1)")
        self.labelApplePing.alignment = NSTextAlignment.center
    }
    @objc func settingSecond(_ notification:Notification) {
        self.buttonGHOutlet.title = buttonName2
        self.labelGithubPing.stringValue = ("Now pingning:\n \(hostnameUser2)")
        self.labelGithubPing.alignment = NSTextAlignment.center
    }
    @objc func settingThird(_ notification:Notification) {
        self.buttonGoogleOutlet.title = buttonName3
        self.labelGooglePing.stringValue = ("Now pingning:\n \(hostnameUser3)")
        self.labelGooglePing.alignment = NSTextAlignment.center
    }
    @objc func resetSettings(_ notification:Notification){
        self.buttonAppleOutlet.title = buttonName1
        self.buttonGHOutlet.title = buttonName2
        self.buttonGoogleOutlet.title = buttonName3
        self.labelApplePing.stringValue = ("Now pingning:\n \(hostname1)")
        self.labelGithubPing.stringValue = ("Now pingning:\n \(hostname2)")
        self.labelGooglePing.stringValue = ("Now pingning:\n \(hostname3)")
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.title = "System Status Checker v1.0"
        self.buttonAppleOutlet.title = buttonName1
        notificationCenter.addObserver(self, selector: #selector(settingFirst(_:)), name: .buttonFirstHasBeenPressed, object: nil)
        notificationCenter.addObserver(self, selector: #selector(resetSettings(_:)), name: .resetButtonHasBeenPressed, object: nil)
        notificationCenter.addObserver(self, selector: #selector(settingSecond(_:)), name: .buttonSecondHasBeenPressed, object: nil)
        notificationCenter.addObserver(self, selector: #selector(settingThird(_:)), name: .buttonThirdHasBeenPressed, object: nil)
        
    }
    @IBAction func testButton(_ sender: Any) {
        print(buttonPressedYes1)
    }
    
    
    @IBAction func buttonApple(_ sender: Any) {
        if buttonPressedYes1 == true {
            PlainPing.ping(hostnameUser1, withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
                if let latency = timeElapsed {
                    self.benis.numberStyle = .decimal
                    self.benis.maximumFractionDigits = 2
                    let latenssi = String(format: "%.2f", latency)
                    self.pingResultLabelApple.stringValue = """
                    Latency (ms):\n\((latenssi))\nService Online!
                    """
                    self.pingResultLabelApple.isHidden = false
                    self.indicatorApple.isHidden = false
                    self.indicatorApple.fillColor = self.onnistu
                    print(hostnameUser1)
                }
                if let error = error {
                    self.pingResultLabel.stringValue = ("Service Offline:\n \(error.localizedDescription)\nCheck Your Internet Connection!")
                    self.pingResultLabelApple.isHidden = false
                    self.indicatorApple.isHidden = false
                    self.indicatorApple.fillColor = self.huutista
                }
            }
        )}
        else {
        PlainPing.ping(hostname3, withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
            if let latency = timeElapsed {
                self.benis.numberStyle = .decimal
                self.benis.maximumFractionDigits = 2
                let latenssi = String(format: "%.2f", latency)
                self.pingResultLabelApple.stringValue = """
                Latency (ms):\n\((latenssi))\nService Online!
                """
                self.pingResultLabelApple.isHidden = false
                self.indicatorApple.isHidden = false
                self.indicatorApple.fillColor = self.onnistu
                print(hostnameUser1)
                
            }
            if let error = error {
                self.pingResultLabel.stringValue = ("Service Offline:\n \(error.localizedDescription)\nCheck Your Internet Connection!")
                self.pingResultLabelApple.isHidden = false
                self.indicatorApple.isHidden = false
                self.indicatorApple.fillColor = self.huutista
            }
        }
    )}
    }
    @IBAction func githubPree(_ sender: NSButton) {
        if buttonPressedYes2 == true {
            PlainPing.ping(hostnameUser2, withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
                if let latency = timeElapsed {
                    self.benis.numberStyle = .decimal
                    self.benis.maximumFractionDigits = 2
                    let latenssi = String(format: "%.2f", latency)
                    self.pingResultLabelGH.stringValue = """
                    Latency (ms):\n\((latenssi))\nService Online!
                    """
                    self.pingResultLabelGH.isHidden = false
                    self.indicatorGH.isHidden = false
                    self.indicatorGH.fillColor = self.onnistu
                    print(hostnameUser2)
                }
                if let error = error {
                    self.pingResultLabelGH.stringValue = ("Service Offline:\n \(error.localizedDescription)\nCheck Your Internet Connection!")
                    self.pingResultLabelGH.isHidden = false
                    self.indicatorGH.isHidden = false
                    self.indicatorGH.fillColor = self.huutista
                }
            }
            )} else {
        PlainPing.ping("www.github.com", withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
            if let latency = timeElapsed {
                self.benis.numberStyle = .decimal
                self.benis.maximumFractionDigits = 2
                let latenssi = String(format: "%.2f", latency)
                self.pingResultLabelGH.stringValue = """
                Latency (ms):\n\((latenssi))\nService Online!
                """
                self.pingResultLabelGH.isHidden = false
                self.indicatorGH.isHidden = false
                self.indicatorGH.fillColor = self.onnistu
                
            }
            if let error = error {
                self.pingResultLabelGH.stringValue = ("Service Offline:\n \(error.localizedDescription)\n/Check Your Internet Connection!")
                self.pingResultLabelGH.isHidden = false
                self.indicatorGH.isHidden = false
                self.indicatorGH.fillColor = self.huutista
                
            }
        })
        }}
    @IBAction func googlePress(_ sender: Any) {
        if buttonPressedYes3 == true {
            PlainPing.ping(hostnameUser3, withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
                if let latency = timeElapsed {
                    self.benis.numberStyle = .decimal
                    self.benis.maximumFractionDigits = 2
                    let latenssi = String(format: "%.2f", latency)
                    self.pingResultLabel.stringValue = """
                    Latency (ms):\n\((latenssi))\nService Online!
                    """
                    self.pingResultLabel.isHidden = false
                    self.indicatorGoogle.isHidden = false
                    self.indicatorGoogle.fillColor = self.onnistu
                    print(hostnameUser3)
                    
                }
                if let error = error {
                    self.pingResultLabel.stringValue = ("Service Offline:\n \(error.localizedDescription)\nCheck Your Internet Connection!")
                    self.pingResultLabelApple.isHidden = false
                    self.indicatorApple.isHidden = false
                    self.indicatorApple.fillColor = self.huutista
                    
                }
            }
            )} else {
        PlainPing.ping("www.google.com", withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
            if let latency = timeElapsed {
                self.benis.numberStyle = .decimal
                self.benis.maximumFractionDigits = 2
                let latenssi = String(format: "%.2f", latency)
                self.pingResultLabel.stringValue = """
                Latency (ms):\n\((latenssi))\nService Online!
                """
                self.pingResultLabel.isHidden = false
                self.indicatorGoogle.isHidden = false
                self.indicatorGoogle.fillColor = self.onnistu
            
            }
            if let error = error {
                self.pingResultLabel.stringValue = ("Service Offline:\n \(error.localizedDescription)\n/Check Your Internet Connection!")
                self.pingResultLabel.isHidden = false
                self.indicatorGoogle.isHidden = false
                self.indicatorGoogle.fillColor = self.huutista
                
            }
        })
        }}
    var bensi = "System Status Checker v1.0"
    var jese = "Jesse Pitkänen 2019"
    override func viewDidLoad() {
        super.viewDidLoad()
        labelApp.stringValue = bensi
        labelJese.stringValue = jese
        labelApp.alignment = NSTextAlignment.center
        labelJese.alignment = NSTextAlignment.center
        pingResultLabel.isHidden = true
        pingResultLabelGH.isHidden = true
        pingResultLabelApple.isHidden = true
        indicatorGH.isHidden = true
        indicatorApple.isHidden = true
        indicatorGoogle.isHidden = true
        labelApplePing.stringValue = ("Now pingning:\n \(hostname1)")
        labelGithubPing.stringValue = ("Now pingning:\n \(hostname2)")
        labelGooglePing.stringValue = ("Now pingning:\n \(hostname3)")
        labelApplePing.alignment = NSTextAlignment.center
        labelGithubPing.alignment = NSTextAlignment.center
        labelGooglePing.alignment = NSTextAlignment.center

    }
}
extension Notification.Name{
    static let buttonFirstHasBeenPressed = Notification.Name("Done1")
    static let buttonSecondHasBeenPressed = Notification.Name("Done2")
    static let buttonThirdHasBeenPressed = Notification.Name("Done3")
    static let resetButtonHasBeenPressed = Notification.Name("Done4")
}
