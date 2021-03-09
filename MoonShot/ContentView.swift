//
//  ContentView.swift
//  MoonShot
//
//  Created by Chepkorir Lang'at on 02/03/2021.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missons: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showCrew = false
    
    var body: some View {
        NavigationView {
            List(missons) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if self.showCrew {
                            Text(mission.crewMembers)
                        } else {
                            Text(mission.formattedLaunchDate)
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                                    Button(showCrew ? "Show Dates" : "Show Crew") {
                                        self.showCrew.toggle()
                                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
