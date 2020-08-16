//
//  OrderSelector.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/24/20.
//

import SwiftUI

struct OrderSelector: View {
    var commandDial: CommandDial
    @Binding var orderSelection:Int
    
    var body: some View {
        HStack(spacing: 0.0) {
            OrderView(unitOrder: commandDial.order1)
                .padding( 0.0)
                .onTapGesture {
                    orderSelection=1
                }
                .background((orderSelection==1) ? Color.yellow : Color.white)
            OrderView(unitOrder: commandDial.order2)
                .padding( 0.0)
                .onTapGesture {
                    orderSelection=2
                }
                .background((orderSelection==2) ? Color.yellow : Color.white)
            OrderView(unitOrder: commandDial.order3)
                .padding( 0.0)
                .onTapGesture {
                    orderSelection=3
                }
                .background((orderSelection==3) ? Color.yellow : Color.white)
            OrderView(unitOrder: commandDial.order4)
                .padding( 0.0)
                .onTapGesture {
                    orderSelection=4
                }
                .background((orderSelection==4) ? Color.yellow : Color.white)
            OrderView(unitOrder: commandDial.order5)
                .padding( 0.0)
                .onTapGesture {
                    orderSelection=5
                }
                .background((orderSelection==5) ? Color.yellow : Color.white)
            OrderView(unitOrder: commandDial.order6)
                .padding( 0.0)
                .onTapGesture {
                    orderSelection=6
                }
                .background((orderSelection==6) ? Color.yellow : Color.white)
            OrderView(unitOrder: commandDial.order7)
                .padding( 0.0)
                .onTapGesture {
                    orderSelection=7
                }
                .background((orderSelection==7) ? Color.yellow : Color.white)
            OrderView(unitOrder: commandDial.order8)
                .padding( 0.0)
                .onTapGesture {
                    orderSelection=8
                }
                .background((orderSelection==8) ? Color.yellow : Color.white)
        }
    }
}

struct OrderSelector_Previews: PreviewProvider {
    
    static var previews: some View {
        Text("Order select")
     //   OrderSelector(commandDial: unitData[0].leftDial,orderSelection: $tmpOrder)
    }
}
