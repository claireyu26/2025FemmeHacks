import TensorFlowLite
import UIKit

class WasteClassifier {
    private var interpreter: Interpreter

    init?() {
        guard let modelPath = Bundle.main.path(forResource: "waste_classifier", ofType: "tflite") else {
            print("Failed to load model.")
            return nil
        }

        do {
            interpreter = try Interpreter(modelPath: modelPath)
            try interpreter.allocateTensors()
        } catch {
            print("Failed to create TensorFlow Lite interpreter: \(error)")
            return nil
        }
    }

    func classify(image: UIImage) -> String? {
        guard let buffer = preprocessImage(image) else { return nil }

        do {
            try interpreter.copy(buffer, toInputAt: 0)
            try interpreter.invoke()

            let outputTensor = try interpreter.output(at: 0)
            let results = outputTensor.data.toArray(type: Float.self)

            let maxIndex = results.firstIndex(of: results.max()!) ?? 0
            return WasteLabels[maxIndex]

        } catch {
            print("Error running inference: \(error)")
            return nil
        }
    }
}
