//
//  ViewController.swift
//  webviewapp
//
//  Created by Kullanici on 30.08.2022.
//

import UIKit
import WebKit
class ViewController: UIViewController,UITextFieldDelegate,WKNavigationDelegate {
    @IBOutlet weak var btnback: UIBarButtonItem!
    @IBOutlet weak var btngo: UIBarButtonItem!
    @IBOutlet weak var tesxtfield: UITextField!
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        btnback.isEnabled = false
        btngo.isEnabled = false
        tesxtfield.delegate = self
        webview.navigationDelegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let urlstring = "https://youtube.com"
        let url = URL(string: urlstring)
        
        let request = URLRequest(url: url!)
        webview.load(request)
        tesxtfield.text = urlstring
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        btnback.isEnabled = webview.canGoBack
        btngo.isEnabled = webview.canGoForward
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlstring = tesxtfield.text!
        let url = URL(string: urlstring)
        
        let request = URLRequest(url: url!)
        webview.load(request)
        tesxtfield.resignFirstResponder()
        return true
    }
    
    @IBAction func btnback(_ sender: Any) {
        if webview.canGoBack{
            webview.goBack()
        }
    }
    
    @IBAction func btngo(_ sender: Any) {
        if webview.canGoForward{
            webview.goForward()
        }
    }
    
}

