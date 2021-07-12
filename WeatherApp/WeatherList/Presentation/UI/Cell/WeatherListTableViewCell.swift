//
//  WeatherListTableViewCell.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 11/07/2021.
//

import UIKit
import SDWebImage

class WeatherListTableViewCell: UITableViewCell {

    @IBOutlet private weak var forecastImageView: UIImageView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var summaryLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var avgTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func apply(model: ForecastListItemDisplayModel) {
        dateLabel.text = model.date
        summaryLabel.text = model.condition
        maxTempLabel.text = model.maxTemperature
        minTempLabel.text = model.minTemperature
        avgTempLabel.text = model.averageTemperature
        forecastImageView.sd_setImage(with: model.icon, completed: nil)
    }

}
