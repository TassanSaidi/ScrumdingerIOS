//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Tonderai Saidi on 2021/08/06.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums =  DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
