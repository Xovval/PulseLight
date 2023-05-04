/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The start view.
*/

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var workoutTypes: [HKWorkoutActivityType] = [.running]
    var displayTypes: [DisplayType] = [.metrics, .color, .colorText]
    
    var body: some View {
            List(displayTypes){type in
                NavigationLink(type.rawValue) {
                    SessionPagingView(displayType: type)
                }.padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
                
                /*NavigationLink(type.rawValue, destination: SessionPagingView(displayType: type).navigationBarBackButtonHidden(true),
                               tag: .running, selection: $workoutManager.selectedWorkout)*/
            }
        .listStyle(.carousel)
        .navigationBarTitle("Display modes")
        .onAppear {
            workoutManager.requestAuthorization()
            if (workoutManager.running) {
                workoutManager.endWorkout()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().environmentObject(WorkoutManager())
    }
}
