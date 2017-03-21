//
//  Copyright © 2017 Vijaya Prakash Kandel. All rights reserved.
//

import UIKit

final class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        setupFlowLayout()
    }

    private func setupFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView?.setCollectionViewLayout(layout, animated: false)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Randomizer.randomNumber()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = Randomizer.randomColor()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Randomizer.randomSizeIn()
    }

}


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
