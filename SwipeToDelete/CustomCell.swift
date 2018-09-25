//
//  CustomCell.swift
//  SwipeToDelete
//
//  Created by Shamil Yusuf

import UIKit
class CustomCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    @IBOutlet weak var childView: UIView!
    let constWidth: CGFloat =  200.0
    let animationDuration: TimeInterval = 0.3
    var _localValue: CGFloat = 0.0
    lazy var pan: UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        return pan
    }()
    @IBOutlet weak var mainContentView: UIView! {
        didSet {
            mainContentView.addGestureRecognizer(pan)
        }
    }
    @IBOutlet weak var label: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @IBOutlet weak var swipeViewWidth: NSLayoutConstraint! {
        didSet {}
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func prepareForReuse() {
        self.contentView.frame = self.bounds
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    fileprivate func animateView(_ width: CGFloat) {
        self.swipeViewWidth.constant = width
        UIView.animate(withDuration: animationDuration) {
            self.layoutIfNeeded()
        }
    }
    
    func onPan(_ swipe: UIPanGestureRecognizer) {
        let gestureRecognizer: UIGestureRecognizerState = swipe.state
        let p: CGPoint = pan.translation(in: self)
        let panValue = -(p.x)
        switch gestureRecognizer {
        case .changed:
            _localValue = panValue
            if panValue >= constWidth {
                
                _localValue = constWidth
            }
            if _localValue <= 0 {
                _localValue = self.swipeViewWidth.constant + panValue
                if _localValue <= 0 {
                    _localValue = 0
                }
            }
            self.swipeViewWidth.constant = _localValue
        case .ended:
            var width: CGFloat = 0
            if constWidth / 3 <=  _localValue {
                width = self.constWidth
            }
            else {
                width = 0
            }
            animateView(width)
        default:
            print("***default")
        }
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}



