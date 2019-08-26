//
//  ViewController.swift
//  Oracle DV
//
//  Created by Alex Acosta on 8/20/19.
//  Copyright © 2019 Alex Acosta. All rights reserved.
//

import UIKit
import common

let cellIdentifier = "DataSetTableViewCell"
class ViewController: BaseTableViewController<OACListViewModel> {
    
    var datasets = [DataSet]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func initViewModel() {
        model = OACListViewModel()
        model?.setCoordinator(coordinator: self)
        model?.setStateChangeListener(stateChangeListener: self)
        
        print(FileManager.default)
    }

    override func viewDidAppear(_ animated: Bool) {
        model?.fetchDatasetList()
    }
}

extension ViewController: OACCoordinator {
    func showDataset(namespace namespace_: String, name: String) {
        
    }
}

extension ViewController: StateChangeListener {
    func onStateChange(state: State) {
        if let state = state as? DatasetListState {
            datasets = state.datasetList
            tableView.reloadData()
        }
    }
}

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DataSetTableViewCell else {
            fatalError("The dequeued cell is not an instance of DataSetTableViewCell")
        }
        
        let dataSet = datasets[indexPath.row]
        
        cell.lblTitle.text = dataSet.name
        cell.lblDescription.text = dataSet.namespace_
        
        return cell
    }
}
