//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import UIKit

class WeatherListViewController: UIViewController {

    var viewModel: WeatherListViewModelContractor?
    private var listDisplayModels: [ForecastListItemDisplayModel] = []

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var tempUnitSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.navigationItem.title = tabBarItem.title
        WeatherListStackBuilder.configureFor(viewController: self)
        bindViewModel()
        setupStyling()
        viewModel?.loadPreferredCities()
    }

    private func bindViewModel() {
        viewModel?.forecastListDisplayModels.bind(listener: { [weak self] (displayModels) in
            self?.listDisplayModels = displayModels
            self?.tableView.reloadData()
        })

        viewModel?.prefferedCities.bind(listener: { [weak self] (cities) in
            guard cities.count > 0 else {
                return
            }
            self?.layoutSegmentedControlWith(segments: cities)
            self?.segmentedControl.selectedSegmentIndex = 0
            self?.refreshData()
        })
    }

    private func layoutSegmentedControlWith(segments: [String]) {
        segmentedControl.removeAllSegments()
        segments.enumerated().forEach { (sequence) in
            segmentedControl.insertSegment(withTitle: sequence.element, at: sequence.offset, animated: false)
        }
    }

    private func setupStyling() {
        if let subview = view.viewWithTag(101) {
            subview.layer.borderColor = UIColor.lightGray.cgColor
            subview.layer.borderWidth = 1
            subview.layer.cornerRadius = 10
            view.sendSubviewToBack(subview)
        }
    }

    @IBAction private func onSelectSegmentAction() {
        refreshData()
    }

    @IBAction private func onSelectUnitSegmentAction() {
        refreshData()
    }
}

extension WeatherListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDisplayModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListTableViewCell") as? WeatherListTableViewCell else {
            return UITableViewCell()
        }
        cell.apply(model: listDisplayModels[indexPath.row])
        return cell
    }
}

extension WeatherListViewController {

    private func refreshData() {
        guard let city = selectedCity() else {
            return
        }
        viewModel?.loadWeatherListFor(city: city, unit: selectedUnit())
    }

    private func selectedCity() -> String? {
        guard let city = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) else {
            return nil
        }
        return city
    }

    private func selectedUnit() -> TemperatureUnit {
        guard let unit = TemperatureUnit(rawValue: tempUnitSegmentedControl.selectedSegmentIndex) else {
            return .celcius
        }
        return unit
    }
}
