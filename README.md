<br>

<p align="center">
  <picture> 
    <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/23524947/229163179-2033f875-f9cc-46ea-8d27-3a8a04007824.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/23524947/229172729-dd4fec15-8f90-4ca8-b59c-7ee109da7370.svg">
    <img alt="PopupView Logo" src="https://user-images.githubusercontent.com/23524947/229163179-2033f875-f9cc-46ea-8d27-3a8a04007824.svg" width="88%"">
  </picture>
</p>

<h3 style="font-size: 5em" align="center">
    Popups presentation made simple
</h3>

<p align="center">
    Create beautiful and fully customisable popups in no time. Keep your code clean
</p>

<p align="center">
    <a href="https://github.com/Mijick/PopupView-Example" rel="nofollow">Try demo we prepared</a>
</p>

<br>

<p align="center">
    <img alt="SwiftUI logo" src="https://user-images.githubusercontent.com/23524947/228844494-9be6d187-b4f5-4a95-93fa-9c430b2bc043.svg"/>
    <img alt="Platforms: iOS, iPadOS" src="https://user-images.githubusercontent.com/23524947/228702908-490eaa2f-d028-49a3-8959-cc7d64261de3.svg"/>
    <img alt="Release: 1.2.2" src="https://github.com/Mijick/PopupView/assets/23524947/198dfcaa-8615-43af-9b14-812e9dd6a7bd"/>
    <a href="https://www.swift.org/package-manager">
        <img alt="Swift Package Manager: Compatible" src="https://user-images.githubusercontent.com/23524947/228702912-50878cca-0902-4ec9-b042-c7762359137b.svg"/>
    </a>
    <img alt="License: MIT" src="https://user-images.githubusercontent.com/23524947/228702907-8388add4-b92f-46be-84e2-1526ff34ab72.svg"/>
</p>

<p align="center">
    <a href="https://github.com/Mijick/PopupView/stargazers">
        <img alt="Stars" src="https://user-images.githubusercontent.com/23524947/233516962-7588da9d-901c-4887-aef0-e4701b4b8612.svg"/>
    </a>
    <a href="https://twitter.com/tkurylik">
        <img alt="Follow us on Twitter" src="https://user-images.githubusercontent.com/23524947/228844665-d8cf7db8-e692-4c17-9b41-1b0471b552aa.svg"/>
    </a>
    <a href=mailto:team@mijick.com?subject=Hello>
        <img alt="Let's work together" src="https://user-images.githubusercontent.com/23524947/228844684-e8f87e2c-c85c-4cad-9bd1-f2e12a4627b8.svg"/>
    </a>
</p>

<p align="center">
    <img alt="Popup Examples" src="https://user-images.githubusercontent.com/23524947/228883231-7f55cf64-17e1-48b9-8922-2696ab7179d1.gif"/>
</p>

<br>

PopupView is a free and open-source library dedicated for SwiftUI that makes the process of presenting popups easier and much cleaner.
* **Improves code quality.** Show your popup using the `present()` modifier. Hide the selected one with `dismiss()`. Simple as never.
* **Create any popup.** We know how important customisation is; that's why we give you the opportunity to design your popup in any way you like.
* **Designed for SwiftUI.** While developing the library, we have used the power of SwiftUI to give you powerful tool to speed up your implementation process.

<br>

# Getting Started
### ✋ Requirements

| **Platforms** | **Minimum Swift Version** |
|:----------|:----------|
| iOS 15+, iPadOS 15+ | 5.7 |

### ⏳ Installation
The [Swift package manager][spm] is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding PopupView as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```Swift
dependencies: [
    .package(url: "https://github.com/Mijick/PopupView.git", branch(“main”))
]
```

<br>

# Usage
### 1. Setup library
Inside your `@main` structure call the `implementPopupView` method 
```Swift
  var body: some Scene {
        WindowGroup(content: ContentView().implementPopupView)
  }
```

### 2. Declare a structure of your popup
The library provides an ability to present your custom view in three predefinied places - **Top**, **Centre** and **Bottom**.<br>
In order to present it, it is necessary to confirm to one of the protocols during your view declaration:
- `TopPopup` - presents popup view from the top
- `CentrePopup` - presents popup view from the center
- `BottomPopup` - presents popup view from the bottom

So that an example view you want to present will have the following declaration:
```Swift
struct BottomCustomPopup: BottomPopup {
    ...
}
```

### 3. Provide identifier of your popup
Set the `id` parameter to control the uniqueness of the views being presented.
<br>

Your structure should now look like the following:
```Swift
struct BottomCustomPopup: BottomPopup {
    let id: String = "your_id"
    ...
}
```

### 4. Implement `createContent()` method. It's used instead of the body property, and declares the design of the popup view
```Swift
struct BottomCustomPopup: BottomPopup {
    let id: String = "your_id"
    
    
    func createContent() -> some View {
        HStack(spacing: 0) {
            Text("Witaj okrutny świecie")
            Spacer()
            Button(action: dismiss) { Text("Dismiss") } 
        }
        .padding(.vertical, 20)
        .padding(.leading, 24)
        .padding(.trailing, 16)
    }
    ...
}
```

### 5. Implement `configurePopup(popup: Config) -> Config` method to setup UI of presented view Each protocol has its own set of configuration type
```Swift
struct BottomCustomPopup: BottomPopup {
    let id: String = "your_id"
    
    
    func createContent() -> some View {
        HStack(spacing: 0) {
            Text("Witaj okrutny świecie")
            Spacer()
            Button(action: dismiss) { Text("Dismiss") } 
        }
        .padding(.vertical, 20)
        .padding(.leading, 24)
        .padding(.trailing, 16)
    }
    func configurePopup(popup: BottomPopupConfig) -> BottomPopupConfig {
        popup
            .horizontalPadding(20)
            .bottomPadding(42)
            .activePopupCornerRadius(16)
            .stackedPopupsCornerRadius(4)
    }
    ...
}
```

### 6. Present your popup from any place you want!
Just call `BottomCustomPopup().present()` from the selected place
```Swift
struct SettingsViewModel {
    ...
    func saveSettings() {
        ...
        BottomCustomPopup().present()
        ...
    }
    ...
}
```

### 7. Closing popups
There are two methods to do so:
- By calling one of the methods `dismiss`, `dismiss(_ popup: Popup.Type)`, `dismissAll` inside the popup you created
```Swift
struct BottomCustomPopup: BottomPopup {
    ...
    func createButton() -> some View {
        Button(action: dismiss) { Text("Tap to close") } 
    }
    ...
}
```
- By calling one of three static methods of PopupManager:
    - `PopupManager.dismiss()`
    - `PopupManager.dismiss(id: "some_id")` where id is the identifier of the popup you want to close
    - `PopupManager.dismiss(_ popup: Popup.Type)` where popup is the popup you want to close
    - `PopupManager.dismissAll()`
    
<br>

# Try our demo
See for yourself how does it work by cloning [project][Demo] we created

# License
PopupView is released under the MIT license. See [LICENSE][License] for details.





[MIT]: https://en.wikipedia.org/wiki/MIT_License
[SPM]: https://www.swift.org/package-manager

[Demo]: https://github.com/Mijick/PopupView-Example
[License]: https://github.com/Mijick/PopupView/blob/main/LICENSE

[spm]: https://www.swift.org/package-manager/
