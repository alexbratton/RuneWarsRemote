//
//  ArmyUnitRow.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/27/20.
//

import SwiftUI

struct ArmyUnitRow: View {
    var armyIndex: Int
    @EnvironmentObject var store: ArmyStore


   // @Binding var armyUnit: ArmyUnit
    @State private var sent=false
    @State private var showingAlert=false
    @State var showingDetail = false
    @State var showingEdit = false
    @State var leftOrder:Int=0
    @State var rightOrder:Int=0
    @State var turnReady = false
    


    
    var body: some View {
        
        VStack (alignment: .leading)
        {
            
            var armycount=store.army.count
            if (armyIndex>=(armycount))
            {
                Text("BLANK")
            }
            else
            {
                HStack (alignment: .top)
                {
                    ZStack
                    {
                        store.army[armyIndex].unit.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:120)
                        Text("["+store.army[armyIndex].size+"]")
                            .font(.callout)
                            .bold()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .offset(x: 0, y:50)
                    }
                    VStack (alignment: .leading)
                    {
                        
                        HStack
                        {
                            Text(store.army[armyIndex].unit.name)
                                .font(.title)
                                .bold()
                            if (store.army[armyIndex].unitID != 111)
                            {
                            Image(systemName: "info.circle").foregroundColor(.blue)
                                .onTapGesture {
                                    showingDetail.toggle()
                                }
                                .sheet(isPresented: $showingDetail)
                                {
                                    UnitOverview(unit: store.army[armyIndex].unit, isPresented: self.$showingDetail)
                                }
                            }
                            Image(systemName: "pencil").foregroundColor(.blue)
                                .onTapGesture {
                                    showingEdit.toggle()
                                }
                                .sheet(isPresented: $showingEdit)
                                {
                                    EditUnit(armyIndex: armyIndex, isPresented: self.$showingEdit)
                                        .environmentObject(self.store)
                                }
                        }
                        Text(store.army[armyIndex].name)
                            .font(.title2)
                            .bold()
                        Text(store.army[armyIndex].notes)
                            .font(.footnote)
                    }
                }
               
                HStack
                {
                    Image(systemName: "chevron.right.circle")
                        .font(Font.system(.largeTitle))
                        .rotationEffect(.degrees(sent ? 90 : -90))
                        .foregroundColor((sent || ((leftOrder==0) || (rightOrder==0)) ) ? Color.gray : Color.blue)
                        .animation(.spring())
                        .onTapGesture {
                            if ((leftOrder>0) && (rightOrder>0))
                            {
                                if (!sent)
                                {
                                    showingAlert=true
                                }
                                else
                                {
                                    leftOrder=0
                                    rightOrder=0
                                }
                                sent.toggle()
                            }
                            
                        }
                        .alert(isPresented: $showingAlert)
                        {
                            Alert(title: Text(store.army[armyIndex].name+" order -> chat"),
                                  message: Text("Left: \(leftOrder) Right: \(rightOrder)"))
                        }
                    VStack (alignment: .center, spacing: 0.0)
                    {
                        OrderSelector(commandDial: store.army[armyIndex].unit.leftDial, orderSelection: $leftOrder)
                        OrderSelector(commandDial: store.army[armyIndex].unit.rightDial, orderSelection: $rightOrder)
                    }
                }
            }
        }
        
    }
                
}
    

struct ArmyUnitRow_Previews: PreviewProvider {
    static var previews: some View {
      //  ArmyUnitRow(armyUnit: ArmyUnit(unitID: 1000, name: "Spears1", size: "2x2",notes: "These are lots of notes\n\nand here too"))
            //.previewLayout(.fixed(width:500, height:250))
        Text("Preview")
    }
}


