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
    @IBOutlet weak var buttonGoogle: NSButton!
    @IBOutlet weak var buttonGH: NSLayoutConstraint!
    @IBOutlet weak var pingResultLabel: NSTextField!
    @IBOutlet weak var buttonApple: NSLayoutConstraint!
    @IBOutlet weak var pingResultLabelGH: NSTextField!
    @IBOutlet weak var labelApp: NSTextField!
    @IBOutlet weak var labelJese: NSTextFieldCell!
    @IBOutlet weak var pingResultLabelApple: NSTextField!
    var hostApple = "www.apple.com"
    var benis = NumberFormatter()
    var huutista = NSColor(deviceRed: 266, green: 0, blue: 0, alpha: 1.0)
    var onnistu = NSColor(deviceRed: 0, green: 266, blue: 0, alpha: 1.0)
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.title = "System Status Checker v1.0"
    }
    
    

    
    @IBAction func buttonApple(_ sender: Any) {
        PlainPing.ping("www.apple.com", withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
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
                
            }
            
            if let error = error {
                self.pingResultLabel.stringValue = ("Service Offline:\n \(error.localizedDescription)\n/Check Your Internet Connection!")
                self.pingResultLabelApple.isHidden = false
                self.indicatorApple.isHidden = false
                self.indicatorApple.fillColor = self.huutista
                
                
                
                
            }
        }
    )}
    
    
    @IBAction func buttonGH(_ sender: Any) {
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
                self.pingResultLabel.stringValue = ("Service Offline:\n \(error.localizedDescription)\n/Check Your Internet Connection!")
                self.pingResultLabelGH.isHidden = false
                self.indicatorGH.isHidden = false
                self.indicatorGH.fillColor = self.huutista
            }
        })
    }
    
    @IBAction func googlePress(_ sender: Any) {
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
        
    }
    var bensi = "System Status Checker v1.0"
    var jese = "Jesse Pitkänen 2019"
    var test1 = "Googlu"
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
        buttonGoogle.title = test1
        
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }




}

