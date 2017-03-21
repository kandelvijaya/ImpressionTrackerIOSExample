//
//  Copyright © 2017 Vijaya Prakash Kandel. All rights reserved.
//

import UIKit

class Randomizer {

    public static func randomNumber() -> Int {
        return Int(arc4random()) % 20
    }

    private static func randomColorSpaceNumber() -> Float {
        return Float(Int(arc4random()) % 255) / 255
    }

    public static func randomColor() -> UIColor {
        let red = randomColorSpaceNumber()
        let green = randomColorSpaceNumber()
        let blue = randomColorSpaceNumber()
        return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1)
    }

    public static func randomSizeIn(_ bounds: CGSize = CGSize(width: 200, height: 200)) -> CGSize {
        let hHeight = Int(bounds.height / 2)
        let hWidth = Int(bounds.width / 2)
        let randomHeight = hHeight + Int(arc4random_uniform(UInt32(hHeight)))
        let randomWidth = hWidth + Int(arc4random_uniform(UInt32(hWidth)))
        return CGSize(width: randomWidth, height: randomHeight)
    }
    
}
