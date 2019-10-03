use Bootleg.DSL
alias Bootleg.{UI}

# Configure the following roles to match your environment.
# `build` defines what remote server your distillery release should be built on.
#
# Some available options are:
#  - `user`: ssh username to use for SSH authentication to the role's hosts
#  - `password`: password to be used for SSH authentication
#  - `identity`: local path to an identity file that will be used for SSH authentication instead of a password
#  - `workspace`: remote file system path to be used for building and deploying this Elixir project

#role :build, "default_build.example.com", workspace: "/tmp/bootleg/build"

task :reset_remote, override: true do
  def_refspec =
    case System.cmd("git", ["rev-parse", "--abbrev-ref", "HEAD"]) do
      {hash, 0} ->
        String.trim(hash)
      _ ->
        "master"
    end

  new_refspec = UI.prompt("Please enter branch (#{def_refspec}):")
  refspec =
    if String.trim(new_refspec) == "" do
      def_refspec
    else
      new_refspec
    end

  config(:refspec, refspec)

  UI.info("Resetting remote hosts to refspec \"#{refspec}\"")

  remote :build do
    "git reset --hard #{refspec}"
  end
end
