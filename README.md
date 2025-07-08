# Ruby OpenAI Playground

A Docker-based IRuby environment for experimenting with the Ruby OpenAI SDK.

## Getting Started

1. Set up your environment variables:
   - Copy `.env_default` to `.env`
   - Replace the placeholder with your actual OpenAI API key in the `.env` file

2. Build and start the container:
   ```
   docker-compose build
   docker-compose up
   ```

3. Access JupyterLab at http://localhost:8888

4. Open the example notebook or create a new Ruby notebook

## Using with VS Code or other IDEs

To use the Ruby kernel in VS Code:

1. Install the Jupyter extension
2. Open a notebook file (.ipynb)
3. Click on the kernel selector in the top right corner
4. Select "Select Another Kernel..."
5. Choose "Existing Jupyter Server"
6. Enter the URL: `http://localhost:8888`
7. Select the Ruby kernel

## Troubleshooting

If you don't see the Ruby kernel in your IDE:
- Make sure the Docker container is running
- Try restarting the Jupyter server in the container:
  ```
  docker-compose restart
  ```
- Use the web interface at http://localhost:8888 as a fallback
