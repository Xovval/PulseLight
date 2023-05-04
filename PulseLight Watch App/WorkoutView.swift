//
//  WorkoutView.swift
//  PulseLight Watch App
//
//  Created by Axel Bauer on 15.03.23.
//

import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var displayType: DisplayType
    
    var body: some View {
        VStack{
            if (displayType == .color){
                ColorView()

            } else if (displayType == .colorText){
                ColorTextView()
            } else if (displayType == .metrics){
                MetricsView()
            }
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(displayType: .color)
    }
}
