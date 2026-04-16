import SwiftUI

struct FocusableView: View {
    @FocusState private var isFocused: Bool
    @State private var numberOfReturnKeyPressed: Int = 0

    var body: some View {
        VStack {
            Text("isFocued: \(isFocused ? "true" : "false")")
                .padding()
            Text("Return Key Pressed Count: \(numberOfReturnKeyPressed)")
                .padding()
        }
        .focusable(true, interactions: .edit)
        .focused($isFocused)
        .onKeyPress(
            keys: [.return], phases: .down,
            action: { (keyPress: KeyPress) -> KeyPress.Result in
                if !keyPress.modifiers.isDisjoint(with: [.control, .command, .option, .shift]) {
                    return .ignored
                }
                numberOfReturnKeyPressed += 1
                return .handled
            }
        )
        .onTapGesture {
            isFocused = !isFocused
        }
        .onAppear {
            isFocused = true
        }
    }
}

@main
struct BrokenSwiftUIMenuApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                FocusableView()
                    .padding()
                    .border(.red)

                Menu {
                    Text("Menu Content")
                } label: {
                    Text("Open Menu (Keyboard will appear)")
                }
                .padding()
            }
        }
    }
}
