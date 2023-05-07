import sys
from langchain.chat_models import ChatOpenAI
from langchain.schema import (
    AIMessage,
    HumanMessage,
    SystemMessage,
)


user_text = sys.argv[1]
chat = ChatOpenAI(temperature=1)

response = chat([HumanMessage(content=user_text)])

print(response.content)
