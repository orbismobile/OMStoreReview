import Foundation
import StoreKit

/** Class to control the number of touches before to show the review modal */

public final class OMStoreReview {
    let userDefaults = UserDefaults()
    let store = UserDefaults.standard
    let keyStorage = "numberOfRuns"

    /**
     The number of times to be counted before showing the review modal
     */
    public var minimumRunCount: Int = 3

    /**
     Init method
     */
    public init(){}

    /**
     Use this method where would you like register the touches before to show the review modal
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
     Reset the counter
     */
    public func resetRun(){
        store.setValuesForKeys([keyStorage: 1])
        store.synchronize()
    }

    private func incrementRun (){
        let currentRun = getRunCounts() + 1
        store.setValuesForKeys([keyStorage: currentRun])
        store.synchronize()
    }

    private func getRunCounts () -> Int{
        if (store.object(forKey: keyStorage) != nil){
            let currentRuns = store.value(forKey: keyStorage)
            return currentRuns as! Int
        } else {
            return 1
        }
    }
}

