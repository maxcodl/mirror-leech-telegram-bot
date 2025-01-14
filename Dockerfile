FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN python3 -m venv mltbenv && . mltbenv/bin/activate && python3 -m pip install --upgrade pip

COPY requirements.txt .
RUN mltbenv/bin/pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PATH="/usr/src/app/mltbenv/bin:$PATH"

RUN apt-get update && apt-get install -y dos2unix && dos2unix /usr/src/app/*.sh && dos2unix /usr/src/app/*.py

CMD ["bash", "start.sh"]
