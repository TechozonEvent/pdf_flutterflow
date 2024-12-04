const functions = require("firebase-functions");
const fetch = require("node-fetch");

// Replace with your PDF.co API key
const API_KEY =
  "event.techozon@gmail.com_bnUmd2QpKAdiYtjfMHL6hTDN22kJloc3HZUkGHDVeroqrzuLE4kXlPOlruM0eOsL";

exports.pdfToJpg3 = functions.https.onCall(async (data, context) => {
  try {
    // Extract and validate the PDF URL from input data
    const pdfUrl = data.pdfUrl;
    if (!pdfUrl) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Please provide a 'pdfUrl'.",
      );
    }

    console.log(
      `Attempting to convert PDF at ${pdfUrl} to JPG using PDF.co API`,
    );

    // Make a POST request to PDF.co API
    const response = await fetch("https://api.pdf.co/v1/pdf/convert/to/jpg", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY,
      },
      body: JSON.stringify({
        url: pdfUrl,
        inline: true,
        pages: "0-", // Convert all pages
        async: false,
      }),
    });

    // Parse the JSON response
    const result = await response.json();

    // Log the full response from PDF.co for debugging
    console.log("Full response from PDF.co API:", JSON.stringify(result));

    // Check if conversion was successful and URLs are returned
    if (result.status == 200) {
      console.log("Conversion successful:", result.urls);
      // Return the URLs directly as an array, as FlutterFlow expects
      return { urls: result.urls };
    } else {
      console.error("Failed to get converted JPG URLs from response:", result);
      throw new functions.https.HttpsError(
        "internal",
        "Failed to get converted JPG URLs from response.",
        result,
      );
    }
  } catch (error) {
    console.error("Error in pdfToJpg3 function:", error);
    throw new functions.https.HttpsError(
      "internal",
      error.message || "An unknown error occurred.",
    );
  }
});
