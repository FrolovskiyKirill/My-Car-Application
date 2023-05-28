//
//  ExpensesListViewController.swift
//  My Car Application
//
//  Created by Kirill Frolovskiy on 28.05.2023.
//

import UIKit

class ExpensesListViewController: UIViewController {

  var tableView = UITableView()
  var videos: [Expense] = []

  struct Cells {
    static let expenseCell = "ExpenseCell"
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = ExpensesListScreenString.navigationBarTitle.localized
    videos = fetchData()
    configureTableView()
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  func configureTableView() {
    view.addSubview(tableView)
    //set deligates
    setTableViewDeligates()
    //set row height
    tableView.rowHeight = 66
    //register cells
    tableView.register(ExpenseCustomCell.self, forCellReuseIdentifier: Cells.expenseCell)
    //set constraints
    tableView.pin(to: view)
    tableView.separatorStyle = .none
  }

  func setTableViewDeligates() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension ExpensesListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    videos.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Cells.expenseCell) as! ExpenseCustomCell
    let video = videos[indexPath.row]
    cell.set(video: video)

    return cell
  }
}

extension ExpensesListViewController {

  func fetchData() -> [Expense] {
    let video1 = Expense(image: Images.fuel, date: "14.02.2023", extense: "- 2000")
    let video2 = Expense(image: Images.fine, date: "27.04.2023", extense: "- 5000")
    let video3 = Expense(image: Images.repair, date: "02.07.2023", extense: "- 4500")

    return [video1, video2, video3, video1, video2, video3, video2, video1, video2, video3]
  }
}
