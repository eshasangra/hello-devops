# 1. Base image
FROM python:3.11-slim

# 2. Set working directory
WORKDIR /app

# 3. Copy dependency list first (for cache efficiency)
COPY requirements.txt /app/

# 4. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the source code
COPY app.py /app/

# 6. Expose the port Flask runs on
EXPOSE 5000

# 7. Command to run the app
CMD ["python", "app.py"]


