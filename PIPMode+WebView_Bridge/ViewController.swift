import UIKit
import PIPKit

class ViewController: UIViewController {
    @IBOutlet weak var bridgeListView: UITextView!
    @IBOutlet weak var bridgeStringName: UITextField!
    @IBOutlet weak var urlLabel: UITextField!
    
    private var bridgeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction private func PIPShow(_ sender: Any) {
        let vc = PIPViewController()
        let subVc = WebViewController(url: urlLabel.text!, list: bridgeArray)
        vc.view.addSubview(subVc.view)
        PIPKit.show(with: vc)
        
    }
    @IBAction private func PIPXIBShow(_ sender: Any) {
        let vc = PIPXibViewController.viewController()
        let subVc = WebViewController(url: urlLabel.text!, list: bridgeArray)
        vc.view.addSubview(subVc.view)
        PIPKit.show(with: vc)
    }
    @IBAction private func PIPClose(_ sender: Any) {
        PIPKit.dismiss(animated: true)
    
    }
    @IBAction private func addBridge(_ sender: Any) {
        if bridgeStringName.text != "" {
    
            if bridgeArray.firstIndex(of: bridgeStringName.text!) != nil {
                print("값이 중복됩니다.")
            } else {
                bridgeArray.append(bridgeStringName.text!)
                bridgeStringName.text = ""
                let string = bridgeArray.joined(separator: "\n")
                bridgeListView.text = string
            }
            
           
        }
        
    }
}
