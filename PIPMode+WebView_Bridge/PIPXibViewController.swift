import UIKit
import PIPKit

class PIPXibViewController: UIViewController, PIPUsable {
    
    var initialState: PIPState { return .full }
    var initialPosition: PIPPosition { return .topRight }
    var pipEdgeInsets: UIEdgeInsets { return UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20) }
    var pipSize: CGSize = CGSize(width: 100.0, height: 100.0)
    var pipShadow: PIPShadow? = nil
    var pipCorner: PIPCorner? = nil
 
    class func viewController() -> PIPXibViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "PIPXibViewController") as? PIPXibViewController else {
            fatalError("PIPXibViewController is null")
        }
        return viewController
    }
    
    func didChangedState(_ state: PIPState) {
        switch state {
        case .pip:
            print("PIPXibViewController.pip")
        case .full:
            print("PIPXibViewController.full")
        }
    }
    
    func didChangePosition(_ position: PIPPosition) {
        switch position {
        case .topLeft:
            print("PIPXibViewController.topLeft")
        case .middleLeft:
            print("PIPXibViewController.middleLeft")
        case .bottomLeft:
            print("PIPXibViewController.bottomLeft")
        case .topRight:
            print("PIPXibViewController.topRight")
        case .middleRight:
            print("PIPXibViewController.middleRight")
        case .bottomRight:
            print("PIPXibViewController.bottomRight")
        }
    }
    
    // MARK: - Action
    @IBAction private func onFullAndPIP(_ sender: UIButton) {
        if PIPKit.isPIP {
            stopPIPMode()
        } else {
            startPIPMode()
        }
    }
    
    @IBAction private func onUpdatePIPSize(_ sender: UIButton) {
        pipSize = CGSize(width: 100 + Int(arc4random_uniform(100)),
                         height: 100 + Int(arc4random_uniform(100)))
        setNeedsUpdatePIPFrame()
    }
    
    @IBAction private func onDismiss(_ sender: UIButton) {
        PIPKit.dismiss(animated: true) {
            print("PIPXibViewController.dismiss")
        }
    }
}
