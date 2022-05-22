import UIKit
import PIPKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func PIPShow(_ sender: Any) {
        let vc = PIPViewController()
        PIPKit.show(with: vc)
    }
    @IBAction func PIPXIBShow(_ sender: Any) {
        let vc = PIPXibViewController.viewController()
        PIPKit.show(with: vc)
    }
    @IBAction func PIPClose(_ sender: Any) {
        PIPKit.dismiss(animated: true)
    }
}
