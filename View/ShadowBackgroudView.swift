//
//  ViewService.swift
//  SecondTask
//
//  Created by Georgi Malkhasyan on 1/8/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import UIKit

class ShadowBackgroudView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowOpacity = 0.95
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.borderColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        self.layer.borderWidth = 2
    }

}

class TableHeaderView: ShadowBackgroudView {

}
