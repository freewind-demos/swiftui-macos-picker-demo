import SwiftUI

struct ContentView: View {
    @State private var selectedColor = "Red"
    @State private var selectedIndex = 0
    @State private var selectedDate = Date()

    let colors = ["Red", "Blue", "Green", "Yellow"]
    let fruits = ["Apple", "Banana", "Orange", "Grape"]

    var body: some View {
        Form {
            Section("基础 Picker") {
                Picker("选择颜色", selection: $selectedColor) {
                    ForEach(colors, id: \.self) { color in
                        Text(color)
                    }
                }
                Text("选择了: \(selectedColor)")
                    .foregroundColor(.secondary)
            }

            Section("SegmentedPickerStyle 分段控制器") {
                Picker("选择水果", selection: $selectedIndex) {
                    ForEach(0..<fruits.count, id: \.self) { index in
                        Text(fruits[index])
                    }
                }
                .pickerStyle(.segmented)

                Text("选择了: \(fruits[selectedIndex])")
                    .foregroundColor(.secondary)
            }

            Section("Menu 样式") {
                Picker("选择颜色", selection: $selectedColor) {
                    ForEach(colors, id: \.self) { color in
                        Text(color)
                    }
                }
                .pickerStyle(.menu)

                Picker("选择颜色", selection: $selectedColor) {
                    ForEach(colors, id: \.self) { color in
                        HStack {
                            Circle()
                                .fill(colorForName(color))
                                .frame(width: 12, height: 12)
                            Text(color)
                        }
                    }
                }
                .pickerStyle(.menu)
            }

            Section("PopUpButton 样式") {
                Picker("选择水果", selection: $selectedIndex) {
                    ForEach(0..<fruits.count, id: \.self) { index in
                        Text(fruits[index])
                    }
                }
                .pickerStyle(.menu)
            }

            Section("DatePicker 日期选择") {
                DatePicker(
                    "选择日期",
                    selection: $selectedDate,
                    displayedComponents: [.date, .hourAndMinute]
                )

                Text("选择的日期: \(selectedDate.formatted())")
                    .foregroundColor(.secondary)
            }
        }
        .formStyle(.grouped)
        .padding()
    }

    func colorForName(_ name: String) -> Color {
        switch name {
        case "Red": return .red
        case "Blue": return .blue
        case "Green": return .green
        case "Yellow": return .yellow
        default: return .gray
        }
    }
}
