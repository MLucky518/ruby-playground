# Ruby OpenAI Playground

A Docker-based IRuby environment for experimenting with the Ruby OpenAI SDK.

## Getting Started

1. Build and start the container:
   ```
   docker-compose build
   docker-compose
   ```

2. Access JupyterLab at http://localhost:8888

3. Open the example notebook or create a new Ruby notebook

## Using with VS Code or other IDEs

To use the Ruby kernel in VS Code:

1. Install the Jupyter extension
2. Open the command palette (Ctrl+Shift+P)
3. Select "existing jupyter server"
4. Enter the URL: `http://localhost:8888`
5. select ruby kernel

## Troubleshooting

If you don't see the Ruby kernel in your IDE:
- Make sure the Docker container is running
- Try restarting the Jupyter server in the container:
  ```
  docker-compose restart
  ```
- Use the web interface at http://localhost:8888 as a fallback
