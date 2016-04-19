//
//  ZFLabel.swift
//  swiftTest
//
//  Created by Zfan on 4/18/16.
//  Copyright © 2016 Zfan. All rights reserved.
//

import UIKit

public enum ZFLabelTextAlignment {
    case Middle
    case Top
    case Bottom
}

class ZFLabel: UILabel {
    
    internal var ZF_verticalTextAlignment : ZFLabelTextAlignment?
    
    override func textRectForBounds(bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let rect : CGRect = super.textRectForBounds(bounds, limitedToNumberOfLines: numberOfLines)
        return rect
    }
    
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(self.calculateTextRectWithRect(rect))
    }
    
    func calculateTextRectWithRect(rect : CGRect) -> CGRect {
        var calRect : CGRect;
        let fitSize = self.sizeThatFits(rect.size)
        
        switch ZF_verticalTextAlignment ?? .Middle {
        case .Top:
            calRect = CGRectMake(0, 0, self.bounds.size.width, fitSize.height);
        case .Bottom:
            calRect = CGRectMake(0, rect.size.height - fitSize.height, self.bounds.size.width, fitSize.height);
        case .Middle:
            calRect = rect;
        }
        return calRect;
    }
}
