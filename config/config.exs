import Config

config :n2o,
       port: 8002,
       app: :chat_app,
       pickler: :n2o_secret,
       mq: :n2o_syn,
       protocols: [:nitro_n2o],
       routes: ChatApp.Routes