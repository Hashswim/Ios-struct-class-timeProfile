//
//  ViewController.swift
//  TimeProfilingClassWithStruct
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var structProgressBar: UIProgressView!
    @IBOutlet weak var classProgressBar: UIProgressView!
    
    var classQueue = CalculatorItemQueueClass([0])
    var structQueue = CalculatorItemQueueStruct([0])

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        structProgressBar.progress = 0.0
        classProgressBar.progress = 0.0
    }
    
    
    @IBAction func startBtnTapped(_ sender: UIButton) {
        startStructQueue()
        startClassQueue()
    }
    
    func startClassQueue() {
        var progressPercent:Float = 0.0
        
        DispatchQueue.global().async { [self] in
            while true {
                if progressPercent == 1 {
                    return}
                classQueue.pushLast(1)
                progressPercent += 0.1
                
                DispatchQueue.main.async {
                    classProgressBar.setProgress(progressPercent, animated: true)
                }
            }
        }
        
    }
    
    func startStructQueue() {
        var progressPercent:Float = 0.0
        
        DispatchQueue.global().async { [self] in
            while true {
                if progressPercent == 1 {
                    return}
                structQueue.pushLast(1)
                progressPercent += 0.1
                DispatchQueue.main.async {
                    structProgressBar.setProgress(progressPercent, animated: true)
                }
            }
        }
    }
}

