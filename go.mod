module github.com/sbezverk/rt-processor

go 1.14

require (
	github.com/arangodb/go-driver v0.0.0-20200723181325-00bb68360c88
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
	github.com/sbezverk/jalapeno-gateway v0.0.0-00010101000000-000000000000 // indirect
)

replace github.com/sbezverk/jalapeno-gateway => ../jalapeno-gateway
