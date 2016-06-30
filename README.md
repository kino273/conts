## containers for otp, ghc...


### start service

    % docker-compose up -d <ghc|otp|...>


### login

    % ssh -p4222 worker@localhost

### stop and rm service

    % docker-compose stop; docker-compose rm -f

### copy otp and activate

    % docker-compose run --rm otpcopy
    % . /usr/local/docker/erl.VERSION/activate


