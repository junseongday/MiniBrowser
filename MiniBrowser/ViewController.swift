//
//  ViewController.swift
//  MiniBrowser
//
//  Created by JSMAC on 2020/07/05.
//  Copyright © 2020 JSPRO. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    @IBOutlet weak var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var spinningActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                let initialURL = "https://facebook.com"
        let url = URLRequest(url: URL(string: initialURL)!)
        mainWebView.load(url)
        urlTextField.text = initialURL
        mainWebView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        spinningActivityIndicatorView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinningActivityIndicatorView.stopAnimating()

    }
    
    @IBAction func bookMarkAction(_ sender: Any) {
        //selectedSegmentIndex, titleForSegment
        let bookMarkURL = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        let urlString = "https://www.\(bookMarkURL!).com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(textField.text!)"
        if !urlString.hasPrefix("https://") {
            urlString = "https://\(textField.text!)"
        }
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
        return true
    }
    
    @IBAction func goBackAction(_ sender: Any) {
        mainWebView.goBack()
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        mainWebView.goForward()
    }
    
    @IBAction func stopLoadingAction(_ sender: Any) {
        mainWebView.stopLoading()
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        mainWebView.reload()
    }
    
}

