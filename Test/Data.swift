import UIKit

class Data
{
    static let sharedInstance = Data()
    
    // Global Constraints
    var portraitScreenWidth: CGFloat = 0
    var portraitScreenHeight: CGFloat = 0
    var landscapeScreenWidth: CGFloat = 0
    var landscapeScreenHeight: CGFloat = 0
    var landscape: Bool = true
    var landscapeConstraints: [NSLayoutConstraint] = []
    var portraitConstraints: [NSLayoutConstraint] = []
}
