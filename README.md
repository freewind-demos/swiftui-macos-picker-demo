# SwiftUI macOS Picker 选择器

## 简介

演示 SwiftUI 中 Picker 各种用法，包括分段控制器、菜单样式、日期选择等。

## 快速开始

```bash
cd swiftui-macos-picker-demo
xcodegen generate
open SwiftUIPickerDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 基础 Picker

```swift
@State private var selected = "A"

Picker("选择", selection: $selected) {
    Text("选项 A")
    Text("选项 B")
    Text("选项 C")
}
```

### Segmented 分段控制器

```swift
Picker("水果", selection: $selectedIndex) {
    ForEach(0..<fruits.count, id: \.self) { index in
        Text(fruits[index])
    }
}
.pickerStyle(.segmented)
```

### Menu 菜单样式

```swift
Picker("选择", selection: $selected) {
    ForEach(options, id: \.self) { option in
        Text(option)
    }
}
.pickerStyle(.menu)
```

### DatePicker 日期选择

```swift
@State private var date = Date()

DatePicker(
    "选择日期",
    selection: $date,
    displayedComponents: [.date, .hourAndMinute]
)
```

`displayedComponents` 可以是：
- `.date` - 只显示日期
- `.hourAndMinute` - 只显示时间
- `[.date, .hourAndMinute]` - 显示日期和时间

## 完整示例

```swift
struct ContentView: View {
    @State private var selectedColor = "Red"
    let colors = ["Red", "Blue", "Green"]

    var body: some View {
        Form {
            Picker("选择颜色", selection: $selectedColor) {
                ForEach(colors, id: \.self) { color in
                    Text(color)
                }
            }
        }
    }
}
```

## 完整讲解（中文）

### Picker 工作原理

Picker 需要：
1. `selection` - 绑定的选中值
2. `content` - 选项内容，使用 ForEach 或直接放 Text

### 选择器样式

macOS 支持多种 Picker 样式：

| 样式 | 特点 |
|------|------|
| `.segmented` | 分段控制器，适合少量选项 |
| `.menu` | 下拉菜单 |
| `.popUpButton` | 弹出按钮 |
| `.radioGroup` | 单选按钮组 |

### DatePicker

DatePicker 是专门用于日期/时间选择的组件：
- 自动处理日期格式
- 支持日期范围限制
- 可以只选择日期、只选择时间，或两者都选
