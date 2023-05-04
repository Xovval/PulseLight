/*import HealthKit

class WorkoutSessionDelegate: NSObject, HKWorkoutSessionDelegate {
    
    let healthStore = HKHealthStore()
    let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
    var workoutSession: HKWorkoutSession?
    
    func startWorkoutSession() {
        let workoutConfiguration = HKWorkoutConfiguration()
        workoutConfiguration.activityType = .other
        workoutConfiguration.locationType = .indoor
        
        do {
            workoutSession = try HKWorkoutSession(configuration: workoutConfiguration)
            workoutSession?.delegate = self
            //healthStore.start(workoutSession!)
            HKWorkoutSession.startActivity()
        } catch {
            // Handle error
            print(error.localizedDescription)
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        // Handle error
        print(error.localizedDescription)
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didGenerate event: HKWorkoutEvent) {
        // Handle workout events
        print(event)
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        // Handle workout state changes
        print(toState)
        
        switch toState {
        case .running:
            startHeartRateUpdates()
        case .ended, .paused, .stopped:
            endHeartRateUpdates()
        default:
            break
        }
    }
    
    func startHeartRateUpdates() {
        let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate)
        let query = HKObserverQuery(sampleType: sampleType!, predicate: nil) { [weak self] (query, completionHandler, error) in
            guard let self = self else {
                return
            }
            self.fetchLatestHeartRateSample(completionHandler: completionHandler)
        }
        healthStore.execute(query)
    }
    
    func fetchLatestHeartRateSample(completionHandler: @escaping (HKObserverQueryCompletionHandler) -> Void) {
        let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: sampleType!, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let sample = samples?.first as? HKQuantitySample else {
                return
            }
            let heartRateUnit = HKUnit(from: "count/min")
            let heartRate = sample.quantity.doubleValue(for: heartRateUnit)
            DispatchQueue.main.async {
                // Update UI with heart rate data
                self.updateHeartRateLabel(value: heartRate)
            }
        }
        healthStore.execute(query)
    }
    
    func endHeartRateUpdates() {
        healthStore.stopAllActiveWorkouts()
    }
    
    func updateHeartRateLabel(value: Double) {
        // Update UI with heart rate data
        print("Heart rate: \(value) bpm")
    }
}
*/
