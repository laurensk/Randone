//
//  RandoneTextView.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI
import UIKit

struct RandoneTextView: UIViewRepresentable {
    
    @Binding var text: String
    var dismissOnReturn: Bool
    
    var showPlaceholder = true
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.delegate = context.coordinator
        
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = UIColor.white
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.backgroundColor = UIColor(white: 0.0, alpha: 0.00)
        textView.text = ""
        
        return textView
    }
    
    public func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    public class Coordinator : NSObject, UITextViewDelegate {
        
        var parent: RandoneTextView
        
        public init(_ uiTextView: RandoneTextView) {
            self.parent = uiTextView
        }
        
        public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if parent.dismissOnReturn {
                let resultRange = text.rangeOfCharacter(from: CharacterSet.newlines, options: .backwards)
                if text.count == 1 && resultRange != nil {
                    textView.resignFirstResponder()
                    return false
                }
            }
            return true
        }
        
        public func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
    }
    
}
