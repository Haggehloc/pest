FROM alpine:3.15

#Add the dependencies
RUN apk update
RUN apk upgrade
RUN apk add --no-cache \
	bash \
	curl \
	ca-certificates \
	less \
	ncurses-terminfo-base \
	krb5-libs \
	libgcc \
	libintl \
	libssl1.1 \
	libstdc++ \
	tzdata \
	userspace-rcu \
	zlib \
	icu-libs
 
RUN apk -X https://dl-cdn.alpinelinux.org/alpine/edge/main add --no-cache \
    lttng-ust

#Download powershell
RUN curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.2.0/powershell-7.2.0-linux-alpine-x64.tar.gz -o /tmp/powershell.tar.gz

#Extract and place Powershell files
RUN mkdir -p /opt/microsoft/powershell/7
RUN tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7
RUN chmod +x /opt/microsoft/powershell/7/pwsh
RUN ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
