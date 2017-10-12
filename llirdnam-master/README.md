# llirdnam
llirdnam is an application that mimicks Mandrill's webhook events for local testing.

## Development
1. Install this to your `$GOPATH`.
2. Run `go run listener.go` in one cmd tab.
3. Run `go run llirdnam.go http://localhost:4000` in another tab.
4. Look at the output of the listener to see the amazing output of llirdnam.

## Generating binaries
1. Install and configure [gox](https://github.com/mitchellh/gox)
2. Run `gox -osarch="linux/amd64 windows/amd64 darwin/amd64"` in the directory of the go app you want to compile.
3. Move the binaries to the right place.
