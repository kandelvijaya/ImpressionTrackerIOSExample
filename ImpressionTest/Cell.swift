//
//  Copyright © 2017 Vijaya Prakash Kandel. All rights reserved.
//

import UIKit

protocol TrackableView: class {

    var tracker: ViewTracker? { get set }
    func thresholdTimeOnScreenInSeconds() -> Double
    func viewDidStayOnViewPortForARound()
    func precondition() -> Bool

}

extension TrackableView where Self: UIView {

    func thresholdTimeOnScreenInSeconds() -> Double {
        return 2
    }

    func precondition() -> Bool {
        let screenRect = UIScreen.main.bounds
        let viewRect = convert(bounds, to: nil)
        let intersection = screenRect.intersection(viewRect)
        return intersection.height == bounds.height && intersection.width == bounds.width
    }

}




final class Cell: UICollectionViewCell, TrackableView {

    @IBOutlet weak var infoLabel: UILabel!

    var tracker: ViewTracker?

    var numberOfTimesTracked : Int = 0 {
        didSet{
            infoLabel.text = "\(numberOfTimesTracked)"
        }
    }

    func viewDidStayOnViewPortForARound() {
        numberOfTimesTracked += 1
        //TODO: Track with app related event
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        tracker?.stop()
        tracker = nil
    }

}
