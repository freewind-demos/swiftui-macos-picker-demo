import Cocoa

@main
struct PickerApp: App {
    var body: some Scene {
        Window("Picker 选择器演示", id: "main") {
            ContentView()
        }
        .defaultSize(width: 500, height: 500)
    }
}
