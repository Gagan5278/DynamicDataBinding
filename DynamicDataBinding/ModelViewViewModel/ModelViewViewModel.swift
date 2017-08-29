//
//  ModelViewViewModel.swift
//  DynamicDataBinding
//
//  Created by Gagan Vishal Mishra on 24/08/17.
//  Copyright © 2017 Gagan Vishal Mishra. All rights reserved.
//

import Foundation
import CoreMotion

protocol AxisRotaionViewModel: class {
    var xAxis : Dynamic<Double> {get}
    var yAxis : Dynamic<Double>{get}
    var  zAxis : Dynamic<Double>{get}
}

class AxisRotaionViewViewModelFromRotation : AxisRotaionViewModel
{
    let axis : AxisRotation
    var xAxis : Dynamic<Double>
    var yAxis : Dynamic<Double>
    var zAxis : Dynamic<Double>
    
    //creaye a motion manager object
    let motionManager = CMMotionManager()
    
    init(_ axisRotation : AxisRotation) {
        self.axis = axisRotation
        self.xAxis = Dynamic(axisRotation.xAxis)
        self.yAxis = Dynamic(axisRotation.yAxis)
        self.zAxis = Dynamic(axisRotation.zAxis)
        
        if motionManager.isGyroAvailable
        {
            //set interval time
            motionManager.deviceMotionUpdateInterval = 0.25
            motionManager.startDeviceMotionUpdates()
            motionManager.gyroUpdateInterval = 0.25
            
            motionManager.startGyroUpdates(to: OperationQueue.main, withHandler: { [weak self](motionData, error) in
                if (error != nil) {
                    print("Error in getting motion data with error desciption :\(String(describing: error?.localizedDescription))")
                }
                else
                {
                    if let data = motionData {
                        self?.xAxis = Dynamic(data.rotationRate.x)
                        self?.yAxis = Dynamic(data.rotationRate.y)
                        self?.zAxis = Dynamic(data.rotationRate.z)
                    }
                }
            })
        }
        
        //        let downloadTask = URLSession.shared.dataTask(with: URL(string: "http://cdn.wonderfulengineering.com/wp-content/uploads/2016/01/nature-wallpapers-38.jpg")!) { [weak self] data, response, error in
        //            if (error != nil) {
        //
        //            }
        //            else{
        //                if let dataAvailable = data
        //                {
        //                    if let image = UIImage(data: dataAvailable)
        //                    {
        //                        self?.thumbnail = Dynamic(image)
        //                    }
        //                }
        //            }
        //        }
        //        downloadTask.resume()
        //    }
    }
}
