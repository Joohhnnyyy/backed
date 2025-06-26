FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy backend code
COPY backend/ ./backend

# Add uploads folder for static files
RUN mkdir -p /app/backend/uploads

# Let Python treat backend as top-level module
ENV PYTHONPATH=/app

# Expose port
EXPOSE 8000

# Run app
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]
