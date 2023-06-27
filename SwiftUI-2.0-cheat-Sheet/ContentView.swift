//
//  ContentView.swift
//  SwiftUI-2.0-cheat-Sheet
//
//  Created by Apple on 2023/6/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputText:String = ""
    
    
    var body: some View {

        VStack {
            var now = Date()
            Text("Task due date: \(now,formatter: Self.dateFormatter)")
                .font(.custom("Helvetica Neue", size: 20))
                .foregroundColor(Color.green)
                .lineSpacing(0)//文本行之间的间距50
                .lineLimit(1)//文本行数限制
                .padding()
            
            //
            Label("SwiftUI CheatSheet 2.0",systemImage: "pencil.circle.fill")
            Link("Click me",destination: URL(string: "www.baidu.com")!)
            //灵活设置文字图标的方法
            Label {
                Text("SwiftUI CheatSheet 2.0")
                    .font(.system(size: 20))
                    .fontWeight(.bold)//设置文本的字重，可以设定为 .light, .regular, .medium, .semibold, .bold, .heavy, 或者 .black
                    .foregroundColor(.blue)//设置文本的颜色
                    .multilineTextAlignment(.center)//设置多行文本的对齐方式。可以设置为 .leading, .trailing, 或者 .center。
                    .lineLimit(3)
                    .truncationMode(.tail)//设置文本被截断时的方式，可以设置为 .head, .tail, 或 .middle。
                    .padding()
                    .lineSpacing(10)// 设置文本行之间的间距。
            } icon: {
                Image(systemName: "pencil.circle.fill")
                    .resizable()//使图标可以调整大小
                    .frame(width: 20,height: 20)
            }
            
            Text("Please input some text:")
                .font(.headline)
            TextEditor(text: $inputText)
                .border(Color.gray,width: 0.5)
            Text("You entered: \(inputText)")
        }
        .padding()
    }
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
   
}

// 1. 创建一个ViewModifier
struct DismissKeyboardOnReturn: ViewModifier {
    func body(content: Content) -> some View {
        content
            .introspectTextField { textField in
                let keyCommand = UIKeyCommand((UIKeyCommand.inputReturn),
                                              action: #selector(UIResponder.resignFirstResponder))
                textField.addKeyCommand(keyCommand)
            }
    }
}


extension View {
    
    func dismissKeyboardOnReturn() -> some View {
        
        self.modifier(dismissKeyboardOnReturn())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
