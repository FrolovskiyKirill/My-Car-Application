//
//  ExpenseCustomCellTableViewCell.swift
//  My Car Application
//
//  Created by Kirill Frolovskiy on 28.05.2023.
//

import UIKit

class ExpenseCustomCell: UITableViewCell {

  var videoImageView = UIImageView()
  var videoTitleLabel = UILabel()
  var extenseLabel = UILabel()
  var backgroundViewColor = UIView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(backgroundViewColor)
    addSubview(videoImageView)
    addSubview(videoTitleLabel)
    addSubview(extenseLabel)
    configerBackgroundViewColor()
    configerImageView()
    configerTitleLabel()
    configerExtenseLabel()
    setBackgroundViewColorConstraints()
    setImageConstraints()
    setTitleLabelConstraints()
    setExtenseLabelConstraints()

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func set(video: Expense) {
    videoImageView.image = video.image
    videoTitleLabel.text = video.date
    extenseLabel.text = video.extense
  }

  func configerBackgroundViewColor() {
    backgroundViewColor.layer.cornerRadius = 10
    backgroundViewColor.backgroundColor = UIColor(red: 0.894, green: 0.894, blue: 0.921, alpha: 1)
    backgroundViewColor.clipsToBounds = true
  }

  func configerImageView() {
    videoImageView.layer.cornerRadius = 10
    videoImageView.clipsToBounds = true
    videoImageView.tintColor = .gray

  }

  func configerTitleLabel() {
    videoTitleLabel.numberOfLines = 0
    videoTitleLabel.adjustsFontSizeToFitWidth = true
  }

  func configerExtenseLabel() {
    extenseLabel.numberOfLines = 0
    extenseLabel.adjustsFontSizeToFitWidth = true
  }

  func setBackgroundViewColorConstraints() {
    backgroundViewColor.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      backgroundViewColor.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      backgroundViewColor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
      backgroundViewColor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
      backgroundViewColor.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)

    ])
  }

  func setImageConstraints() {
    videoImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36)
    ])
  }

  func setTitleLabelConstraints() {
    videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    videoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    videoTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 68).isActive = true
    videoTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
  }

  func setExtenseLabelConstraints() {
    extenseLabel.translatesAutoresizingMaskIntoConstraints = false
    extenseLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    extenseLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    extenseLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
  }
}
