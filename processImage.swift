import CoreImage

func preprocessImage(_ image: UIImage) -> Data? {
    guard let cgImage = image.cgImage else { return nil }

    let context = CIContext()
    let inputImage = CIImage(cgImage: cgImage)
    let resizedImage = inputImage.transformed(by: CGAffineTransform(scaleX: 224.0 / inputImage.extent.width, y: 224.0 / inputImage.extent.height))

    guard let pixelBuffer = resizedImage.toPixelBuffer(width: 224, height: 224) else { return nil }

    return Data(copyingBufferOf: pixelBuffer)
}
