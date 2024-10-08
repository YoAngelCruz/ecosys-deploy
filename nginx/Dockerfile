FROM nginx:latest
COPY ./ssl/certificate.cer /etc/nginx/ssl/
COPY ./ssl/_.ecosynergia.org_private_key.key /etc/nginx/ssl/
RUN chmod 644 /etc/nginx/ssl/certificate.cer && \
    chmod 600 /etc/nginx/ssl/_.ecosynergia.org_private_key.key

RUN cp /etc/nginx/ssl/certificate.cer /etc/nginx/ssl/certificate.crt && \
    chmod 644 /etc/nginx/ssl/certificate.crt