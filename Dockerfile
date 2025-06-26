# Use a slim Python image
FROM python:3.10-slim

# Set working directory to backend/
WORKDIR /app/backend

# Copy files from host into container
COPY ./backend /app/backend

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set PYTHONPATH so modules are found
ENV PYTHONPATH=/app/backend

# Expose FastAPI port
EXPOSE 8000

# Start FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
