# definindo ponto de partida da imagem
# versão escolhida no dockerhub de acordo com a do projeto https://hub.docker.com/_/python
FROM python:3.10-alpine3.20

# exportar porta padrão do flask
EXPOSE 5000

# CMD, RUN, ENTRYPOINT, ADD e COPY executarão suas tarefas, além de definir o diretório padrão que será aberto ao executarmos o container.
WORKDIR /app

# ADD é fazer a cópia de um arquivo, diretório ou até mesmo fazer o download de uma URL de nossa máquina host e colocar dentro da imagem
# A instrução COPY, permite apenas a passagem de arquivos ou diretórios, diferente do ADD, que permite downloads. 
COPY requirements.txt .

RUN pip install -r requirements.txt

COPY wsgi.py .
COPY config.py .
COPY application application

CMD [ "python", "wsgi.py" ]

# dar build: docker build -t restapi:0.1 .
# rodar container: docker run -P restapi:0.1