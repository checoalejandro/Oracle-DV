//
//  BaseViewController.swift
//  Oracle DV
//
//  Created by Alex Acosta on 8/20/19.
//  Copyright © 2019 Alex Acosta. All rights reserved.
//

import UIKit
import common

class BaseViewController<VM: BaseViewModel>: UIViewController {
    
    public var model: VM?
    
    func initViewModel() {
        
    }
    
    override func viewDidLoad() {
        initViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        model?.onActive()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        model?.onInactive()
    }
    
    deinit {
        model?.onDestroy()
    }
}

class BaseTableViewController<VM: BaseViewModel>: UITableViewController {
    
    public var model: VM?
    
    func initViewModel() {
        
    }
    
    override func viewDidLoad() {
        initViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        model?.onActive()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        model?.onInactive()
    }
    
    deinit {
        model?.onDestroy()
    }
}
