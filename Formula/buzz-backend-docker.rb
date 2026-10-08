class BuzzBackendDocker < Formula
  desc "Run Buzz agents on your own server: remote-agent backend for any Docker host"
  homepage "https://github.com/abipalli/buzz-backend-docker"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.2/buzz-backend-docker-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "2e0e12139f5fa4aedfdaa299f5bb3a82ea3ab4e27c4e030c490e460f918b18cd"
    end
    on_intel do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.2/buzz-backend-docker-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "4fe8056bb0296f2849adef18a2dd7bf91a2fe12e086dea49463a21168db824af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.2/buzz-backend-docker-v0.2.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "959f6176d6e13436013ff7c38df477acf0743ce6906bd2530981d4c14804393b"
    end
    on_intel do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.2/buzz-backend-docker-v0.2.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "365d63668bbed36b81981ac5b103c519279f04c88236ea29ef33e802d54116bd"
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
