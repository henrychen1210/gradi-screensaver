//
//  Gradi.swift
//  Gradi
//
//  Created by Henry Chen on 8/23/24.
//

import ScreenSaver

class GradiScreenSaverView: ScreenSaverView {

    // MARK: - Configuration

    private let colorCycleSpeed: CGFloat = 0.001  // hue units advanced per frame
    private let rotationSpeed: CGFloat = 1.0       // degrees rotated per frame

    // MARK: - State

    private var startColor = NSColor(hue: 0.1, saturation: 0.1, brightness: 0.7, alpha: 1.0)
    private var endColor   = NSColor(hue: 0.3, saturation: 0.3, brightness: 0.9, alpha: 1.0)
    private var rotationAngle: CGFloat = 0

    // MARK: - Init

    override init?(frame: CGRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        animationTimeInterval = 1.0 / 30.0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ScreenSaverView

    override func draw(_ rect: NSRect) {
        super.draw(rect)
        guard let gradient = NSGradient(starting: startColor, ending: endColor) else { return }
        gradient.draw(in: rect, angle: rotationAngle)
    }

    override func animateOneFrame() {
        startColor    = startColor.byAdvancingHue(by: colorCycleSpeed)
        endColor      = endColor.byAdvancingHue(by: colorCycleSpeed)
        rotationAngle = (rotationAngle + rotationSpeed).truncatingRemainder(dividingBy: 360)
        setNeedsDisplay(bounds)
    }
}

// MARK: - NSColor helpers

private extension NSColor {
    /// Returns a copy of the receiver with its hue shifted forward by `delta` (wraps at 1.0).
    /// Falls back to `self` if the color cannot be expressed in sRGB, preventing silent corruption.
    func byAdvancingHue(by delta: CGFloat) -> NSColor {
        guard let srgb = usingColorSpace(.sRGB) else { return self }
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        srgb.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return NSColor(hue: (h + delta).truncatingRemainder(dividingBy: 1.0),
                       saturation: s, brightness: b, alpha: a)
    }
}
