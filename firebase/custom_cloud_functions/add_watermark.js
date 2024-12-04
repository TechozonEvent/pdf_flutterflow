const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");
const { PDFDocument, rgb, degrees } = require("pdf-lib"); // Import degrees function
const cors = require("cors")({ origin: true });

// Initialize Firebase admin app if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

// Cloud function to add watermark
exports.addWatermark = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    try {
      const { pdfUrl, watermarkText, fontSize = 36, opacity = 0.5 } = req.body;

      // Validate input data
      if (!pdfUrl || !watermarkText) {
        return res
          .status(400)
          .json({ error: "Please provide both 'pdfUrl' and 'watermarkText'." });
      }

      console.log(`Fetching PDF from URL: ${pdfUrl}`);
      const pdfResponse = await fetch(pdfUrl);

      if (!pdfResponse.ok) {
        throw new Error(`Failed to fetch PDF from URL: ${pdfUrl}`);
      }

      const pdfBytes = await pdfResponse.arrayBuffer();
      const pdfDoc = await PDFDocument.load(pdfBytes);

      // Apply watermark on each page
      const pages = pdfDoc.getPages();
      const watermarkColor = rgb(0, 0, 0); // Adjust color as needed
      pages.forEach((page) => {
        const { width, height } = page.getSize();
        page.drawText(watermarkText, {
          x: width / 2 - (fontSize * watermarkText.length) / 4,
          y: height / 2,
          size: fontSize,
          color: watermarkColor,
          opacity: opacity,
          rotate: degrees(45), // Properly set rotation using degrees function
        });
      });

      // Save the watermarked PDF
      const watermarkedPdfBytes = await pdfDoc.save();
      const fileName = `watermarked_${Date.now()}.pdf`;
      const file = admin.storage().bucket().file(fileName);

      await file.save(watermarkedPdfBytes, {
        metadata: { contentType: "application/pdf" },
        resumable: false,
      });

      await file.makePublic();
      const publicUrl = `https://storage.googleapis.com/${admin.storage().bucket().name}/${fileName}`;
      console.log("Watermarked PDF uploaded to:", publicUrl);

      return res.json({ url: publicUrl });
    } catch (error) {
      console.error("Error in addWatermark function:", error);
      return res.status(500).json({ error: error.message });
    }
  });
});
