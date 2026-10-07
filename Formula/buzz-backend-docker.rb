class BuzzBackendDocker < Formula
  desc "Run Buzz agents on your own server: remote-agent backend for any Docker host"
  homepage "https://github.com/abipalli/buzz-backend-docker"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.0/buzz-backend-docker-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "6e356dcd49f139e00cc9ab3f37ecbbf7abd96de1e09f7be3349e67dbe47900ea"
    end
    on_intel do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.0/buzz-backend-docker-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "a570c933f9af25c11be2b029a66e1bfbcf7f311266168a806afd9ac85aee66e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.0/buzz-backend-docker-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e60c6e083e5f4e1c63b9e96093cef05388246c0b740f4c6d49ba6732cc4e621e"
    end
    on_intel do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.0/buzz-backend-docker-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "01c2cd6937df242d08ba1359e99fa28fe684a1332926b19031dfe900fb17b8ba"
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
