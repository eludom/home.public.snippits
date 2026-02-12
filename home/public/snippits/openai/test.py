import openai
import os

openai.api_key = os.environ["OPENAI_API_KEY"] # set your API key as an environment variable

print(f"key: {openai.api_key}")

prompt = "Write a short poem in simple Latin about trees"
model = "text-davinci-002"
#model = "gpt-3.5-turbo"

response = openai.Completion.create(
    engine=model,
    prompt=prompt,
    max_tokens=1024,
)

print(response.choices[0].text)
