#!/bin/bash

cd cert
cfssl print-defaults config > config.json  # 初始化配置文件
cfssl print-defaults csr > ca-csr.json  # 创建ca证书
cfssl gencert -initca ca-csr.json | cfssljson -bare ca


# ----- 创建front-envoy的服务端证书
cfssl print-defaults csr > front-proxy-csr.json
cfssl gencert -ca=ca.pem \
-ca-key=ca-key.pem \
-config=config.json -profile=server \
front-proxy-csr.json | cfssljson -bare front-proxy-csr

# 创建front envoy 到 app envoy通信的证书
cfssl print-defaults csr > app-csr.json
cfssl gencert -ca=ca.pem \
-ca-key=ca-key.pem \
-config=config.json -profile=server \
app-csr.json | cfssljson -bare app

