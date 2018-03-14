import Foundation
import StoreKit

/** Class to control the number of touches before to show the ReviewModal */

public final class OMStoreReview {
    let keyStorage = "numberOfRuns"

    /**
     Set the minimun number to count for to know when show the ReviewModal
     */
    public var minimumRunCount: Int = 3

    /**
     Init method
     */
    public init(){}

    /**
     Use this method where do you register the touch for show the ReviewModal
     */
    public func request(){
        let currentNumber = getRunCounts()
        if #available(iOS 10.3, *) {
            incrementRun()
            if ( currentNumber == minimumRunCount ){
                SKStoreReviewController.requestReview()
            }
        } else {
            print("SKStoreReviewController is not available")
        }
    }

    /**
     Reset the count
     */
    public func resetRun(){
        let userDefaults = UserDefaults()
        userDefaults.setValuesForKeys([keyStorage: 1])
        userDefaults.synchronize()
    }

    private func incrementRun (){
        let userDefaults = UserDefaults()
        let currentRun = getRunCounts() + 1
        userDefaults.setValuesForKeys([keyStorage: currentRun])
        userDefaults.synchronize()
    }

    private func getRunCounts () -> Int{
        let userDefaults = UserDefaults()
        let currentRuns = userDefaults.value(forKey: keyStorage)
        var defaultRun = 1
        if (currentRuns != nil){
            defaultRun = currentRuns as! Int
        }
        return defaultRun
    }
}

