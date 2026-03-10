# Use lightweight Node image
#FROM node:18-alpine

# Create app directory
#WORKDIR /app

# Copy package files
#COPY package*.json ./

# Install dependencies
#RUN npm install --only=production

# Copy source code
#COPY . .

# Expose port
#EXPOSE 3000

# Start app
#CMD ["npm", "start"]





# ---------- Stage 1: Build ----------
FROM node:18-alpine AS builder

WORKDIR /app

# copiar arquivos de dependência
COPY package*.json ./

# instalar dependências
RUN npm ci

# copiar aplicação
COPY . .

# ---------- Stage 2: Production ----------
FROM node:18-alpine

WORKDIR /app

# copiar apenas o necessário do builder
COPY --from=builder /app /app

# receber versão da build (commit SHA vindo do pipeline)
ARG APP_VERSION

# expor versão como variável de ambiente no container
ENV APP_VERSION=$APP_VERSION

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:3000/health || exit 1

CMD ["node", "app.js"]