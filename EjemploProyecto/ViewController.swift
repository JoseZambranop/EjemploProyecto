//
//  ViewController.swift
//  EjemploProyecto
//
//  Created by Jose Luis Zambrano on 21/11/21.
//

import UIKit

class ViewController: UIViewController {

    //Outles

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!

    //Variables
    private let myPickerViewValues = ["Uno","Dos","Tres","Cuatro","Cinco"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Buttons
        myButton.setTitle("Mi Boton", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        
        //Pickers
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
 
        //PageControl
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        
        //SegmenteControls
        mySegmentedControl.removeAllSegments()
        for (index, value) in myPickerViewValues.enumerated(){
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        //Slider
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float (myPickerViewValues.count)
        mySlider.value = 1
        
        //Steppers
        myStepper.minimumValue = 1
        myStepper.maximumValue = Double(myPickerViewValues.count)
        
        
        //Switch
        mySwitch.onTintColor = .purple
        mySwitch.isOn = false
        
        
    }
    //Actions
    @IBAction func myBottonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        }else{
            myButton.backgroundColor = .orange
        }
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        
        mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
        
        mySlider.value = Float(myPageControl.currentPage + 1)
        
    }
    
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        
        mySlider.value = Float(mySegmentedControl.selectedSegmentIndex + 1)
    }
    
    @IBAction func mySliderAction(_ sender: Any) {
        switch mySlider.value{
            case 1..<2:
            let myString = myPickerViewValues[0]
                myButton.setTitle(myString, for: .normal)
                myPickerView.selectRow(0, inComponent: 0, animated: true)
                mySegmentedControl.selectedSegmentIndex = 0
                myPageControl.currentPage = 0
            case 2..<3:
                let myString = myPickerViewValues[1]
                myButton.setTitle(myString, for: .normal)
                myPickerView.selectRow(1, inComponent: 0, animated: true)
                mySegmentedControl.selectedSegmentIndex = 1
                myPageControl.currentPage = 1
            case 3..<4:
                let myString = myPickerViewValues[2]
                myButton.setTitle(myString, for: .normal)
                myPickerView.selectRow(2, inComponent: 0, animated: true)
                mySegmentedControl.selectedSegmentIndex = 2
                myPageControl.currentPage = 2
            case 4..<5:
                let myString = myPickerViewValues[3]
                myButton.setTitle(myString, for: .normal)
                myPickerView.selectRow(3, inComponent: 0, animated: true)
                mySegmentedControl.selectedSegmentIndex = 3
                myPageControl.currentPage = 3
            default:
                let myString = myPickerViewValues[4]
                myButton.setTitle(myString, for: .normal)
                myPickerView.selectRow(4, inComponent: 0, animated: true)
                mySegmentedControl.selectedSegmentIndex = 4
                myPageControl.currentPage = 4
            
        }
    }
    
    
    @IBAction func myStepperAction(_ sender: Any) {
        let value = myStepper.value
        mySlider.value = Float(value)
        
        let myString = myPickerViewValues[Int(value)-1]
            myButton.setTitle(myString, for: .normal)
        myPickerView.selectRow(Int(value)-1, inComponent: 0, animated: true)
        mySegmentedControl.selectedSegmentIndex = Int(value)-1
        myPageControl.currentPage = Int(value)-1
        
    }
    
    
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn {
            myPickerView.isHidden = false
        }else{
            myPickerView.isHidden = true
        }
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        myPageControl.currentPage = row
        mySegmentedControl.selectedSegmentIndex = row
        mySlider.value = Float(row + 1)
    }
    
}
