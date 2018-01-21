//
//  Components.swift
//  littleprinter
//
//  Created by Michael Colville on 19/01/2018.
//  Copyright © 2018 Nord Projects Ltd. All rights reserved.
//

import UIKit

class ChunkyButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    func setup() {
        contentEdgeInsets = UIEdgeInsetsMake(-2, 2, 2, -2)
    }
    
    override var isHighlighted: Bool {
        didSet {
            contentEdgeInsets = isHighlighted ? .zero : UIEdgeInsetsMake(-2, 2, 2, -2)
            setNeedsDisplay()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.15
        }
    }
    
    var topColor: UIColor = .white
    var borderColor: UIColor = .black
    var shadowColor: UIColor = .black
    
    override func draw(_ rect: CGRect) {
        let insetRect = rect.insetBy(dx: 2, dy: 2)
        let shadowRect = insetRect.offsetBy(dx: -2, dy: 2)
        let borderRect = (state == .highlighted) ? insetRect : insetRect.offsetBy(dx: 2, dy: -2)
        let topRect = borderRect.insetBy(dx: 2, dy: 2)
        
        shadowColor.set()
        UIBezierPath(rect: shadowRect).fill()
        
        borderColor.set()
        UIBezierPath(rect: borderRect).fill()

        topColor.set()
        UIBezierPath(rect: topRect).fill()
    }
}
