# xray-node

Personal Xray (VLESS + WebSocket) service for deployment on a container PaaS
(Render free web service). The server listens on `$PORT`, plain WebSocket
inside, TLS terminated by the platform edge.

Required environment variables (set in the platform dashboard, never in this
repo):

- `UUID` — VLESS user id
- `WS_PATH` — WebSocket path, including the leading slash

Outbound is forced to IPv4 (`domainStrategy: UseIPv4`).
