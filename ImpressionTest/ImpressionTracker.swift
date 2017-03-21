//
//  Copyright © 2017 Vijaya Prakash Kandel. All rights reserved.
//

import UIKit
import QuartzCore

protocol ViewTracker {

    init(delegate: TrackableView)
    func start()
    func pause()
    func stop()
    
}


final class ImpressionTracker: ViewTracker {

    private weak var viewToTrack: TrackableView?
    private var timer: CADisplayLink?
    private var startedTimeStamp: CFTimeInterval = 0
    private var endTimeStamp: CFTimeInterval = 0

    init(delegate: TrackableView) {
        viewToTrack = delegate
        setupTimer()
    }

    func setupTimer() {
        timer = (viewToTrack as? UIView)?.window?.screen.displayLink(withTarget: self, selector: #selector(update))
        timer?.add(to: RunLoop.main, forMode: .defaultRunLoopMode)
        timer?.isPaused = true
    }

    func start() {
        guard viewToTrack != nil else { return }
        timer?.isPaused = false
        startedTimeStamp = CACurrentMediaTime()
    }

    func pause() {
        guard viewToTrack != nil else { return }
        timer?.isPaused = true
        endTimeStamp = CACurrentMediaTime()
    }

    func stop() {
        timer?.isPaused = true
        timer?.invalidate()
    }

    @objc func update() {
        guard let viewToTrack = viewToTrack else {
            stop()
            return
        }

        guard viewToTrack.precondition() else {
            startedTimeStamp = 0
            endTimeStamp = 0
            return
        }

        endTimeStamp = CACurrentMediaTime()
        trackIfThresholdCrossed()
    }

    private func trackIfThresholdCrossed() {
        guard let viewToTrack = viewToTrack else { return }
        let elapsedTime = endTimeStamp - startedTimeStamp
        if  elapsedTime >= viewToTrack.thresholdTimeOnScreenInSeconds() {
            viewToTrack.viewDidStayOnViewPortForARound()
            startedTimeStamp = endTimeStamp
        }
    }
    
}
