//
//  ViewController.swift
//  RGBtoHEXConverter
//
//  Created by Alperen Emir on 9.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        secilenindex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        if secilenindex == 0 {
            btnConvert.setTitle("RGB - HEX Convert", for: UIControl.State.normal)
        } else {
            btnConvert.setTitle("HEX - RGB Convert", for: UIControl.State.normal)
        }
    }
    

    @IBAction func btnConvertClicked(_ sender: UIButton) {
        
        if secilenindex == 0 {
            convertRGBtoHEX()
        } else {
            convertHEXtoRGB()
        }
    }
    
    func convertRGBtoHEX() {
        guard let redValue = UInt8(txtRed.text!) else {return}
        guard let greenValue = UInt8(txtGreen.text!) else {return}
        guard let blueValue = UInt8(txtBlue.text!) else {return}
        
        let redHax = String(format : "%2X", redValue)
        let greenHax = String(format : "%2X", greenValue)
        let blueHax = String(format : "%2X", blueValue)
        
        lblResult.text = "HEX Color : #\(redHax)\(greenHax)\(blueHax)"
        lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
    }
    
    func convertHEXtoRGB() {
        guard let redValue = UInt8(txtRed.text!, radix: 16) else {return}
        guard let greenValue = UInt8(txtGreen.text!, radix: 16) else {return}
        guard let blueValue = UInt8(txtBlue.text!, radix: 16) else {return}
        
        lblResult.text = "RED : \(redValue) \n GREEN : \(greenValue) \n BLUE : \(blueValue)"
        lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
        
    }
}

