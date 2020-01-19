import boto3


class Py3status:

    def _get_metric(self):
        # AWS/ELB:LoadBalancerName:RoutersDevBalancer:HealthyHostCount:60:Average
        (namespace, name, value, metric, period, stat) = self.metric.split(':')
        client = boto3.client('cloudwatch')
        response = client.get_metric_statistics(
            Namespace=namespace,
            Dimensions=[
                {
                    'Name': name,
                    'Value': value
                }
            ],
            MetricName=metric,
            StartTime="2017-07-04T10:00:00Z",
            EndTime="2017-07-04T10:01:00Z",
            Period=int(period), 
            Statistics=[stat]
        )
        return response['Datapoints'][0][stat]

    def cloud_watch(self):
        value = self._get_metric()
        response = {
            'full_text': self.py3.safe_format(
                self.format, dict(integer=int(value))
            ),
            'cache_until': self.py3.time_in(300)
        }
        return response


if __name__ == '__main__':
  P3 = Py3status()
  P3.metric = "AWS/ELB:LoadBalancerName:RoutersDevBalancer:HealthyHostCount:60:Average"
  print P3.get_metric()
