# Build docker image
```
docker build -t crystal-http:0.1 .
docker build -f <Dockerfile> ...
```

# Run image
```
docker run --rm -p 8080:8080 crystal-http:0.1
docker run -p <host:container>
```

Crystal is compiled, and can be statically linked.
However, it is easier to just copy and link all libraries.
Static linking only works for Alpine right now.

See: https://dev.to/franciscello/a-crystal-story-a-container-that-sails-1d37
See: https://gist.github.com/bcardiff/85ae47e66ff0df35a78697508fcb49af?permalink_comment_id=2261984
