//
//  ExpensesListViewController.swift
//  My Car Application
//
//  Created by Kirill Frolovskiy on 28.05.2023.
//

import UIKit

class ExpensesListViewController: UIViewController {

  var tableView = UITableView()
  var expenses: [Expense] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    title = ExpensesListScreenString.navigationBarTitle.localized
    expenses = fetchData()
    configureTableView()
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  func configureTableView() {
    view.addSubview(tableView)
    tableView.backgroundColor = UIColor(named: Color.backgroundColor)
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
    expenses.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Cells.expenseCell) as! ExpenseCustomCell
    let expense = expenses[indexPath.row]
    cell.set(expense: expense)

    return cell
  }
}

extension ExpensesListViewController {

  func fetchData() -> [Expense] {
    let expense1 = Expense(image: Images.fuel, date: "14.02.2023", extense: "- 2000")
    let expense2 = Expense(image: Images.fine, date: "27.04.2023", extense: "- 5000")
    let expense3 = Expense(image: Images.repair, date: "02.07.2023", extense: "- 4500")

    return [expense1, expense2, expense3, expense1, expense2, expense3, expense2, expense1, expense2, expense3]
  }
}
