//
//  TurnUnitRow.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/17/20.
//

import SwiftUI

struct TurnUnitRow: View {
    var armyUnit: ArmyUnit
    
    var body: some View {
        
        VStack (alignment: .leading)
        {
            HStack (alignment: .center, spacing: 0.0)
            {
                Image(systemName: "checkmark.circle")
                    .font(Font.system(.largeTitle).bold())
                    .foregroundColor(.red)
                armyUnit.unit.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:104)
                VStack (alignment: .leading, spacing: 0.0)
                {
                    OrderView(unitOrder: armyUnit.selectedLeftOrder)
                    OrderView(unitOrder: armyUnit.selectedRightOrder)
                }
                VStack (alignment: .leading)
                {

                        Text(armyUnit.name)
                            .font(.title2)
                            .bold()
                

                    Text(armyUnit.notes)
                        .font(.footnote)
                }
                
            }

                
        }
    }
        
        
}

struct TurnUnitRow_Previews: PreviewProvider {
    static var previews: some View {
        TurnUnitRow(armyUnit: ArmyUnit(unitID: 1000, name: "Spears1", size: "2x2",notes: "These are lots of notes\n\nand here too"))
    }
}
