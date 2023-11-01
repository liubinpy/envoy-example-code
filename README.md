# Envoy案例代码

提供一些envoy的docker-compose编排文件，仅供测试。

## 镜像

docker.io/cloudbennie/http-server:1.0

```bash
curl -H "Content-Type:application/json" -X POST --data '{"health": "ok"}' http://127.0.0.1:8080/health # GET请求 /health 返回状态码200
curl -H "Content-Type:application/json" -X POST --data '{"health": "notok"}' http://127.0.0.1:8080/health # GET请求 /health 返回状态码500

curl http://localhost:8080/ping
{"message":"pong"}
curl http://localhost:8080/health
{"msg":"ok","server":"blue"}
```