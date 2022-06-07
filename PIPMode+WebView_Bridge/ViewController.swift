import UIKit
import PIPKit

class ViewController: UIViewController {
    @IBOutlet weak var bridgeListView: UITextView!
    @IBOutlet weak var bridgeInputView: UITextField!
    @IBOutlet weak var urlInputView: UITextField!
    
    private var bridgeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bridgeListView.layer.borderColor = UIColor.lightGray.cgColor
        bridgeListView.layer.borderWidth = 1
        bridgeListView.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }
    @IBAction private func PIPShow(_ sender: Any) {
        let vc = PIPViewController()
        let subVc = WebViewController(url: urlInputView.text!, list: bridgeArray)
        vc.view.addSubview(subVc.view)
        PIPKit.show(with: vc)
        
    }
    @IBAction private func PIPXIBShow(_ sender: Any) {
        let vc = PIPXibViewController.viewController()
        let subVc = WebViewController(url: urlInputView.text!, list: bridgeArray)
        vc.view.addSubview(subVc.view)
        PIPKit.show(with: vc)
    }
    @IBAction private func PIPClose(_ sender: Any) {
        PIPKit.dismiss(animated: true)
    
    }
    @IBAction private func addBridge(_ sender: Any) {
        if bridgeInputView.text != "" {
    
            if bridgeArray.firstIndex(of: bridgeInputView.text!) != nil {
                print("값이 중복됩니다.")
            } else {
                bridgeArray.append(bridgeInputView.text!)
                bridgeInputView.text = ""
                let string = bridgeArray.joined(separator: "\n")
                bridgeListView.text = string
            }
            
           
        }
        
    }
}
