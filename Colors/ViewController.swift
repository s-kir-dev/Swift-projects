//
//  ViewController.swift
//  Colors
//
//  Created by Кирилл Сысоев on 11.07.24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeAverage(redSlider)
        makeAverage(greenSlider)
        makeAverage(blueSlider)
        changeBackgroundView()
        updateAllLabeles()
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
        makeMinimum(redSlider)
        makeMinimum(greenSlider)
        makeMinimum(blueSlider)
        changeBackgroundView()
    }
    
    @IBAction func mediumButtonTupped(_ sender: Any) {
        makeAverage(redSlider)
        makeAverage(greenSlider)
        makeAverage(blueSlider)
        changeBackgroundView()
    }
    
    @IBAction func maximumButtonTupped(_ sender: Any) {
        makeMaximum(redSlider)
        makeMaximum(greenSlider)
        makeMaximum(blueSlider)
        changeBackgroundView()
    }
    
    func updateLabel(_ label : UILabel, _ labeledSlider : UISlider) {
        label.text = "\(Int(labeledSlider.value * 255))"
    }
    
    func updateAllLabeles() {
        updateLabel(redLabel, redSlider)
        updateLabel(greenLabel, greenSlider)
        updateLabel(blueLabel, blueSlider)
    }
    
    func makeMaximum(_ slider : UISlider) {
        slider.value = slider.maximumValue
        
        updateAllLabeles()
    }
    
    func makeMinimum(_ slider : UISlider) {
        slider.value = slider.minimumValue
        
        updateAllLabeles()
    }
    
    func makeAverage(_ slider : UISlider) {
        var average = (slider.maximumValue - slider.minimumValue) / 2 + slider.minimumValue
        slider.value = average
        
        updateAllLabeles()
    }
    
    func changeBackgroundView() {
        var red = CGFloat(redSlider.value)
            var green = CGFloat(greenSlider.value)
            var blue = CGFloat(blueSlider.value)
       updateLabel(redLabel, redSlider)
        changableView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
}

