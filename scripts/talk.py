from langchain.chat_models import ChatOpenAI
from langchain.schema import (
    AIMessage,
    HumanMessage,
    SystemMessage,
)

chat = ChatOpenAI(temperature=1)

response = chat([HumanMessage(content="Hi, how are you?")])

print(response.content)
