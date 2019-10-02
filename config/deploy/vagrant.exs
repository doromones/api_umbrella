use Bootleg.DSL

config(:build_type, :local)

config(:app, :auth)
config(:version, "0.1.0")
config(:release_args, ["--name=#{config(:app)}"])

#role :build, "build.example.com", workspace: "/tmp/bootleg/build"
