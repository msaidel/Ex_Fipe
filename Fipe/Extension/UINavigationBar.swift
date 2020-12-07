//
//  UINavigationBar.swift
//  Fipe
//
//  Created by Marcela Saidel on 04/12/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//
import UIKit

extension UINavigationBar {
    
    func makeClear() {
        
        barStyle = .black
        barTintColor = .clear
        backgroundColor = .clear
        setBackgroundImage(UIImage(), for: .default)
        isTranslucent = true
        addNewBlur()
        
    }
    
    
    
    func addNewBlur() {
        
        // Find size for blur effect.
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let bounds = self.bounds.insetBy(dx: 0, dy: -(statusBarHeight)).offsetBy(dx: 0, dy: -(statusBarHeight))
        
       
        // Create blur effect.
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        visualEffectView.isUserInteractionEnabled = false
        visualEffectView.frame = bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        visualEffectView.layer.zPosition = -1;
        self.addSubview(visualEffectView);
        self.sendSubviewToBack(visualEffectView);
        
    }
    
}
