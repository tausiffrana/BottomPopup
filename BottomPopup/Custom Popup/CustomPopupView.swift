//
//  CustomPopupView.swift
//  BottomPopup
//
//  Created by Apple on 03/09/21.
//

import UIKit

protocol CustomPopupViewDelegate: class
{
    func customPopupViewExtension(sender: CustomPopupView, didSelectNumber : Int)
}

class CustomPopupView: UIViewController {

    var titleString: String?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var doneButton : UIButton!
    
    weak var delegate: CustomPopupViewDelegate?
    static func instantiate() -> CustomPopupView? {
        return CustomPopupView(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleString ?? ""
        doneButton.layer.cornerRadius = 10
        doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
    }
    
     @objc func doneButtonAction() {
        delegate?.customPopupViewExtension(sender: self, didSelectNumber: 1)
    }
}
