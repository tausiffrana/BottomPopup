//
//  ViewController.swift
//  BottomPopup
//
//  Created by Apple on 03/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnShowPopup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnShowPopup.addTarget(self, action: #selector(showPopup), for: .touchUpInside)
    }

    @objc func showPopup() {
        
        guard let popupViewController = CustomPopupView.instantiate() else { return }
        popupViewController.delegate = self
        popupViewController.titleString = "I am custom popup"
        
        let popupVC = PopupViewController(contentController: popupViewController, position: .bottom(0), popupWidth: self.view.frame.width, popupHeight: 300)
        popupVC.cornerRadius = 15
        popupVC.backgroundAlpha = 0.0
        popupVC.backgroundColor = .clear
        popupVC.canTapOutsideToDismiss = true
        popupVC.shadowEnabled = true
        popupVC.delegate = self
        popupVC.modalPresentationStyle = .popover
        self.present(popupVC, animated: true, completion: nil)
    }
}

extension ViewController : PopupViewControllerDelegate, CustomPopupViewDelegate
{
    // MARK: Default Delegate Methods For Dismiss Popup
    public func popupViewControllerDidDismissByTapGesture(_ sender: PopupViewController)
    {
        dismiss(animated: true)
        {
            debugPrint("Popup Dismiss")
        }
    }
    
    // MARK: Custom Delegate Methods For Dismiss Popup on Action
    func customPopupViewExtension(sender: CustomPopupView, didSelectNumber: Int)
    {
        dismiss(animated: true)
        {
            if didSelectNumber == 1
            {
                debugPrint("Custom Popup Dismiss On Done Button Action")
            }
        }
    }
}


