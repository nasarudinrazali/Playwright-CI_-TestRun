# Use the same version as your installed @playwright/test package
FROM mcr.microsoft.com/playwright:v1.61.1-jammy
//playwright version in package,json must much with playwright version in Dockerfile

WORKDIR /app

# Install deps first for better layer caching
COPY package*.json ./
RUN npm ci

# Copy rest of the project
COPY . .

# Optional: bake browsers again in case version mismatch (usually not needed
# since the base image already has them)
# RUN npx playwright install --with-deps

CMD ["npx", "playwright", "test"]