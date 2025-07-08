require "openai"
require "async"
require_relative "agent"

agent1 = Agent.new(
  name: "Professional Sales Agent",
  instructions: "You are a very professional B2B salesperson who avoids jokes.",
  model: "gpt-4o-mini"
)

agent2 = Agent.new(
  name: "Engaging Sales Agent",
  instructions: "You are a playful, friendly salesperson who uses emoji and casual tone.",
  model: "gpt-4o-mini"
)

agent3 = Agent.new(
  name: "Busy Sales Agent",
  instructions: "You respond with short, curt responses because you are extremely busy.",
  model: "gpt-4o-mini"
)


message = "Write a cold sales email introducing our new AI tool."

client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
agents = [agent1, agent2, agent3]

results = []

Async do |task|
  tasks = agents.map do |agent|
    task.async { [agent.name, agent.run(message, client)] }
  end

  results = tasks.map(&:wait)
end

results.each do |name, output|
  puts "=== #{name} ===\n#{output}\n\n"
end
