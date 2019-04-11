import UIKit
import Carbon

class ComponentTextDelegate: UITextField, UITextFieldDelegate {
    var nextTextField: ((UITextField) -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nextTextField?(textField)
        return false
    }
}

struct FormTextField: IdentifiableComponent {
    var nextResponseOrder: Int
    var title: String
    var text: String?
    var nextTextField: (UITextField) -> Void
    var keyboardType: UIKeyboardType
    var returnKey: UIReturnKeyType
    var onInput: (String?) -> Void

    init(title: String,
         text: String?,
         keyboardType: UIKeyboardType = .default,
         returnKey: UIReturnKeyType = UIReturnKeyType.next,
         onInput: @escaping (String?) -> Void,
         nextTextField: @escaping (UITextField) -> Void,
         nextResponseOrder: Int) {
        self.title = title
        self.text = text
        self.keyboardType = keyboardType
        self.returnKey = returnKey
        self.onInput = onInput
        self.nextTextField = nextTextField
        self.nextResponseOrder = NEXTRESPONSE_TAG_OFFSET + nextResponseOrder
    }
    
    var id: String {
        return title
    }

    func renderContent() -> FormTextFieldContent {
        return .loadFromNib()
    }

    func render(in content: FormTextFieldContent) {
        content.configure(title: title,
                          text: text,
                          keyboardType: keyboardType,
                          returnKey: returnKey,
                          onInput: onInput,
                          nextTextField: nextTextField,
                          nextResponseOrder: nextResponseOrder)
    }

    func shouldContentUpdate(with next: FormTextField) -> Bool {
        return title != next.title
            || keyboardType != next.keyboardType
    }

    func referenceSize(in bounds: CGRect) -> CGSize? {
        return CGSize(width: bounds.width, height: 44)
    }
}

final class FormTextFieldContent: UIControl, NibLoadable {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textField: ComponentTextDelegate!

    var onInput: ((String?) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

        addTarget(self, action: #selector(selected), for: .touchUpInside)
        textField.addTarget(self, action: #selector(input), for: .allEditingEvents)
    }
    
    func configure(title: String,
                   text: String?,
                   keyboardType: UIKeyboardType = .default,
                   returnKey: UIReturnKeyType,
                   onInput: @escaping (String?) -> Void,
                   nextTextField:@escaping (UITextField) -> Void,
                   nextResponseOrder: Int) {
        self.titleLabel.text = title
        self.textField.text = text
        self.textField.keyboardType = keyboardType
        self.onInput = onInput
        self.textField.tag = nextResponseOrder
        self.textField.returnKeyType = returnKey
        self.textField.nextTextField = nextTextField
    }

    @objc func selected() {
        textField.becomeFirstResponder()
    }

    @objc func input() {
        onInput?(textField.text)
    }
}
