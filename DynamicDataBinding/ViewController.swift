//
//  ViewController.swift
//  DynamicDataBinding
//
//  Created by Gagan Vishal Mishra on 2/08/17.
//  Copyright © 2017 Gagan Vishal Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zAxisRotation: UITextField!
    @IBOutlet weak var yAxisRotation: UITextField!
    @IBOutlet weak var xAxisRotation: UITextField!
    
    var rotationViewModel : AxisRotaionViewModel!
    {
        didSet {
            rotationViewModel.xAxis.bindAndFire { (xAxis) in
                self.xAxisRotation.text = "\(xAxis)"
            }
            rotationViewModel.yAxis.bindAndFire { (yAxis) in
                self.yAxisRotation.text = "\(yAxis)"
            }
            rotationViewModel.zAxis.bindAndFire { (zAxis) in
                self.zAxisRotation.text = "\(zAxis)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //add dummy data 
        let dummyData = AxisRotation()
        dummyData.xAxis = 0.0
        dummyData.yAxis = 0.0
        dummyData.zAxis = 0.0
        
        let testViewModel =  AxisRotaionViewViewModelFromRotation(dummyData)
        self.rotationViewModel = testViewModel
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

