# Use official Logstash image as base
FROM docker.elastic.co/logstash/logstash:8.15.0

# Set working directory
WORKDIR /usr/share/logstash

# Copy your pipeline configuration files (if you have them)
# Example: pipeline.conf and logstash.yml should exist in your build context
COPY ./pipeline/ /usr/share/logstash/pipeline/
COPY ./config/logstash.yml /usr/share/logstash/config/logstash.yml

# Optional: Copy custom patterns (for grok, etc.)
# COPY ./patterns /usr/share/logstash/patterns

# Optional: Install custom plugins (e.g., logstash-output-http)
# RUN logstash-plugin install logstash-output-http

# Expose default ports
EXPOSE 5044 5000 9600

# Run Logstash
CMD ["logstash", "-f", "/usr/share/logstash/pipeline/logstash.conf"]