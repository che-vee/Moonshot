//
//  AstronautView.swift
//  MoonShot
//
//  Created by Chepkorir Lang'at on 04/03/2021.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                    
                    Text("Missions:")
                        .font(.headline)
                    
                    HStack{
                        ForEach(self.missions, id: \.id) { mission in
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: geometry.size.width * 0.25)
                                    .padding(.top)
                                                    
                                Text(mission.displayName)
                                    .font(.system(size: 16.0))
                            }
                            .padding(.horizontal)
                        }
                       
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
        self.astronaut = astronaut
        
        var matches = [Mission]()
           
        for mission in missions {
            if mission.crew.first(where: { $0.name == astronaut.id }) != nil {
            matches.append(mission)
            }
        }
           
        self.missions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
