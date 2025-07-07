FROM python:3.11-alpine

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Define variáveis de ambiente para otimizar a execução do Python em contêineres
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Copia o arquivo de dependências primeiro para aproveitar o cache de camadas do Docker
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta que a aplicação usará
EXPOSE 8000

# Comando para iniciar a aplicação com Uvicorn (adequado para produção)
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]