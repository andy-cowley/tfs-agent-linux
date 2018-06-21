
FROM ubuntu:16.04

RUN apt update \
 && apt install -y curl \
 && set -x \
 && curl -fSL https://vstsagentpackage.azureedge.net/agent/2.131.0/vsts-agent-linux-x64-2.131.0.tar.gz -o agent.tgz \
 && mkdir agent \
 && cd agent \
 && tar -xz --no-same-owner -f ../agent.tgz \
 && cd .. \
 && rm agent.tgz

COPY ./start.sh . 
RUN chmod +x start.sh

CMD ["./start.sh"]