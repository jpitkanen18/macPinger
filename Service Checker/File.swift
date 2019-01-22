//
//  File.swift
//  Service Checker
//
//  Created by Jese on 22/01/2019.
//  Copyright © 2019 jbenisoy. All rights reserved.
//

import Foundation
import PlainPing
var serviceChecker = pings()
var mormVC = ViewController()
var benis = readLine()!
var indicatorPlaceHolder = readLine()!
var pingResultLabelGlobal = readLine()
class optimisation {

    @IBAction func buttonApple(_ sender: Any) {
        PlainPing.ping(benis, withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
            if let latency = timeElapsed {
                let latenssi = String(format: "%.2f", latency)
                mormVC.pingResultLabelApple.stringValue = """
                Latency (ms):\n\((latenssi))\nService Online!
                """
                pingResultLabelGlobal.isHidden = false
                indicatorPlaceHolder.isHidden = false
                indicatorPlaceHolder.fillColor = normVC.onnistu

            }
}
        )}
}
}}
class options {

}
