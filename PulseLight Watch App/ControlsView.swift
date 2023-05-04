//
//  ControlsView.swift
//  PulseLight Watch App
//
//  Created by Axel Bauer on 15.03.23.
//

import SwiftUI

struct ControlsView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            /*NavigationLink {
                StartView()
            } label: {
                Image(systemName: "xmark")
            }.font(.title2)
                .tint(Color.red)
                .padding(.vertical, 20)*/
            
            VStack {
                    Button{
                        workoutManager.endWorkout()
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }.font(.title2)
                        .tint(Color.red)
                        .padding(.vertical, 20)
            }
            
            
            VStack {
                Button {
                    workoutManager.togglePause()
                } label: {
                    Image(systemName: workoutManager.running ? "pause" : "play")
                }.tint(.yellow)
                    .font(.title2)
            }
        }
        
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
