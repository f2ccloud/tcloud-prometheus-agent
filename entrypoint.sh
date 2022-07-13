[ -z "$instanceID" ] && echo "instanceID is empty" && exit 1
[ -z "$agentID" ] && echo "agentID is empty" && exit 1
[ -z "$region" ] && echo "region is empty" && exit 1
[ -z "$secretID" ] && echo "secretID is empty" && exit 1
[ -z "$secretKey" ] && echo "secretKey is empty" && exit 1

export TENCENTCLOUD_SECRET_ID=$secretID
export TENCENTCLOUD_SECRET_KEY=$secretKey

/usr/bin/prometheus --agent.enable-sidecar --tencent.agent-id=${agentID} --tencent.instance-id=${instanceID} --tencent.endpoint=monitor.tencentcloudapi.com  --tencent.region=${region} --config.file=/etc/prometheus/prometheus.yml
