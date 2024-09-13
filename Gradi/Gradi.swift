//
//  Gradi.swift
//  Gradi
//
//  Created by Henry Chen on 8/23/24.
//

import Foundation
import ScreenSaver

class GradiScreenSaverView: ScreenSaverView {
    var startColor: NSColor = NSColor(hue: 0.1, saturation: 0.1, brightness: 0.7, alpha: 1.0)
    var endColor: NSColor = NSColor(hue: 0.3, saturation: 0.3, brightness: 0.9, alpha: 1.0)
    var colorChangeSpeed: CGFloat = 0.001
    var rotationAngle: CGFloat = 0
    var percentage: CGFloat = 50

    override init?(frame: CGRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.animationTimeInterval = 1 / 30.0 // 30 FPS
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: NSRect) {
        super.draw(rect)
        
        // Create a gradient
        let gradient = NSGradient(starting: startColor, ending: endColor)
        gradient?.draw(in: rect, angle: rotationAngle)
    }
    
    override func animateOneFrame() {
        // Update the gradient and rotation angle
        updateColors()
        updateRotationAngle()
        updatePercentage()
        
        // Redraw the view with updated settings
        setNeedsDisplay(bounds)
    }
    
    private func updateColors() {
        startColor = adjustColor(startColor)
        endColor = adjustColor(endColor)
    }
    
    private func adjustColor(_ color: NSColor) -> NSColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.usingColorSpace(.deviceRGB)?.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        // Adjust the hue slightly for a smooth transition
        hue += colorChangeSpeed
        if hue > 1.0 { hue -= 1.0 }
        
        return NSColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    private func updateRotationAngle() {
        rotationAngle += 1.0
        if rotationAngle >= 360.0 {
            rotationAngle = 0.0
        }
    }
    
    private func updatePercentage() {
        percentage += 0.1
        if percentage >= 66.0 {
            percentage = 50.0
        }
    }
}
