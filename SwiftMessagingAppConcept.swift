import UIKit

class MessageViewController: UIViewController {

  // Outlets for the text field, send button, and table view
  @IBOutlet weak var messageTextField: UITextField!
  @IBOutlet weak var sendButton: UIButton!
  @IBOutlet weak var messagesTableView: UITableView!

  // An array to store the messages
  var messages = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Set the delegate and data source for the table view
    messagesTableView.delegate = self
    messagesTableView.dataSource = self

    // Set the delegate for the text field
    messageTextField.delegate = self

    // Handle the send button tap
    sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
  }

  // MARK: - Actions

  @objc func sendButtonTapped() {
    // Add the message to the array
    messages.append(messageTextField.text)

    // Clear the text field
    messageTextField.text = ""

    // Reload the table view
    messagesTableView.reloadData()
  }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MessageViewController: UITableViewDelegate, UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
    cell.textLabel?.text = messages[indexPath.row]
    return cell
  }

}

// MARK: - UITextFieldDelegate

extension MessageViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    sendButtonTapped()
    return true
  }

}
