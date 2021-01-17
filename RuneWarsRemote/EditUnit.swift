//
//  AddUnit.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 8/6/20.
//

import SwiftUI

struct EditUnit: View {
    var armyIndex: Int
    @Binding var isPresented: Bool

    @EnvironmentObject var store: ArmyStore

    @State var selectedType: Int = 0
    @State var unitName: String = ""
    @State var unitSize: String = ""
    @State var unitNotes: String = ""

    
    var body: some View
    {

        VStack(alignment: .leading)
        {
            Text("Edit Unit").font(.title)
            
            Picker("Type", selection: $selectedType)
            {
                 
                 ForEach(unitData)
                 {
                 unit in
                     Text(String(unit.name)).tag(unit.id)
                 }
            }
            .pickerStyle(WheelPickerStyle())
            
            HStack
            {
                Text("Name").bold()
                    .frame(width:100)
                Divider()
                TextField("Unit Name", text: $unitName)
            }
            .frame(height:40)

            
            HStack
            {
                Text("Size").bold()
                    .frame(width:100)
                Divider()
                TextField("2x2", text: $unitSize)
            }
            .frame(height:40)

            
            HStack
            {
                Text("Notes").bold()
                    .frame(width:100)
                Divider()
                TextField("Notes", text: $unitNotes)
            }
            .frame(height:40)

            HStack
            {
                Button("Save", action: {
                    saveUnit()
                    self.isPresented=false
                })
                Spacer()
                Button("Cancel", action: {
                    //saveUnit()
                    self.isPresented=false
                })
                
            }
            
            Spacer()
           
        }
        .frame(width:400)
        .onAppear(perform: {setUnit()})
    }
   
    func setUnit()
    {
        selectedType = store.army[armyIndex].unitID
        unitName = store.army[armyIndex].name
        unitSize = store.army[armyIndex].size
        unitNotes = store.army[armyIndex].notes
        
    }
    
    func saveUnit()
    {
        
        //store.army.append(ArmyUnit(unitID: $selectedType, name: $unitName, //size: $unitSize, notes: $unitNotes))
        store.army[armyIndex].unitID = selectedType
        store.army[armyIndex].name = unitName
        store.army[armyIndex].size = unitSize
        store.army[armyIndex].notes = unitNotes
        
        store.saveArmy()
   //     store.army.append(ArmyUnit(unitID: 1000, name: "New spears", size: "2x2", notes: "From new button"))
        

    }
}



struct EditUnit_Previews: PreviewProvider {
    static var previews: some View {
        //EditUnit()
        Text("Preview")
    }
}
