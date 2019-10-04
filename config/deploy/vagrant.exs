use Bootleg.DSL

config(:build_type, :remote)

config(:app, :auth)
config(:version, "0.1.0")
config(:release_args, ["--name=#{config(:app)}"])

role :build,
     "192.168.33.9",
     user: "vagrant",
     identity: "#{File.cwd!}/ansible/.vagrant/machines/apiumbrella-build/virtualbox/private_key",
     workspace: "/tmp/build/auth",
     silently_accept_hosts: true
