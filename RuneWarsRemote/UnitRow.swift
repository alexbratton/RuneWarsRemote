//
//  UnitRow.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/23/20.
//

import SwiftUI

struct UnitRow: View {
    var unit: Unit
    var body: some View {
        HStack {
            unit.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:60)
            Text(unit.name)
                .font(.title2)
            Spacer()
        }
    }
}

struct UnitRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        UnitRow(unit:unitData[0])
        UnitRow(unit:unitData[1])
        }
        .previewLayout(.fixed(width:300, height:100))
    }
}
