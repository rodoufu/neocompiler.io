FROM ubuntu:17.10

LABEL maintainer="NeoResearch"
LABEL authors="imcoelho,vncoelho"

RUN apt-get update \
    && apt-get install -y nodejs --no-install-recommends
RUN apt-get -y install mono-complete
RUN apt-get -y install git nano curl
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-artful-prod artful main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-get install -y apt-transport-https
RUN apt-get update && apt-get install -y dotnet-sdk-2.1.4

#Clone NeoCompiler up-to-date NeoCompiler from Neo-Project
RUN git clone https://github.com/neo-project/neo-compiler.git
RUN mkdir -p neo-compiler/neon/bin/Release/netcoreapp1.0/

#Adding pre-compiled .dll files
ADD Neon/ neo-compiler/neon/bin/Release/netcoreapp1.0/

#Create standard SC C# project
RUN mkdir buildtmp
COPY NeoContractTeste buildtmp/

#xxd decoder for hex to binary
RUN apt-get -y install xxd
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh


#Other testing commands
#RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-zesty-prod zesty main" > /etc/apt/sources.list.d/dotnetdev.list'
#VOLUME /etc/localtime
#RUN (cd neo-compiler && xbuild)
#ADD Neon/neon.dll neo-compiler/neon/bin/Release/netcoreapp1.0/
#ADD Neon/neon.runtimeconfig.json neo-compiler/neon/bin/Release/netcoreapp1.0/
#ADD Neon/antshares.monocecil.dll neo-compiler/neon/bin/Release/netcoreapp1.0/
#ADD Neon/Neo.VM.dll neo-compiler/neon/bin/Release/netcoreapp1.0/
#RUN export PATH=$PATH:neo-compiler/neon/bin/Release/netcoreapp1.0
