//
//  SessionPagingView.swift
//  PulseLight Watch App
//
//  Created by Axel Bauer on 15.03.23.
//

import SwiftUI

struct SessionPagingView: View {
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @EnvironmentObject var workoutManager: WorkoutManager
    @State private var selection: Tab = .workout
    var displayType: DisplayType
    
    enum Tab {
        //case controls, metrics
        case controls, workout
    }
    
    var body: some View {
        TabView(selection: $selection){
            ControlsView().tag(Tab.controls)
            WorkoutView(displayType: displayType).tag(Tab.workout)
        }.onChange(of: workoutManager.running) {_ in displayMetricsView()}
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic))
            .onChange(of: isLuminanceReduced) { _ in displayMetricsView()
            }.onAppear{
                workoutManager.startWorkout()
            }        
    }
    private func displayMetricsView() {
        withAnimation {
            selection = .workout
        }
    }
}



struct SessionPagingView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPagingView(displayType: .color)
    }
}
