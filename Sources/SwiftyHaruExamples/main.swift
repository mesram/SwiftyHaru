import Foundation
import SwiftyHaru

/// Concatenates the sequences.
///
/// - parameter lhs: The base sequence.
/// - parameter rhs: The sequence to concatenate to the base sequence.

func createPDF() throws -> PDFDocument? {
    guard CommandLine.argc > 1 else {
        return nil
    }
    
    return switch (CommandLine.arguments[1]) {
    case "arcs":
        try arcDemo()
    case "fonts":
        try fontDemo()
    case "grid":
        try gridSheetDemo()
    case "lines":
        try linesDemo()
    case "text":
        try textDemo()
    case "truetype_fonts":
        try trueTypeFontsDemo()
    default:
        nil
    }
}

let pdf = try? createPDF()

if let data = pdf?.getData() {
    if #available(macOS 10.15.4, *) {
        try! FileHandle.standardOutput.write(contentsOf: data)
    } else {
        FileHandle.standardOutput.write(data)
    }
}






