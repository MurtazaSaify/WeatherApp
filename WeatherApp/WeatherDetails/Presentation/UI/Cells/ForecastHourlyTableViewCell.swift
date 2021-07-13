//
//  ForecastHourlyTableViewCell.swift
//  WeatherApp
//
//  Created by Murtuza Saify on 13/07/2021.
//

import UIKit

class ForecastHourlyTableViewCell: UITableViewCell {

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var summaryLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func apply(model: ForecastHourDisplayModel) {
        iconImageView.sd_setImage(with: model.icon, completed: nil)
        summaryLabel.text = model.condition
        temperatureLabel.text = model.temperatureText
        timeLabel.text = model.time
    }
}
