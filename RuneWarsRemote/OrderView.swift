//
//  OrderView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/24/20.
//

import SwiftUI


struct OrderView: View {
    var unitOrder: UnitOrder
    
    var viewColor: Color {
        switch unitOrder.color
        {
        case OrderColor.blue:
            return Color.blue
        case OrderColor.yellow:
            return Color.yellow
        case OrderColor.red:
            return Color.red
        case OrderColor.green:
            return Color.green
        default:
            return Color.white
        }
    }
    
    var body: some View {
      
        VStack (alignment: .center) {
            if (unitOrder.initiative>0)
            {
                Text(String(unitOrder.initiative))
                    .font(.body)
                    .fontWeight(.bold)
                    .offset(x:0, y:10)
                unitOrder.orderType.image
                    .resizable()
                    .frame(width:36, height:36)
                    .background(viewColor)
                    
            }
            else
            {
                unitOrder.orderType.image
                    .resizable()
                    .frame(width:36, height:36)
                    .background(viewColor)
                    .padding(.bottom)
            }
        }
        .border(Color.gray)
//        .frame(width:36, height:64)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        Group
        {
            OrderView(unitOrder: unitData[0].leftDial.order1)
            OrderView(unitOrder: unitData[0].rightDial.order1)
        }
    }
}
