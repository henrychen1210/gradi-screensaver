//
//  ViewController.swift
//  ScreensaverHostApp
//
//  Created by Henry Chen on 8/23/24.
//

import Cocoa
import ScreenSaver

class ViewController: NSViewController {

    @IBOutlet var screensaverContaonerView: NSView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Log to see if viewDidLoad is called
            print("ViewController: viewDidLoad called")
            
            // Create the screensaver view with the container's bounds
            if let screensaverView = GradiScreenSaverView(frame: screensaverContaonerView.bounds, isPreview: false) {
                // Log to see if screensaverView is created
                print("ScreensaverView initialized")
                
                // Set autoresizing mask to allow the view to resize with the container
                screensaverView.autoresizingMask = [.width, .height]
                
                // Add the screensaver view as a subview to the container view
                screensaverContaonerView.addSubview(screensaverView)
                
                // Start the screensaver animation
                screensaverView.startAnimation()
                
                // Log to see if animation is started
                print("Screensaver animation started")
            } else {
                // Log if screensaverView initialization failed
                print("Failed to initialize ScreensaverView")
            }
        }
}

