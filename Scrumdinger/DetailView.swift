//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Tonderai Saidi on 2021/08/09.
//

import SwiftUI

struct DetailView: View {
    @State private var isPresented = false
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    @Binding var scrum: DailyScrum
    var body: some View {
        List{
            Section(header: Text("Meeting Details")){
                NavigationLink(destination: MeetingView()){
                    Label(
                        title: { Text("Start Meeting") },
                        icon: { Image(systemName: "timer") }
                    )
                    .accessibilityLabel("Start Meeting")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                }
                HStack{
                    Label("Length", systemImage: "timer")
                        .accessibilityLabel("Meeting Length")
                    Spacer()
                    Text("\(scrum.lengthInMinutes)")
                }
                HStack{
                    Label("Color", systemImage: "paintpalette")
                        .accessibilityLabel("Color")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees, id: \.self){attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Attendees"))
                        .accessibilityValue(attendee)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(leading: Button("Edit"){
            isPresented =  true
            data = scrum.data
        })
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented){
            NavigationView{
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel"){
                        isPresented = false
                    },trailing: Button("Done"){
                        isPresented = true
                        scrum.update(from: data)
                    })
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}
