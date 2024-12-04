const functions = require("firebase-functions");
const fetch = require("node-fetch");
const FormData = require("form-data");
const fs = require("fs");

// Define the function to convert PDF to PPTX
exports.pdfToPptx = functions.https.onRequest(async (req, res) => {
  const cors = require("cors")({ origin: true });
  return cors(req, res, async () => {
    try {
      // Retrieve the PDF file from the form-data
      const file = req.body.file; // Make sure to upload the file directly in Postman

      if (!file) {
        return res.status(400).json({ error: "Please provide a 'file'." });
      }

      console.log(`Attempting to convert PDF file to PPTX using PDFRest API`);

      // Prepare form data for the API request
      const formData = new FormData();
      formData.append("file", fs.createReadStream(file)); // Direct file path
      formData.append("StoreFile", "true"); // Optional parameter to store the converted file

      // Send the request to the PDFRest API
      const apiResponse = await fetch("https://api.pdfrest.com/powerpoint", {
        method: "POST",
        headers: {
          Authorization: "Bearer e8a2569a-0065-4186-af47-7fc2485b3ece",
          ...formData.getHeaders(),
        },
        body: formData,
      });

      const result = await apiResponse.json();

      // Handle the API response
      if (apiResponse.ok && result.outputUrl) {
        console.log("Conversion successful:", result.outputUrl);
        // Return the URL of the converted PPTX file
        return res.json({ outputUrl: result.outputUrl });
      } else {
        console.error(
          "Error converting PDF to PPTX:",
          result.message || result.error,
        );
        return res.status(500).json({ error: result.message || result.error });
      }
    } catch (error) {
      console.error("Error in pdfToPptx function:", error);
      return res
        .status(500)
        .json({ error: error.message || "An unknown error occurred" });
    }
  });
});
