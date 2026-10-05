FROM python:3.10-slim

# Set security labels
LABEL security.hardened="true" \
      security.non-root="true"

# Install system dependencies for LaTeX and pdftoppm
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m -r -u 1000 appuser

WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir img2pdf

# Copy source code
COPY . .

# Change ownership
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Default command
CMD ["python", "convert_images.py"]
