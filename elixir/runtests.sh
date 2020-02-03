find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && pwd && mix deps.get && mix test" \;
