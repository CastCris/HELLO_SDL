# WSL(Windows)
docker compose \
 -f docker-compose.yml \
 -f docker-compose.wsl.yml \
 up --build -d

# Linux
docker compose \
 -f docker-compose.yml \
 -f docker-compose.linux.yml \
 up --build -d

# Run container
docker compose exec hello_sdl bash
make
./main
