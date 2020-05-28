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
        colorShowView.layer?.backgroundColor = color.cgColor
    }
    
}

