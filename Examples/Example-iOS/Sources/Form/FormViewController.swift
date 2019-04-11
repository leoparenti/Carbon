import UIKit
import Carbon

// swiftlint:disable all
let NEXTRESPONSE_TAG_OFFSET = 100
extension UITableView {
    
    func nextResponder(_ fromTextfieldWithTag: Int){
        var currIndex = -1
        for i in fromTextfieldWithTag+1..<fromTextfieldWithTag+NEXTRESPONSE_TAG_OFFSET{
            if let view = self.superview?.superview?.viewWithTag(i){
                view.becomeFirstResponder()
                currIndex = i
                break
            }
        }
        // move to
        let ind = IndexPath(row: currIndex - NEXTRESPONSE_TAG_OFFSET, section: 0)
        if let nextCell = self.cellForRow(at: ind){
            self.scrollRectToVisible(nextCell.frame, animated: true)
        }
    }
}

final class FormViewController: UIViewController {
    enum ID {
        case about
        case note
        case detail
        case detailsInput
        case genderPicker
        case birthdayPicker
    }

    enum Gender: String, CaseIterable {
        case male = "Male"
        case female = "Female"
        case other = "Other"
    }

    struct State {
        var name: String?
        var cognome: String?
        var gender: Gender?
        var birthday: Date?
        var location: String?
        var email: String?
        var job: String?
        var note: String?
        var isOpenDetails = false
        var isOpenGenderPicker = false
        var isOpenBirthdayPicker = false
    }

    @IBOutlet var tableView: UITableView!

    var state = State() {
        didSet { render() }
    }

    private lazy var renderer = Renderer(
        target: tableView,
        adapter: UITableViewAdapter(),
        updater: UITableViewUpdater()
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile Form"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        renderer.updater.deleteRowsAnimation = .middle
        renderer.updater.insertRowsAnimation = .middle
        renderer.updater.insertSectionsAnimation = .top
        renderer.updater.deleteSectionsAnimation = .top

        render()
    }

    func render() {
        
        renderer.render(
            Section(
                id: ID.about,
                header: ViewNode(Header(title: "ABOUT")),
                cells: [
                    CellNode(FormTextField(title: "text",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                                self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:1)),
                    CellNode(FormTextField(title: "text2",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:2)),
                    CellNode(FormTextField(title: "text3",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:3)),
                    CellNode(FormTextField(title: "text4",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:4)),
                    CellNode(FormTextField(title: "text5",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:5)),
                    CellNode(FormTextField(title: "text6",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:6)),
                    CellNode(FormTextField(title: "text7",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:7)),
                    CellNode(FormTextField(title: "text8",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:8)),
                    CellNode(FormTextField(title: "text9",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:9)),
                    CellNode(FormTextField(title: "text10",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:10)),
                    CellNode(FormTextField(title: "text11",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:11)),
                    CellNode(FormTextField(title: "text",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:12)),
                    CellNode(FormTextField(title: "text2",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:13)),
                    CellNode(FormTextField(title: "text3",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:14)),
                    CellNode(FormTextField(title: "text4",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:15)),
                    CellNode(FormTextField(title: "text5",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:16)),
                    CellNode(FormTextField(title: "text6",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:17)),
                    CellNode(FormTextField(title: "text7",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:18)),
                    CellNode(FormTextField(title: "text8",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:19)),
                    CellNode(FormTextField(title: "text9",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:20)),
                    CellNode(FormTextField(title: "text10",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:21)),
                    CellNode(FormTextField(title: "text11",
                                           text: state.name,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.name = text }},
                                           nextTextField: {[weak self] textfield in
                                            self?.tableView?.nextResponder(textfield.tag) },
                                           nextResponseOrder:22)),
                    CellNode(FormTextField(title: "text12",
                                           text: state.cognome,
                                           returnKey: UIReturnKeyType.send,
                                           onInput: { [weak self] text in
                                            if let strong = self {
                                                strong.state.cognome = text }},
                                           nextTextField: {textfield in
                                                print("confirm button action to call")
                                                // keyboard down!
                                                textfield.resignFirstResponder() },
                                           nextResponseOrder:23))
                    
                ]
            )
        )
    }

    @objc func keyboardWillChangeFrame(notification: Notification) {
        let keybordFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        tableView.contentInset.bottom = view.bounds.height - keybordFrame.minY
    }
}

private extension FormViewController.Gender {
    static let allTexts = allCases.map { $0.rawValue }
}

private extension Date {
    var longText: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: self)
    }
}
