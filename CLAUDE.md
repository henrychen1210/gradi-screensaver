# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A macOS screensaver (`.saver` bundle) that renders an animated gradient — continuously shifting hue and rotating angle. Requires macOS 14.6.1 (Sonoma) or later.

## Build & Install

Open `gradi.xcodeproj` in Xcode and build the `gradi` target. The output is `gradi.saver` in the Xcode build products directory.

To install, double-click `gradi.saver` or copy it to `~/Library/Screen Savers/`.

The distributable zip (`app/gradi.saver.zip`) must be updated manually after each build.

There are no tests, no package manager, and no CLI build commands — Xcode is the only build tool.

## Architecture

The entire screensaver logic lives in one file: `Gradi/Gradi.swift`.

`GradiScreenSaverView` subclasses `ScreenSaverView` (macOS `ScreenSaver` framework) and overrides two methods:

- `draw(_:)` — renders an `NSGradient` between `startColor` and `endColor` at `rotationAngle`
- `animateOneFrame()` — called at 30 FPS; increments hue on both colors (`colorChangeSpeed = 0.001`/frame), rotates the angle 1°/frame, and cycles `percentage` (currently unused in drawing)

Color mutation uses HSB space: hue wraps at 1.0, saturation and brightness stay fixed. The `percentage` field oscillates between 50–66 but is not passed to any drawing call — it's vestigial or reserved for future use.
