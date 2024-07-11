//
//  ViewController.swift
//  Colors
//
//  Created by Кирилл Сысоев on 11.07.24.
//

import UIKit

class ViewController: UIViewController {
    
    var slidersArray : [UISlider] = []
    var labelesArray : [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slidersArray = [redSlider, greenSlider, blueSlider]
        labelesArray = [redLabel, greenLabel, blueLabel]
        makeAverage()
        changeBackgroundView()
    }
    
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var changableView: UIView!
    
    
    
    @IBAction func redSlider(_ sender: UISlider) {
        changeBackgroundView()
        updateLabel(redLabel, redSlider)
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        changeBackgroundView()
        updateLabel(greenLabel, greenSlider)
    }
    
    
    @IBAction func blueSlider(_ sender: UISlider) {
        changeBackgroundView()
        updateLabel(blueLabel, blueSlider)
    }
    
    @IBAction func minimumButtonTupped(_ sender: Any) {
        makeMinimum()
        changeBackgroundView()
    }
    
    @IBAction func mediumButtonTupped(_ sender: Any) {
        makeAverage()
        changeBackgroundView()
    }
    
    @IBAction func maximumButtonTupped(_ sender: Any) {
        makeMaximum()
        changeBackgroundView()
    }
    
    func updateLabel(_ label : UILabel, _ labeledSlider : UISlider) {
        label.text = "\(Int(labeledSlider.value * 255))"
    }
    
    func makeMaximum() {
        for slider in slidersArray {
            slider.value = slider.maximumValue
            for label in labelesArray {
                updateLabel(label, slider)
            }
        }
    }
    
    func makeMinimum() {
        for slider in slidersArray {
            slider.value = slider.minimumValue
            for label in labelesArray {
                updateLabel(label, slider)
            }
        }
    }
    
    func makeAverage() {
        for slider in slidersArray {
            let average = (slider.maximumValue - slider.minimumValue) / 2 + slider.minimumValue
            slider.value = average
            for label in labelesArray {
                updateLabel(label, slider)
            }
        }
    }
    
    func changeBackgroundView() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        updateLabel(redLabel, redSlider)
        changableView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
}

