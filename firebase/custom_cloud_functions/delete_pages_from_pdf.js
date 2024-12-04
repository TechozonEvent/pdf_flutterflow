const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const fs = require("fs");
const path = require("path");
const os = require("os"); // For temporary directory
const { PDFDocument } = require("pdf-lib"); // For PDF editing

// Initialize Firebase Admin
admin.initializeApp();

// Function to delete pages from PDF
async function deletePagesFromPdf(pdfBuffer, pagesToDelete) {
  try {
    const pdfDoc = await PDFDocument.load(pdfBuffer);

    // Delete the specified pages (page indices are 0-based)
    pagesToDelete.forEach((pageIndex) => {
      pdfDoc.removePage(pageIndex);
    });

    const modifiedPdfBytes = await pdfDoc.save();
    return modifiedPdfBytes;
  } catch (error) {
    console.error("Error deleting pages from PDF:", error);
    throw error;
  }
}

// Cloud Function to handle PDF page deletion
exports.deletePagesFromPdf = functions.https.onRequest(async (req, res) => {
  try {
    const { pdfUrl, pagesToDelete } = req.body;

    if (!pdfUrl || !Array.isArray(pagesToDelete)) {
      console.error("Missing required fields: pdfUrl or pagesToDelete.");
      return res.status(400).send("PDF URL and pagesToDelete are required.");
    }

    console.log("Received PDF URL:", pdfUrl);
    console.log("Pages to delete:", pagesToDelete);

    // Fetch the PDF file from the URL
    const response = await axios.get(pdfUrl, {
      responseType: "arraybuffer",
      timeout: 10000,
    });
    const pdfBuffer = response.data;

    // Delete specified pages
    const modifiedPdfBytes = await deletePagesFromPdf(pdfBuffer, pagesToDelete);

    // Save the modified PDF to Firebase Storage
    const bucket = admin.storage().bucket();
    const fileName = `modified-${Date.now()}.pdf`;
    const file = bucket.file(fileName);

    await file.save(modifiedPdfBytes, {
      contentType: "application/pdf",
      public: true,
    });

    const downloadUrl = `https://storage.googleapis.com/${bucket.name}/${fileName}`;
    console.log("Download URL:", downloadUrl);

    // Respond with the modified PDF download URL
    return res.status(200).send({ downloadUrl });
  } catch (error) {
    console.error("Error during function execution:", error);
    return res.status(500).send({
      error: "An error occurred during PDF page deletion.",
      details: error.message,
    });
  }
});
