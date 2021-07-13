//
//  WeatherForecastDetailsViewController.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import UIKit

class WeatherForecastDetailsViewController: UIViewController {

    var viewModel: WeatherForecastDetailsViewModelContractor?

    @IBOutlet private weak var forecastImageView: UIImageView!
    @IBOutlet private weak var summaryLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var avgTempLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    private var displayModel: ForecastDetailsDisplayModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindViewModel()
        viewModel?.loadForecastDetails()
    }
    
    private func bindViewModel() {
        viewModel?.forecastDetailsDisplayModel.bind(listener: { [weak self] (displayModel) in
            self?.apply(model: displayModel)
            self?.tableView.reloadData()
        })
    }

    private func apply(model: ForecastDetailsDisplayModel?) {
        displayModel = model
        forecastImageView.sd_setImage(with: model?.icon, completed: nil)
        summaryLabel.text = model?.condition
        maxTempLabel.text = model?.maxTemperature
        minTempLabel.text = model?.minTemperature
        avgTempLabel.text = model?.averageTemperature
    }
}

extension WeatherForecastDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayModel?.hourlyDisplayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastHourlyTableViewCell") as? ForecastHourlyTableViewCell else {
            return UITableViewCell()
        }
        if let cellModel = displayModel?.hourlyDisplayModels[indexPath.row] {
            cell.apply(model: cellModel)
        }
        return cell
    }
}
