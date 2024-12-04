const functions = require("firebase-functions");
const cors = require("cors")({ origin: true });
const fetch = require("node-fetch"); // To fetch the PDF file from the provided URL
const { fromPath } = require("pdf2pic"); // To convert PDF pages to images
const PptxGenJS = require("pptxgenjs"); // To create PowerPoint presentations
const { Storage } = require("@google-cloud/storage"); // For Firebase Storage

// Initialize Google Cloud Storage
const storage = new Storage();

exports.pdfToPowerPoint = functions.https.onRequest(async (req, res) => {
  return cors(req, res, async () => {
    try {
      const pdfUrl = req.body.pdfUrl;

      // Validate PDF URL
      if (!pdfUrl) {
        return res
          .status(400)
          .json({ error: "Invalid input. Please provide a 'pdfUrl'." });
      }

      console.log(`Fetching PDF from URL: ${pdfUrl}`);

      // Fetch the PDF from the provided URL
      const response = await fetch(pdfUrl);
      const pdfBuffer = await response.buffer();

      // Save the fetched PDF to a temporary file
      const fs = require("fs");
      const tempPdfPath = `/tmp/input.pdf`;
      fs.writeFileSync(tempPdfPath, pdfBuffer);

      console.log(`PDF file saved locally at ${tempPdfPath}`);

      // Convert PDF pages to images using pdf2pic
      const pdfToImages = fromPath(tempPdfPath, {
        density: 100, // Image quality (higher = better)
        saveFilename: "page", // Base name for image files
        savePath: "/tmp", // Save path for generated images
        format: "png", // Output format
        width: 800, // Width of the image
        height: 600, // Height of the image
      });

      console.log("Starting PDF-to-Image conversion...");
      const pageCount = (await pdfToImages(0)).length; // Get the number of pages
      console.log(`Total number of pages: ${pageCount}`);

      // Create a new PowerPoint presentation using pptxgenjs
      const pptx = new PptxGenJS();

      // Add each page as an image slide in the PowerPoint
      for (let i = 1; i <= pageCount; i++) {
        const pageImagePath = `/tmp/page-${i}.png`;
        const slide = pptx.addSlide();
        slide.addImage({
          path: pageImagePath,
          x: 0,
          y: 0,
          w: 10, // Default slide width
          h: 7.5, // Default slide height
        });

        console.log(`Page ${i} added to PowerPoint as slide.`);
      }

      console.log("PowerPoint slides created successfully.");

      // Save the PowerPoint presentation to a buffer
      const pptxBuffer = await pptx.write("nodebuffer");

      // Upload the PowerPoint to Firebase Storage
      const bucketName = "pdf-maker-d6b7a.appspot.com"; // Replace with your bucket name
      const fileName = `converted-${Date.now()}.pptx`;
      const file = storage.bucket(bucketName).file(fileName);

      await file.save(pptxBuffer, {
        contentType:
          "application/vnd.openxmlformats-officedocument.presentationml.presentation",
        metadata: {
          cacheControl: "public, max-age=31536000",
        },
      });

      // Make the file publicly accessible
      await file.makePublic();

      // Get the public URL of the uploaded file
      const pptxUrl = `https://storage.googleapis.com/${bucketName}/${fileName}`;

      console.log(`PowerPoint uploaded and made public at: ${pptxUrl}`);

      // Respond with the URL of the PowerPoint
      return res.json({ url: pptxUrl });
    } catch (error) {
      console.error("Error converting PDF to PowerPoint:", error);
      return res.status(500).json({
        error: "Error converting PDF to PowerPoint",
        details: error.toString(),
      });
    }
  });
});
