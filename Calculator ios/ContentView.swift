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
    
}

struct ContentView: View 
{
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
                //test display
                HStack
                {
                    Spacer()
                    Text("0")
                        .bold()
                        .font(.system(size: 64))
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
                                
                            }, label :
                                    {
                                Text(item.rawValue)
                                    .font(.system(size:32))
                                    .frame(
                                        width : self.buttonWidth(item: item),
                                                                
                                        height : self.buttonHeight()
                                    )
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                                
                            }
                            )
                            
                        }
                    }
                    .padding(.bottom,  3)
                }
                
            }
            
        }
        
    }
    func buttonWidth(item:CalcButton)-> CGFloat{
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}
#Preview {
    ContentView()
}


