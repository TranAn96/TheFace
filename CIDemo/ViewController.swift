//
//  ViewController.swift
//  CIDemo
//
//  Created by Trần An on 1/24/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named : "1")
        findFace()
    }

   
    func findFace(){
        guard let faceImage = CIImage(image: imageView.image!) else {return}
        let accurany = [CIDetectorAccuracy : CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accurany)
        let faces = faceDetector?.features(in:faceImage,options:[CIDetectorSmile : true , CIDetectorEyeBlink :true] )
        for face in faces as![CIFaceFeature]
        {
            if face.hasSmile {
                print("Smile")
            }
            if face.leftEyeClosed {
                print("LeftEyeClosed")
            }
            if face.rightEyeClosed {
                print("RightEyeClose")
            }
        }
        if faces!.count != 0 {
            print("Number of face is \(faces!.count)")
        }else{
            print("No face")
        }
        
    }

}

