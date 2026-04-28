### A screensaver for macOS (v14.6.1 or later)

Idea from (https://gradiyent.netlify.app/)

[Download Gradi Screensaver](https://github.com/henrychen1210/gradi-screensaver/raw/main/app/gradi.saver.zip)

https://github.com/user-attachments/assets/13820a93-c644-4c1b-a1df-2d3ac4ab9497


Hope you enjoy!

---

## Build from Source

### Requirements

- macOS 14.6.1 (Sonoma) or later
- Xcode 15 or later

### Steps

**1. Clone the repo**
```bash
git clone https://github.com/henrychen1210/gradi-screensaver.git
cd gradi-screensaver
```

**2. Build**

Using Xcode:
- Open `gradi.xcodeproj`
- Select the `gradi` scheme with destination **My Mac**
- Press `⌘B` to build

Using the command line:
```bash
xcodebuild -project gradi.xcodeproj -scheme gradi -configuration Release build
```

**3. Install**

Double-click the built `gradi.saver` file, or run:
```bash
open ~/Library/Developer/Xcode/DerivedData/gradi-*/Build/Products/Release/gradi.saver
```

System Settings will open and prompt you to install the screensaver.





