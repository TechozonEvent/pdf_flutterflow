const admin = require("firebase-admin/app");
admin.initializeApp();

const mergePdf = require("./merge_pdf.js");
exports.mergePdf = mergePdf.mergePdf;
const pdfTOWord = require("./pdf_t_o_word.js");
exports.pdfTOWord = pdfTOWord.pdfTOWord;
const pdfToJpg2 = require("./pdf_to_jpg2.js");
exports.pdfToJpg2 = pdfToJpg2.pdfToJpg2;
const pdfToJpg3 = require("./pdf_to_jpg3.js");
exports.pdfToJpg3 = pdfToJpg3.pdfToJpg3;
const addWatermark = require("./add_watermark.js");
exports.addWatermark = addWatermark.addWatermark;
const pdfToPptx = require("./pdf_to_pptx.js");
exports.pdfToPptx = pdfToPptx.pdfToPptx;
const pdfToPowerPoint = require("./pdf_to_power_point.js");
exports.pdfToPowerPoint = pdfToPowerPoint.pdfToPowerPoint;
const deletePagesFromPdf = require("./delete_pages_from_pdf.js");
exports.deletePagesFromPdf = deletePagesFromPdf.deletePagesFromPdf;
