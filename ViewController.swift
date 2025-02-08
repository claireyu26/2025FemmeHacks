import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let classifier = WasteClassifier()

    @IBAction func takePhoto(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        present(picker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)

        if let image = info[.originalImage] as? UIImage {
            let category = classifier?.classify(image: image) ?? "Unknown"
            showAlert(message: "Waste Category: \(category)")
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Classification", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
