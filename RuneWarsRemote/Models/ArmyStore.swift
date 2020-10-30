//
//  ArmyStore.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/18/20.
//

import Foundation

class ArmyStore: ObservableObject {
    
    @Published var army: [ArmyUnit] = []
    
    init(army: [ArmyUnit] = [])
    {
        self.army = army
    }
    
    func loadSavedArmy()
    {
        print("loadSavedArmy")
        let fm = FileManager.default
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let subUrl = documentDirectory.appendingPathComponent("savedArmy.json")
            loadFile(location: subUrl)
        } catch {
            print(error)
        }
        
        //store.army =  load("savedArmy.json")
    }
    
    func loadFile(location: URL)
    {
        let fm = FileManager.default
        if fm.fileExists(atPath: location.path)
        {
            decodeData(pathName: location)
           // self.tableView.reloadData()
        }
    }
    
    func decodeData(pathName: URL){
            do{
                let jsonData = try Data(contentsOf: pathName)
                let decoder = JSONDecoder()
                self.army = try decoder.decode([ArmyUnit].self, from: jsonData)
            } catch {}
        }
    
    func saveArmy()
    {
        print("saveArmy")

        let fm = FileManager.default
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let subUrl = documentDirectory.appendingPathComponent("savedArmy.json")
            writeToFile(location: subUrl)
        } catch {
            print(error)
        }
        
        //store.army =  load("savedArmy.json")
    }
    
    
    func writeToFile(location: URL) {
            do{
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                let JsonData = try encoder.encode(self.army)
                try JsonData.write(to: location)
            }catch{}
        }
}

let testStore = ArmyStore(army: testData)
