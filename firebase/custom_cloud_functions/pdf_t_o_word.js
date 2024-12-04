const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");
const { Storage } = require("@google-cloud/storage");

// Initialize Firebase admin app if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

const storage = new Storage();
const bucket = storage.bucket("pdf-maker-d6b7a.appspot.com"); // Update with your bucket name

// Define the function to convert PDF to Word
exports.pdfTOWord = functions.https.onRequest(async (req, res) => {
  // Use CORS to handle requests from different origins
  const cors = require("cors")({ origin: true });
  return cors(req, res, async () => {
    try {
      const pdfUrl = req.body.pdfUrl;

      // Validate PDF URL
      if (!pdfUrl) {
        return res.status(400).json({
          error: "Invalid input. Please provide a 'pdfUrl'.",
        });
      }

      console.log("Request received for converting PDF to Word:", pdfUrl);

      // Fetch the PDF file
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

      console.log("PDF fetched successfully");
      const pdfBytes = await response.arrayBuffer();

      // Call the PDF to Word conversion service
      const wordBytes = await convertPdfToWordService(pdfBytes);

      // Save the converted Word document
      const wordFileName = `converted_${Date.now()}.docx`;
      const file = bucket.file(wordFileName);

      // Upload the converted Word document to Firebase Storage
      await file.save(wordBytes, {
        metadata: {
          contentType:
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        },
        resumable: false,
      });

      console.log(
        `Converted Word document uploaded to storage as ${wordFileName}`,
      );

      // Make the file public (optional)
      await file.makePublic();

      // Get the public URL of the uploaded file
      const publicUrl = `https://storage.googleapis.com/${bucket.name}/${wordFileName}`;
      console.log("Successfully converted and uploaded Word document");

      // Return the public URL
      return res.json({ urls: [publicUrl] });
    } catch (error) {
      console.error("Error converting PDF to Word:", error);
      return res.status(500).json({ error: error.toString() });
    }
  });
});

// Placeholder function for PDF to Word conversion
async function convertPdfToWordService(pdfBytes) {
  const response = await fetch("https://your-conversion-api-url", {
    method: "POST",
    body: pdfBytes,
    headers: {
      "Content-Type": "application/pdf",
      Authorization: "Bearer YOUR_API_KEY", // If required
    },
  });

  if (!response.ok) {
    throw new Error(
      `Conversion failed: ${response.status} ${response.statusText}`,
    );
  }

  return await response.arrayBuffer(); // Assuming the API returns the Word document in the response
}
