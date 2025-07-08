# Ruby OpenAI Agent Scripts

This directory contains scripts for working with OpenAI's API using Ruby agents.

## Files

- `agent.rb` - Contains the Agent class for interacting with OpenAI's API
- `test.rb` - Example script that runs multiple agents in parallel using async

## Running the Scripts

### Inside Docker Container (Recommended)

The scripts are automatically copied into the Docker container when it's built. To run them:

```bash
# Start the Docker container if it's not already running
docker-compose up -d

# Run a script inside the container
docker exec ruby-openai-playground-dev-1 ruby /workspace/scripts/test.rb
```

### Locally (Requires Ruby and Gems)

If you want to run the scripts locally (outside Docker):

1. Install the required gems:
   ```bash
   gem install openai async
   ```

2. Set your OpenAI API key:
   ```bash
   export OPENAI_API_KEY=your_api_key_here
   ```

3. Run the script:
   ```bash
   ruby scripts/test.rb
   ```

## Creating Your Own Agents

You can create your own agents by extending the Agent class or creating new instances with different parameters:

```ruby
my_agent = Agent.new(
  name: "Custom Agent",
  instructions: "Your custom instructions here",
  model: "gpt-4o" # or any other model
)

response = my_agent.run("Your prompt here", client)
```

## Async Functionality

The `test.rb` script demonstrates how to run multiple agents in parallel using the `async` gem. This can significantly speed up processing when you need to make multiple API calls.
