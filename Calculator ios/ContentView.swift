//
//  ContentView.swift
//  Calculator ios
//
//  Created by Vaidik Dubey on 14/02/24.
//

import SwiftUI

enum CalcButton: String 
{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case decimal = "."
    case percentage = "%"
    case equal = "="
    case clear = "AC"
    case negative = "-/+"
    
    var buttonColor : Color{
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear, .negative , .percentage :
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0,alpha:1 ))
        }
    }
}

struct ContentView: View 
{
    @State var value = "0"
    let buttons: [[CalcButton]] = [
        [.clear , .negative, .percentage , .divide ],
        [.seven , .eight, .nine ,.subtract ],
        [.four , .five, .six ,.multiply ],
        [.one , .two, .three , .add],
        [.zero , .decimal, .equal ],
    ]
    var body: some View
    {
        ZStack
        {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack
            {
                Spacer()
                //test display
                HStack
                {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                 
                //our buttona
                ForEach(buttons, id : \.self ) { row in
                    HStack(spacing:12)
                    {
                        ForEach(row , id: \.self.rawValue ) { item in
                            Button(action :
                                    {
                                self.didTap(button: item)
                                
                            }, label :
                                    {
                                Text(item.rawValue)
                                    .font(.system(size:32))
                                    .frame(
                                        width : self.buttonWidth(item: item),
                                                                
                                        height : self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius( self.buttonWidth(item:item) / 2)
                                
                            }
                            )
                            
                        }
                    }
                    .padding(.bottom,  3)
                }
                
            }
            
        }
        
    }
    
    func didTap(button:CalcButton) {
        switch button{
        case .add,.subtract, .divide, .multiply, .equal:
            break
        case .clear:
            break
        case .decimal, .negative, .percentage:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
                
                
            }
        }
        
    }
    func buttonWidth(item:CalcButton)-> CGFloat{
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}
#Preview {
    ContentView()
}


