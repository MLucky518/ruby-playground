class Agent
  attr_reader :name, :instructions, :model

  def initialize(name:, instructions:, model: "gpt-4o")
    @name = name
    @instructions = instructions
    @model = model
  end

  def run(message, client)
    prompt = [
      { role: "system", content: instructions },
      { role: "user", content: message }
    ]

    response = client.chat(
      parameters: {
        model: model,
        messages: prompt
      }
    )

    response.dig("choices", 0, "message", "content")
  end
end
