import img2pdf
import glob
import os

# Get all WhatsApp images sorted
images = sorted(glob.glob("WhatsApp Image*.jpeg"))
print(f"Found {len(images)} images")

# Convert all images to one PDF
with open("ALL_33_IMAGES.pdf", "wb") as f:
    f.write(img2pdf.convert(images))

print(f"✓ Created ALL_33_IMAGES.pdf with all {len(images)} images")
