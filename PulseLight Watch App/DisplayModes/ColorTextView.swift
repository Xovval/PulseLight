//
//  ColorTextView.swift
//  PulseLight Watch App
//
//  Created by Axel Bauer on 02.05.23.
//

import SwiftUI

struct ColorTextView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @State private var bg: Color = Color(hue: 0, saturation: 0, brightness: 0) //0.6 < i < 0

    let lowerLimit: Double = 120
    let upperLimit: Double = 190
    
    var body: some View {
        /*Text(workoutManager.heartRate.formatted(.number.precision(.fractionLength(0))) + " bpm").foregroundColor(Color(hue: calcColorFromBPM(bpm: workoutManager.heartRate), saturation: 1, brightness: 1))*/
        VStack {
            /*Text("120").foregroundColor(Color(hue: calcColorFromBPM(bpm: 120), saturation: 1, brightness: 1)).font(.system(size: 80))*/
            Text(workoutManager.heartRate.formatted(.number.precision(.fractionLength(0))) )
                .foregroundColor(Color.white)
                .colorMultiply(bg)
                .onChange(of: workoutManager.heartRate) { newValue in
                    withAnimation(.easeInOut(duration: 1)) {
                        self.bg = calcColorFromBPM(bpm: workoutManager.heartRate)
                    }
                }.font(.system(size: 80))
            Text("bpm").font(.system(size: 30))
        }
    }
    
    private func calcColorFromBPM(bpm: Double) -> Color {
        
        if (bpm < lowerLimit) {
            return Color(hue: 0.6, saturation: 1, brightness: 1)
        } else if (bpm>upperLimit) {
            return Color(hue: 0, saturation: 1, brightness: 1)
        } else {
            return Color(hue: map(minRange: lowerLimit, maxRange: upperLimit, minDomain: 0.6, maxDomain: 0, value: bpm), saturation: 1, brightness: 1)
        }
    }
    
    private func map(minRange:Double, maxRange:Double, minDomain:Double, maxDomain:Double, value:Double) -> Double {
        return minDomain + (maxDomain - minDomain) * (value - minRange) / (maxRange - minRange)
    }
}

struct ColorTextView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTextView()
    }
}
