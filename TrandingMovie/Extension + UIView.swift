//
//  Extension + UIView.swift
//  TrandingMovie
//
//  Created by Артем Орлов on 21.03.2023.
//

import UIKit

extension UIView {
    func round(_ radiuis: CGFloat = 10) {
        self.layer.cornerRadius = radiuis
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
