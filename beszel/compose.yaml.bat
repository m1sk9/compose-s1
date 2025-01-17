services:
  berzel:
    image: henrygd/beszel:0.9.1
    container_name: beszel
    restart: unless-stopped
    extra_hosts:
      - host.docker.internal:host-gateway
    ports:
      - 8090:8090
    volumes:
      - ./beszel_data:/beszel_data

  berzel-agent:
    image: henrygd/beszel-agent:0.9.1
    container_name: beszel-agent
    restart: unless-stopped
    network_mode: host
    volumes:
        - /var/run/docker.sock:/var/run/docker.sock:ro
    env_file:
      - .env
