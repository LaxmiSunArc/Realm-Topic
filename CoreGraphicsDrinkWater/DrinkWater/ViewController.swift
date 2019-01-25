//
//  ViewController.swift
//  DrinkWater
//
//  Created by Anand Suthar on 01/01/19.
//  Copyright © 2019 Anand Suthar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
   
    @IBOutlet weak var continerView: UIView!
    
    @IBOutlet weak var graphView: GraphView!
    
    
    
    @IBOutlet weak var avrageWaterDrunk: UILabel!
    @IBOutlet weak var maximumLbl: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    
    var isGraphViewShowing = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       graphView.isHidden = true
        
        if isGraphViewShowing {
            counterViewTap(nil)
        }
       
    }

    @IBAction func pushButtonPressed(_ button: PushButton) {
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
        
        if isGraphViewShowing {
            counterViewTap(nil)
        }
    }
    
    
    @IBAction func counterViewTap(_ gesture: UITapGestureRecognizer?) {
        if (isGraphViewShowing) {
           
            UIView.transition(from: graphView,
                              to: counterView,
                              duration: 1.0,
                              options: [.transitionFlipFromLeft, .showHideTransitionViews],
                              completion:nil)
        } else {
            
            UIView.transition(from: counterView,
                              to: graphView,
                              duration: 1.0,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
            setupGraphDisplay()
        }
        isGraphViewShowing = !isGraphViewShowing
    }
    
    
    func setupGraphDisplay() {
        
        let maxDayIndex = stackView.arrangedSubviews.count - 1
        
       
        graphView.graphPoints[graphView.graphPoints.count - 1] = counterView.counter
      
        graphView.setNeedsDisplay()
        maximumLbl.text = "\(graphView.graphPoints.max()!)"
        
     
        let average = graphView.graphPoints.reduce(0, +) / graphView.graphPoints.count
        avrageWaterDrunk.text = "\(average)"
        
    
        let today = Date()
        let calendar = Calendar.current
        
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEEE")
        
  
        for i in 0...maxDayIndex {
            if let date = calendar.date(byAdding: .day, value: -i, to: today),
                let label = stackView.arrangedSubviews[maxDayIndex - i] as? UILabel {
                label.text = formatter.string(from: date)
            }
        }
    }
    
    
    
    
    
    
    
    
}

