//
//  PulseLightApp.swift
//  PulseLight Watch App
//
//  Created by Axel Bauer on 06.03.23.
//

import SwiftUI

@main
struct PulseLight_Watch_AppApp: App {
    @StateObject var workoutManager = WorkoutManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
            }
            .sheet(isPresented: $workoutManager.showingSummaryView) {
                SummaryView()
            }
            .environmentObject(workoutManager)

        }
    }
}
