//
//  MainViewController.swift
//  TrafficLight
//
//  Created by Daniil Lebedev on 25.08.2022.
//

import UIKit

class MainViewController: UIViewController {

 
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLigtView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLight = CurrentLight.green
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    private enum CurrentLight {
        case red, yellow, green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLigtView.alpha = lightIsOff
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLigtView.layer.cornerRadius = greenLigtView.frame.width / 2
    }
    
    @IBAction func buttonTapped() {
        startButton.setTitle("Next", for: .normal)
        
        switch currentLight {
        case .red:
            yellowLightView.alpha = lightIsOn
            redLightView.alpha = lightIsOff
            currentLight = .yellow
        case .yellow:
            greenLigtView.alpha = lightIsOn
            yellowLightView.alpha = lightIsOff
            currentLight = .green
        case .green:
            redLightView.alpha = lightIsOn
            greenLigtView.alpha = lightIsOff
            currentLight = .red
        }
    }
}
