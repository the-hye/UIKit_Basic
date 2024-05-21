//
//  ViewController.swift
//  Link
//
//  Created by JIHYE SEOK on 5/21/24.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isHidden = true
        
        return webView
    }()
    
    private lazy var linkButton: UIButton = {
        let linkButton = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        config.title = "Apple"
        linkButton.configuration = config
        linkButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        linkButton.addAction(UIAction{ [weak self] _ in
            if let url = URL(string: "https://www.apple.com") {
                // 앱 외부에서 페이지로 링크연결
                // UIApplication.shared.open(url)
                
                // 앱 내에서 Web View로 링크 연결
                // self?.openInWebView(url:url)
                
                // 앱 내부에서 safari로 링크 연결
                let safariViewController = SFSafariViewController(url: url)
                safariViewController.modalPresentationStyle = .pageSheet
                self?.present(safariViewController, animated: true)
            }
        }, for: .touchUpInside)
        
        return linkButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(linkButton)
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func openInWebView(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
        webView.isHidden = false
    }
    
}

