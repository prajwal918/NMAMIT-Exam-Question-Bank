import img2pdf
import glob
import os

# Get all WhatsApp images sorted
images = sorted(glob.glob("WhatsApp Image*.jpeg"))
print(f"Found {len(images)} images")

# Convert all images to one PDF
try:
    if not images:
        print("No images found to convert.")
    else:
        with open("ALL_33_IMAGES.pdf", "wb") as f:
            f.write(img2pdf.convert(images))
        print(f"✓ Created ALL_33_IMAGES.pdf with all {len(images)} images")
except Exception as e:
    print(f"Error converting images to PDF: {e}")
