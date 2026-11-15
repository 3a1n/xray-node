FROM alpine:3.20

# The official xray image has no shell, so build on Alpine instead:
# download the pinned, locally verified Xray release binary.
RUN apk add --no-cache ca-certificates curl unzip \
 && curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.11.9/Xray-linux-64.zip \
 && unzip -o /tmp/xray.zip xray -d /usr/local/bin \
 && chmod +x /usr/local/bin/xray \
 && rm /tmp/xray.zip

COPY config.template.json /usr/local/etc/xray/config.template.json
COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
