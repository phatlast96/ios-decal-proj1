//
//  StatisticsViewController.swift
//  To-Do List
//
//  Created by Phat Pham on 10/10/16.
//  Copyright © 2016 Phat Pham. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var numberOfCompletedTaskWithin24Hours: UILabel!
    
    init(frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        numberOfCompletedTaskWithin24Hours = UILabel.init(frame: self.view.frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
