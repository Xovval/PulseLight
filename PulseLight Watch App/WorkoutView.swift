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
    
    //study code
    @State private var fakeBPM: Double = 80
    @State private var bpmArray: [Double] = []
    private let low: Double = 140
    private let middle: Double = 170
    private let high: Double = 190
    
    var body: some View {
        VStack{
            if (displayType == .color){
                ColorView(bpm: $fakeBPM)
                
            } else if (displayType == .colorText){
                ColorTextView(bpm: $fakeBPM)
            } else if (displayType == .metrics){
                MetricsView(bpm: $fakeBPM)
            }
        }.ignoresSafeArea(edges: .bottom)
        .onAppear {
            generateFakeBPMs()
        }
        .onChange(of: workoutManager.heartRate){newValue in
            fetchFakeBPM()
        }
    }
    
    //study code
    func generateFakeBPMs() {
        bpmArray =
        [high, middle, low, middle]
        //Add some more possible variations here
        //Add random choice of said variations
    }

    func fetchFakeBPM() {
        let elapsedTimeInterval = workoutManager.builder?.elapsedTime(at: Date())
        let elapsedTime = elapsedTimeInterval?.magnitude ?? 0
        
            if (elapsedTime < 50) {
                fakeBPM = bpmArray[0]
            } else if (elapsedTime > 50 && elapsedTime < 80) {
                fakeBPM = bpmArray[1]
            } else if (elapsedTime > 80 && elapsedTime < 110) {
                fakeBPM = bpmArray[2]
            } else {
                fakeBPM = bpmArray[3]
            }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(displayType: .color)
    }
}
