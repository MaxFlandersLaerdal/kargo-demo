# Use the official Nginx image as the base image
FROM public.ecr.aws/nginx/nginx:1.26.0

COPY additional.html /usr/share/nginx/html/additional.html
