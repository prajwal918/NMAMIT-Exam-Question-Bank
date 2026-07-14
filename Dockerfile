FROM python:3.10-slim

# Install system dependencies for LaTeX and pdftoppm
RUN apt-get update && apt-get install -y \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir img2pdf

# Copy source code
COPY . .

# Default command
CMD ["python", "convert_images.py"]