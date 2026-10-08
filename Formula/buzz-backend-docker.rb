class BuzzBackendDocker < Formula
  desc "Run Buzz agents on your own server: remote-agent backend for any Docker host"
  homepage "https://github.com/abipalli/buzz-backend-docker"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.1/buzz-backend-docker-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "a093b11e8e0fd59878c55e9d1afb9dcb6923853827a17447d9105ab780937027"
    end
    on_intel do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.1/buzz-backend-docker-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "3258b35d2d27b8d51f4f265b3c903752875d3848da182e25dc7a6698c4093e86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.1/buzz-backend-docker-v0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ffa18f3499358bc8a8e268e9f2f5a2994483ff3052554bbf9a07e7839d233d34"
    end
    on_intel do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.1/buzz-backend-docker-v0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8fed866ec3f8aa3b24bc428901f5980e46b1c1c229066a2ef1596753a7524e42"
    end
  end

  def install
    bin.install "buzz-backend-docker"
  end

  def caveats
    <<~EOS
      Finish with one command (links the provider where Buzz Desktop looks and
      checks your server):

        buzz-backend-docker setup ssh://you@your-server
    EOS
  end

  test do
    assert_match '"protocol_version":1', pipe_output(bin/"buzz-backend-docker", '{"op":"info"}')
  end
end
