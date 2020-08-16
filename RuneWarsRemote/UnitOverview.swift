//
//  UnitOverview.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/23/20.
//

import SwiftUI

struct UnitOverview: View {
    var unit: Unit
    @Binding var isPresented: Bool

    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(unit.name)
                .font(.title2)
                .bold()

            HStack {
                /*
                unit.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100)
 */
            //Spacer()
                unit.commandImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
            //Spacer()

            //OrderSelector(commandDial: unit.leftDial)
            //OrderSelector(commandDial: unit.rightDial)
            //Spacer()
            unit.cardImage
                .resizable()
                .aspectRatio(contentMode: .fit)
           // Spacer()
            Button("Done", action: {
                self.isPresented=false
            })
        }
        .navigationBarTitle(Text(unit.name),displayMode: .inline)
        
    }
   
    

}

struct UnitOverview_Previews: PreviewProvider {
    static var previews: some View {
       Text("Preview")// UnitOverview(unit: unitData[1])
    }
}
