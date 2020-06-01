//
//  ViewController.swift
//  DeveloperTools
//
//  Created by ZHXW on 2020/5/28.
//  Copyright © 2020 com. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var colorShowView: NSView!
    
    @IBOutlet weak var decimalTextFieldR: NSTextField!
    @IBOutlet weak var octalTextFieldR: NSTextField!
    @IBOutlet weak var binaryTextFieldR: NSTextField!
    
    @IBOutlet weak var decimalTextFieldG: NSTextField!
    @IBOutlet weak var octalTextFieldG: NSTextField!
    @IBOutlet weak var binaryTextFieldG: NSTextField!
    
    @IBOutlet weak var decimalTextFieldB: NSTextField!
    @IBOutlet weak var octalTextFieldB: NSTextField!
    @IBOutlet weak var binaryTextFieldB: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()

        colorShowView.layer?.cornerRadius = 8
        colorShowView.layer?.masksToBounds = true
        colorShowView.layer?.backgroundColor = NSColor.black.cgColor
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func ColorValueChanged(_ sender: NSTextField) {
        let color = DTColors.color(with: sender.stringValue)
        colorShowView.layer?.backgroundColor = color.0.cgColor
        
        decimalTextFieldR.stringValue = String(format: "%d", color.1)
        decimalTextFieldG.stringValue = String(format: "%d", color.2)
        decimalTextFieldB.stringValue = String(format: "%d", color.3)
        
        octalTextFieldR.stringValue = String(format: "%o", color.1)
        octalTextFieldG.stringValue = String(format: "%o", color.2)
        octalTextFieldB.stringValue = String(format: "%o", color.3)
        
        binaryTextFieldR.stringValue = String(color.1, radix: 2, uppercase: false)
        binaryTextFieldG.stringValue = String(color.2, radix: 2, uppercase: false)
        binaryTextFieldB.stringValue = String(color.3, radix: 2, uppercase: false)
    }
}

