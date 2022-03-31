//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Tonderai Saidi on 2021/08/08.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        List{
            ForEach(scrums){ scrum in
                NavigationLink(destination: DetailView(scrum: binding(for: scrum))){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Image(systemName: "plus")
        })
    }
    
    
    private func binding(for scrum: DailyScrum) ->Binding<DailyScrum>{
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
            fatalError("cannot find scrum in array")
        }
        return $scrums[scrumIndex]
    }

}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
}
