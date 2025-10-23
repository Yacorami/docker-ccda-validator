# docker-ccda-validator

CCDA Validator in a docker container (Supports up to USCDI V3)

## What You'll need

1. Docker

##  Usage

```
git clone https://github.com/Yacorami/docker-ccda-validator.git uscdiv3-validator
```
```
cd uscdiv3-validator
```
```
docker build -t docker-ccda-validator .
```
```
docker run -dp 8088:8080 docker-ccda-validator
```

Go to : http://localhost:8088/referenceccdaservice/static/validationui.html
