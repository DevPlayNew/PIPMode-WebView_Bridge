import UIKit
import PIPKit

class ViewController: UIViewController {
    @IBOutlet weak var bridgeListView: UITextView!
    @IBOutlet weak var bridgeStringName: UITextField!
    @IBOutlet weak var urlLabel: UITextField!
    
    var bridgeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func PIPShow(_ sender: Any) {
        let vc = PIPViewController()
        let subVc = WebViewController(url: urlLabel.text!, list: bridgeArray)
        vc.view.addSubview(subVc.view)
        PIPKit.show(with: vc)
        
    }
    @IBAction func PIPXIBShow(_ sender: Any) {
        let vc = PIPXibViewController.viewController()
        let subVc = WebViewController(url: urlLabel.text!, list: bridgeArray)
        vc.view.addSubview(subVc.view)
        PIPKit.show(with: vc)
    }
    @IBAction func PIPClose(_ sender: Any) {
        PIPKit.dismiss(animated: true)
    }
    @IBAction func addBridge(_ sender: Any) {
        if bridgeStringName.text != "" {
    
            if let index = bridgeArray.firstIndex(of: bridgeStringName.text!) {
                print("값이 중복 됩니다.")
            } else {
                bridgeArray.append(bridgeStringName.text!)
                bridgeStringName.text = ""
            
                var attributes = [NSAttributedString.Key: Any]()
                attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
                attributes[.foregroundColor] = UIColor.darkGray
                
                let string = bridgeArray.joined(separator: "\n")
                bridgeListView.attributedText = NSAttributedString(string: string, attributes: attributes)
            }
            
           
        }
        
    }
}
