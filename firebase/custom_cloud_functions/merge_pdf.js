const functions = require("firebase-functions");
const { PDFDocument } = require("pdf-lib");
const fetch = require("node-fetch");
const admin = require("firebase-admin");
const { Storage } = require("@google-cloud/storage");
const cors = require("cors")({ origin: true });

// Initialize Firebase admin app if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

const storage = new Storage();
const bucket = storage.bucket("pdf-maker-d6b7a.appspot.com"); // Update with your bucket name

// Define the function to merge PDFs
exports.mergePdf = functions.https.onRequest(async (req, res) => {
  // Use CORS to handle requests from different origins
  cors(req, res, async () => {
    try {
      const pdfUrls = req.body.pdfUrls;

      // Validate PDF URLs
      if (!pdfUrls || !Array.isArray(pdfUrls) || pdfUrls.length === 0) {
        return res.status(400).json({
          error: "Invalid input. Please provide an array of 'pdfUrls'.",
        });
      }

      console.log("Request received for merging PDFs:", pdfUrls);

      // Create a new PDF document
      const mergedPdfDoc = await PDFDocument.create();

      // Iterate over the URLs and fetch each PDF
      for (let pdfUrl of pdfUrls) {
        console.log(`Fetching PDF from URL: ${pdfUrl}`);

        const response = await fetch(pdfUrl);

        // Check if the PDF fetch was successful
        if (!response.ok) {
          console.error(
            "Failed to fetch PDF:",
            response.status,
            response.statusText,
          );
          return res.status(500).json({
            error: `Failed to fetch PDF: ${response.status} ${response.statusText}`,
          });
        }

        console.log(`PDF fetched successfully from URL: ${pdfUrl}`);
        const pdfBytes = await response.arrayBuffer();
        const pdfDoc = await PDFDocument.load(pdfBytes);

        // Merge pages from the fetched PDF into the new PDF document
        const copiedPages = await mergedPdfDoc.copyPages(
          pdfDoc,
          pdfDoc.getPageIndices(),
        );
        copiedPages.forEach((page) => {
          mergedPdfDoc.addPage(page);
        });
      }

      // Save the merged PDF to bytes
      const mergedPdfBytes = await mergedPdfDoc.save();
      const mergedFileName = `merged_pdf_${Date.now()}.pdf`;
      const file = bucket.file(mergedFileName);

      // Upload the merged PDF to Firebase Storage
      await file.save(mergedPdfBytes, {
        metadata: { contentType: "application/pdf" },
        resumable: false,
      });

      console.log(`Merged PDF uploaded to storage as ${mergedFileName}`);

      // Make the file public (optional)
      await file.makePublic();

      // Get the public URL of the uploaded file
      const publicUrl = `https://storage.googleapis.com/${bucket.name}/${mergedFileName}`;
      console.log("Successfully merged and uploaded PDF");

      // Return the public URL
      return res.json(publicUrl);
    } catch (error) {
      console.error("Error merging PDFs:", error);
      return res.status(500).json({ error: error.toString() });
    }
  });
});
