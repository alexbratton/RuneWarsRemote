//
//  DiceView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/29/20.
//

import SwiftUI

struct DiceView: View {
    var body: some View {
        HStack
        {
            orderTypeData[8].image
            orderTypeData[9].image
            orderTypeData[9].image
            orderTypeData[18].image
            orderTypeData[26].image
        }
        .frame(height:200)

        
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
