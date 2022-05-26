//
//  WebViewController.swift
//  PIPMode+WebView_Bridge
//
//  Created by 김원철 on 2022/05/25.
//

import Foundation
import UIKit
import WebKit
import PIPKit

class WebViewController: UIViewController, WKScriptMessageHandler {
    var configuration: WKWebViewConfiguration?
    var webView: WKWebView?
    var bridgeList: [String]?
    var webViewUrl: String?
    let contentController = WKUserContentController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: .zero, configuration: configuration!)
        self.view.addSubview(webView!)
        webView?.translatesAutoresizingMaskIntoConstraints = false
        webView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        webView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        webView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        webView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

        if let list = bridgeList, list.count != 0 {
            for i in 0 ... list.count - 1 {
                addBridge(bridgeName: list[i])
            }
        }
        
        if let url = webViewUrl {
            load(url: url)
        }
    }
    
    init(url: String, list: [String]) {
        bridgeList = list
        webViewUrl = url
        super.init(nibName: nil, bundle: nil)
        configuration = WKWebViewConfiguration()
        configuration?.userContentController = contentController
        configuration?.websiteDataStore = WKWebsiteDataStore.nonPersistent()
        configuration?.mediaTypesRequiringUserActionForPlayback = []
        configuration?.allowsInlineMediaPlayback = true
        configuration?.userContentController = contentController
        configuration?.allowsPictureInPictureMediaPlayback = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.name)
        print(message.body )
 
        switch message.name {
        /*
        case "PIPKitDismiss":
            PIPKit.dismiss(animated: true, completion: nil)
        */
        default:
            print(message.name)
        }

    }
    
 
    
    // Bridge 등록
    private func addBridge (bridgeName: String) {
        contentController.add(self, name: bridgeName)
    }
    
    private  func load(url: String) {
        let url = URL (string: url)
        let requestObj = URLRequest(url: url!)
        webView?.load(requestObj)
    }
}
