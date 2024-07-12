//
//  ShareViewController.swift
//  original
//
//  Created by 田中志門 on 2024/07/09.
//


import UIKit
import MultipeerConnectivity

class ShareViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {
    
    // Multipeer Connectivityのためのプロパティ
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ユーザー名の設定
        let userName = UserDefaults.standard.string(forKey: "userName") ?? "Unknown User"
        
        print("setuser")
        
        // Multipeer Connectivityの初期化
        peerID = MCPeerID(displayName: userName)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        
        // デバイスの検索を開始
        startHosting()
        joinSession()
        
    }
    
    func startHosting() {
        mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "photo-share", discoveryInfo: nil, session: mcSession)
        mcAdvertiserAssistant.start()
        print("serch")
    }
    
    func joinSession() {
        let mcBrowser = MCBrowserViewController(serviceType: "photo-share", session: mcSession)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true)
        print("find")
    }
    
    // キャンセルボタンのアクション
    @IBAction func cancelTapped(_ sender: UIButton) {
        mcSession.disconnect()
        joinSession()
    }
    
    // 共有ボタンのアクション
    @IBAction func shareTapped(_ sender: UIButton) {
        if mcSession.connectedPeers.count > 0 {
            if let imageData = UserDefaults.standard.data(forKey: "sharedImage") {
                do {
                    try mcSession.send(imageData, toPeers: mcSession.connectedPeers, with: .reliable)
                } catch {
                    print("Error sending image: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    // MCSessionDelegate Methods
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        print("session")
        DispatchQueue.main.async {
            switch state {
            case .connected:
                self.statusLabel.text = "Connected to \(peerID.displayName)"
                self.cancelButton.isHidden = false
                self.shareButton.isHidden = false
            case .connecting:
                self.statusLabel.text = "Connecting..."
            case .notConnected:
                self.statusLabel.text = "Not Connected"
                
//                本来
//                self.cancelButton.isHidden = true
//                self.shareButton.isHidden = true
//
//                デバック用
                  self.cancelButton.isHidden = false
                  self.shareButton.isHidden = false
                
                
            @unknown default:
                fatalError()
            }
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        DispatchQueue.main.async {
            UserDefaults.standard.set(data, forKey: "receivedImage")
            self.statusLabel.text = "Image received from \(peerID.displayName)"
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {}
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {}
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {}
    
    // MCBrowserViewControllerDelegate Methods
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
}
