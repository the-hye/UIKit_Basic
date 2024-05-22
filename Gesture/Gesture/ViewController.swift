//
//  ViewController.swift
//  Gesture
//
//  Created by JIHYE SEOK on 5/22/24.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRectangle()
        setupImageView()
    }
    
    private func setupRectangle() {
        let rectangle = UIView()
        rectangle.backgroundColor = .yellow
        rectangle.frame = CGRect(x: 100, y: 100, width: 175, height: 125)
        rectangle.isUserInteractionEnabled = true
        
        view.addSubview(rectangle)
        
        // TapGesture
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        gesture.numberOfTapsRequired = 2
        
        // LongPressGesture
        let gesture2 = UILongPressGestureRecognizer(target: self, action: #selector(handleGesture2))
        gesture2.minimumPressDuration = 2.0
        
        rectangle.addGestureRecognizer(gesture)
        rectangle.addGestureRecognizer(gesture2)
    }
    
    private func setupImageView() {
        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        imageView.frame = CGRect(x: 120, y: 300, width: 200, height: 200)
        imageView.isUserInteractionEnabled = true
        
        view.addSubview(imageView)
        
        // PinchGesture
        let gesture = UIPinchGestureRecognizer(target: self, action: #selector(handleGesture3))
        // RotateGesture
        let gesture2 = UIRotationGestureRecognizer(target: self, action: #selector(handleGesture4))
        // PanGesture
        let gesture3 = UIPanGestureRecognizer(target: self, action: #selector(handleGesture5))
        imageView.addGestureRecognizer(gesture)
        imageView.addGestureRecognizer(gesture2)
        imageView.addGestureRecognizer(gesture3)
        
        gesture.delegate = self
        gesture2.delegate = self
    }
    
    // 단일 제스터 허용 여부
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            return true
        } else {
            return true
        }
    }
    
    // 복합 제스처 허용 여부
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func handleGesture(_ sender: UITapGestureRecognizer) {
        if let view = sender.view {
            view.backgroundColor = (view.backgroundColor == .yellow) ? .red : .yellow
        }
    }
    
    @objc func handleGesture2(_ sender: UILongPressGestureRecognizer) {
        print("\(sender.state)")
        if let view = sender.view, sender.state == .began {
            view.backgroundColor = (view.backgroundColor == .yellow) ? .red : .yellow
        }
    }
    
    @objc func handleGesture3(_ sender: UIPinchGestureRecognizer) {
        print("\(sender.scale)")
        guard let view = sender.view else { return }
        let currentScale = sqrt(view.transform.a * view.transform.a + view.transform.c * view.transform.c)
        
        if sender.scale < 1.0 {
            if currentScale > 0.8 {
                view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            }
        } else {
            if currentScale < 1.2 {
                view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            }
        }
    }
    
    @objc func handleGesture4(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    
    @objc func handleGesture5(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            sender.setTranslation(.zero, in: view)
        }
    }
}

